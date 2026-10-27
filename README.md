# Prolog lab with Docker Compose: facts, rules, lists and backtracking in SWI-Prolog

[English](README.md) | [Français](README.fr.md) | [Español](README.es.md) | [日本語](README.ja.md) | [Deutsch](README.de.md)

[![check](https://github.com/mitsurutech/lab-prolog-lab/actions/workflows/check.yml/badge.svg)](https://github.com/mitsurutech/lab-prolog-lab/actions/workflows/check.yml)

A ready-made lab for classrooms, from the [MitsuruTech Learning Platform](https://mitsurutech.co.uk/learning), where schools, colleges and universities give every student their own databases, containers and terminal in the browser. It is a ready-made SWI-Prolog lab: three small files of facts, family rules and list programs, and a terminal to ask Prolog questions about them.

It is one `docker-compose` file, `compose.yaml`, and it runs the same on your own machine as it does on the platform, where every student gets a private copy with no way out to the internet.

## Using it on the platform

**To try it:** open the [container page](https://mitsurutech.co.uk/container), find this lab in **Sample labs** and press Start. It needs a free account.

**To set it as work for a class:**

1. In your module, make a task of type **Lab** and choose **In a GitHub repository**.
2. Give `https://github.com/mitsurutech/lab-prolog-lab` with the branch `main`. The compose file is the default, `compose.yaml`. Fork the repository first if you want to change it.
3. Publish. Every student's copy starts from the commit you published, so a later change here does not alter a lab already set.

The help manual's [page for this lab](https://mitsurutech.co.uk/help/lab-prolog-lab) and its [guide to container labs](https://mitsurutech.co.uk/help/labs) cover the rest. The matching basic lesson is **Prolog Basics**, and the lab is worked in the undergraduate module [Logic and functional programming](https://mitsurutech.co.uk/resources/university/logic-functional). No college account yet? [Your first year is free](https://mitsurutech.co.uk/pricing) for up to 50 students, and [signing up](https://mitsurutech.co.uk/signup) takes an email address.

## Running it on your own machine

You need Docker with the Compose plugin. The lab has no web page: use its terminal.

```bash
docker compose up -d
docker compose exec prolog swipl -q -g "member(X, [a, b, c]), write(X), nl" -t halt
```

Stop it with `docker compose down`, and remove its files as well with `docker compose down -v`. The lab writes its teaching files to a volume only the first time, so a student's edits survive a stop and a start.

## What does not work in a lab

The lab has no way out to the internet, so nothing can be installed or downloaded into it. Everything the tools print is in English. The comment at the top of `compose.yaml` says what the lab is and what it is not.

## Checking the lab

`test/check.sh` starts the lab the way the platform's runner starts every service (all capabilities dropped, `no-new-privileges`, a process limit, memory limits, and no way out to the internet) and then checks that the lab does what its compose file says. It needs Docker and runs on every push, which is the badge at the top.

```bash
test/check.sh
```

## Licence

This work is licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). You may share it and adapt it for learning and teaching, if you credit Mitsuru Technologies Ltd, do not use it commercially, and share anything you make from it under the same licence. The full text is in the `LICENSE` file.

## About

Made by [Mitsuru Technologies](https://mitsurutech.co.uk) for the [MitsuruTech Learning Platform](https://mitsurutech.co.uk/learning): Python, Java, Go, Node, SQL and Linux in the browser for schools and colleges, with container labs, web apps deployed from GitHub, and quizzes that mark themselves. Try code with no account in the [playground](https://mitsurutech.co.uk/playground).

More labs from the same place: [lab-haskell-lab](https://github.com/mitsurutech/lab-haskell-lab), [lab-quantum-sim](https://github.com/mitsurutech/lab-quantum-sim), [lab-jupyter-data](https://github.com/mitsurutech/lab-jupyter-data) and [lab-git-gitea](https://github.com/mitsurutech/lab-git-gitea).
