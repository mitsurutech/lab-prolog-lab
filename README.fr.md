# Laboratoire Prolog avec Docker Compose : faits, règles, listes et retour arrière avec SWI-Prolog

[English](README.md) | [Français](README.fr.md) | [Español](README.es.md) | [日本語](README.ja.md) | [Deutsch](README.de.md)

[![check](https://github.com/mitsurutech/lab-prolog-lab/actions/workflows/check.yml/badge.svg)](https://github.com/mitsurutech/lab-prolog-lab/actions/workflows/check.yml)

Un laboratoire clé en main pour la classe, issu de la [MitsuruTech Learning Platform](https://mitsurutech.co.uk/learning), où les lycées, les établissements d'enseignement supérieur et les universités donnent à chaque élève ses propres bases de données, ses conteneurs et son terminal dans le navigateur. C'est un laboratoire SWI-Prolog prêt à l'emploi : trois petits fichiers de faits, de règles de parenté et de programmes sur les listes, et un terminal pour poser des questions à Prolog à leur sujet.

Il tient dans un seul fichier `docker-compose`, `compose.yaml`, et fonctionne de la même façon sur votre machine que sur la plateforme, où chaque élève a sa copie privée sans aucune sortie vers Internet.

## Utilisation sur la plateforme

**Pour l'essayer :** ouvrez la [page des conteneurs](https://mitsurutech.co.uk/container), trouvez ce laboratoire dans **Sample labs** et cliquez sur Start. Un compte gratuit est nécessaire.

**Pour le donner comme travail à une classe :**

1. Dans votre module, créez une tâche de type **Lab** et choisissez **In a GitHub repository**.
2. Indiquez `https://github.com/mitsurutech/lab-prolog-lab` avec la branche `main`. Le fichier compose est celui par défaut, `compose.yaml`. Faites d'abord une copie (fork) du dépôt si vous voulez le modifier.
3. Publiez. La copie de chaque élève part du commit que vous avez publié : une modification ultérieure ici ne change donc pas un laboratoire déjà donné.

La [page de ce laboratoire](https://mitsurutech.co.uk/help/lab-prolog-lab) dans le manuel d'aide et son [guide des laboratoires de conteneurs](https://mitsurutech.co.uk/help/labs) disent le reste. La leçon de base correspondante est **Prolog Basics**, et le laboratoire est travaillé dans le module de licence [Logic and functional programming](https://mitsurutech.co.uk/resources/university/logic-functional). Pas encore de compte pour votre établissement ? [Votre première année est gratuite](https://mitsurutech.co.uk/pricing) jusqu'à 50 élèves, et [l'inscription](https://mitsurutech.co.uk/signup) demande seulement une adresse e-mail.

## L'exécuter sur votre propre machine

Il vous faut Docker avec le plugin Compose. Le laboratoire n'a pas de page web : utilisez son terminal.

```bash
docker compose up -d
docker compose exec prolog swipl -q -g "member(X, [a, b, c]), write(X), nl" -t halt
```

Arrêtez-le avec `docker compose down`, et supprimez aussi ses fichiers avec `docker compose down -v`. Le laboratoire n'écrit ses fichiers pédagogiques dans un volume que la première fois : les modifications d'un élève survivent donc à un arrêt et à un redémarrage.

## Ce qui ne fonctionne pas dans un laboratoire

Le laboratoire n'a aucune sortie vers Internet : rien ne peut donc y être installé ni téléchargé. Tout ce qu'affichent les outils est en anglais. Le commentaire en tête de `compose.yaml` explique ce qu'est le laboratoire et ce qu'il n'est pas.

## Vérifier le laboratoire

`test/check.sh` démarre le laboratoire comme l'exécuteur de la plateforme démarre chaque service (toutes les capacités retirées, `no-new-privileges`, une limite de processus, des limites de mémoire et aucune sortie vers Internet), puis vérifie que le laboratoire fait ce que dit son fichier compose. Il demande Docker et s'exécute à chaque push, ce que montre le badge en haut.

```bash
test/check.sh
```

## Licence

Cette œuvre est placée sous licence [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). Vous pouvez la partager et l'adapter pour apprendre et enseigner, à condition de citer Mitsuru Technologies Ltd, de ne pas l'utiliser à des fins commerciales et de partager tout ce que vous en tirez sous la même licence. Le texte complet se trouve dans le fichier `LICENSE`.

## À propos

Réalisé par [Mitsuru Technologies](https://mitsurutech.co.uk) pour la [MitsuruTech Learning Platform](https://mitsurutech.co.uk/learning) : Python, Java, Go, Node, SQL et Linux dans le navigateur pour les écoles et les établissements, avec des laboratoires de conteneurs, des applications web déployées depuis GitHub et des quiz qui se corrigent seuls. Essayez du code sans compte dans le [playground](https://mitsurutech.co.uk/playground).

D'autres laboratoires du même endroit : [lab-haskell-lab](https://github.com/mitsurutech/lab-haskell-lab), [lab-quantum-sim](https://github.com/mitsurutech/lab-quantum-sim), [lab-jupyter-data](https://github.com/mitsurutech/lab-jupyter-data) et [lab-git-gitea](https://github.com/mitsurutech/lab-git-gitea).
