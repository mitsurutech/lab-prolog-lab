#!/usr/bin/env bash
# Starts the lab the way the platform runs it and checks it does what the README says.
#   test/check.sh
set -euo pipefail
root=$(cd "$(dirname "$0")/.." && pwd)
project="${PROJECT:-lab-check-pl2}"
override="$root/test/hardened.generated.yaml"
svc=prolog

# Every service gets the hardening, and memory-swap equal to its memory limit. The lab's named
# volume on /tmp is left exactly as the lab's own file has it: the override says nothing about
# volumes, so the unprivileged account writes to it as it does on the platform.
services=$(docker compose -f "$root/compose.yaml" config --services)
{
  cat "$root/test/hardened.yaml"
  echo "services:"
  for s in $services; do
    mem=$(docker compose -f "$root/compose.yaml" config --format json \
      | python3 -c "import json,sys; d=json.load(sys.stdin)['services']['$s']; print(((d.get('deploy') or {}).get('resources') or {}).get('limits',{}).get('memory') or 536870912)")
    printf '  %s:\n    <<: *hardened\n    hostname: %s\n    memswap_limit: %s\n' "$s" "$s" "$mem"
  done
} > "$override"

compose() { docker compose -p "$project" -f "$root/compose.yaml" -f "$override" "$@"; }
cleanup() { docker compose -p "$project" down -v --remove-orphans >/dev/null 2>&1 || true; rm -f "$override"; }
trap cleanup EXIT
docker compose -p "$project" down -v --remove-orphans >/dev/null 2>&1 || true

docker build -q -t lab-check-probe -f "$root/test/Dockerfile.probe" "$root/test" >/dev/null
compose up -d --wait --wait-timeout 300

# The hardening really took: a check that ran without it proves nothing.
for c in $(compose ps -q); do
  docker inspect "$c" --format '{{.Name}} {{.HostConfig.CapDrop}} {{.HostConfig.SecurityOpt}} {{.HostConfig.PidsLimit}} {{.HostConfig.Memory}}={{.HostConfig.MemorySwap}} user={{.Config.User}}' \
    | tee /dev/stderr | grep -q '\[ALL\] \[no-new-privileges\] 256 \([0-9]*\)=\1 user=65532$' || { echo "not hardened" >&2; exit 1; }
done
PROJECT="$project" NET="${project}_lab" SVC="$svc" CID="$(compose ps -q "$svc")" \
  COMPOSE_FILES="-p $project -f $root/compose.yaml -f $override" bash "$root/test/lab.sh"
echo "ok"
