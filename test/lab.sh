#!/usr/bin/env bash
# What the compose file's header promises, checked through docker exec, which is how the
# platform's terminal reaches the interpreter (the lab has no web page): run by check.sh.
set -euo pipefail
: "${NET:?run through test/check.sh}"
: "${CID:?run through test/check.sh}"
: "${COMPOSE_FILES:?run through test/check.sh}"
run() { docker exec "$CID" "$@"; }
# One question the way the lab's header asks it: load a file, run one goal, stop.
ask() { run swipl -q -g "$1" -t halt "$2"; }
fail() { echo "$*" >&2; exit 1; }
expect() { [ "$1" = "$2" ] || fail "wanted [$2] but got [$1]"; }

echo "- the service is healthy and runs as the unprivileged account"
test "$(docker inspect "$CID" --format '{{.State.Health.Status}}')" = healthy || fail "not healthy"
expect "$(run id -u)" 65532

echo "- the three teaching files are written to the work folder"
run ls /tmp/facts.pl /tmp/family.pl /tmp/lists.pl >/dev/null
run grep -q "^parent(tom, ann)\.$" /tmp/facts.pl

echo "- the interpreter answers with its version"
run swipl --version | grep -q "^SWI-Prolog version 9\.2\.9 "

echo "- a true question prints yes, an unprovable one prints nothing and exits 1"
expect "$(ask 'parent(tom, ann), writeln(yes)' facts.pl)" yes
set +e; out=$(ask 'parent(ann, dan), writeln(yes)' facts.pl); rc=$?; set -e
expect "$out" ""; expect "$rc" 1

echo "- a variable asks who: tom's children, and ben's parent"
expect "$(ask 'forall(parent(tom, X), writeln(X))' facts.pl)" $'ann\nben'
expect "$(ask 'forall(parent(X, ben), writeln(X))' facts.pl)" tom

echo "- a rule: tom's grandchildren are cat, dan and eve; ann's sibling is ben"
expect "$(ask 'forall(grandparent(tom, X), writeln(X))' family.pl)" $'cat\ndan\neve'
expect "$(ask 'findall(X, sibling(ann, X), L), writeln(L)' family.pl)" "[ben]"

echo "- a rule that uses itself: ancestors of tom and of ann"
expect "$(ask 'findall(X, ancestor(tom, X), L), writeln(L)' family.pl)" "[ann,ben,cat,dan,eve]"
expect "$(ask 'findall(X, ancestor(ann, X), L), writeln(L)' family.pl)" "[cat]"

echo "- the list rules: total, last_of and double"
expect "$(ask 'total([1,2,3,4], S), writeln(S)' lists.pl)" 10
expect "$(ask 'last_of([a,b,c], X), writeln(X)' lists.pl)" c
expect "$(ask 'double([1,2,3], D), writeln(D)' lists.pl)" "[2,4,6]"
expect "$(ask 'findall(C, colour(C), L), writeln(L)' facts.pl)" "[red,green,blue]"

echo "- a student's edit survives a restart, and a deleted file is written again"
run sh -c 'echo "colour(pink)." >> /tmp/facts.pl; rm /tmp/lists.pl'
run test ! -e /tmp/lists.pl
docker compose $COMPOSE_FILES restart >/dev/null 2>&1
docker compose $COMPOSE_FILES up -d --wait --wait-timeout 120 >/dev/null 2>&1
CID=$(docker compose $COMPOSE_FILES ps -q "$SVC")
expect "$(ask 'findall(C, colour(C), L), writeln(L)' facts.pl)" "[red,green,blue,pink]"
expect "$(ask 'total([1,2], S), writeln(S)' lists.pl)" 3

echo "- no way out to the internet"
test "$(docker network inspect "$NET" --format '{{.Internal}}')" = true || fail "the network is not internal"
if docker run --rm --network "$NET" lab-check-probe bash -c 'curl -s -m 4 -o /dev/null https://example.com'; then
  fail "the lab's network reached the internet"
fi
echo "  ok"
