# Laboratorio de Prolog con Docker Compose: hechos, reglas, listas y backtracking en SWI-Prolog

[English](README.md) | [Français](README.fr.md) | [Español](README.es.md) | [日本語](README.ja.md) | [Deutsch](README.de.md)

[![check](https://github.com/mitsurutech/lab-prolog-lab/actions/workflows/check.yml/badge.svg)](https://github.com/mitsurutech/lab-prolog-lab/actions/workflows/check.yml)

Un laboratorio listo para usar en el aula, de la [MitsuruTech Learning Platform](https://mitsurutech.co.uk/learning), donde colegios, institutos y universidades dan a cada estudiante sus propias bases de datos, contenedores y terminal en el navegador. Es un laboratorio de SWI-Prolog ya preparado: tres archivos pequeños con hechos, reglas de parentesco y programas con listas, y una terminal para hacerle preguntas a Prolog sobre ellos.

Es un solo archivo `docker-compose`, `compose.yaml`, y funciona igual en tu propio equipo que en la plataforma, donde cada estudiante tiene una copia privada sin salida a internet.

## Usarlo en la plataforma

**Para probarlo:** abre la [página de contenedores](https://mitsurutech.co.uk/container), busca este laboratorio en **Sample labs** y pulsa Start. Hace falta una cuenta gratuita.

**Para ponerlo como tarea a una clase:**

1. En tu módulo, crea una tarea de tipo **Lab** y elige **In a GitHub repository**.
2. Indica `https://github.com/mitsurutech/lab-prolog-lab` con la rama `main`. El archivo compose por defecto es `compose.yaml`. Si quieres modificarlo, haz primero un fork del repositorio.
3. Publica. La copia de cada estudiante parte del commit que publicaste, de modo que un cambio posterior aquí no altera un laboratorio ya asignado.

La [página de este laboratorio](https://mitsurutech.co.uk/help/lab-prolog-lab) en el manual de ayuda y su [guía de laboratorios con contenedores](https://mitsurutech.co.uk/help/labs) explican el resto. La lección básica correspondiente es **Prolog Basics**, y el laboratorio se trabaja en el módulo universitario [Logic and functional programming](https://mitsurutech.co.uk/resources/university/logic-functional). ¿Aún no tienes una cuenta de centro? [El primer año es gratis](https://mitsurutech.co.uk/pricing) para hasta 50 estudiantes, y [registrarse](https://mitsurutech.co.uk/signup) solo requiere una dirección de correo electrónico.

## Ejecutarlo en tu propio equipo

Necesitas Docker con el plugin Compose. El laboratorio no tiene página web: usa su terminal.

```bash
docker compose up -d
docker compose exec prolog swipl -q -g "member(X, [a, b, c]), write(X), nl" -t halt
```

Páralo con `docker compose down`, y borra también sus archivos con `docker compose down -v`. El laboratorio escribe sus archivos didácticos en un volumen solo la primera vez, así que los cambios de un estudiante se conservan al parar y volver a arrancar.

## Lo que no funciona en un laboratorio

El laboratorio no tiene salida a internet, así que no se puede instalar ni descargar nada en él. Todo lo que imprimen las herramientas está en inglés. El comentario al principio de `compose.yaml` explica qué es el laboratorio y qué no es.

## Comprobar el laboratorio

`test/check.sh` arranca el laboratorio como lo hace el ejecutor de la plataforma con cada servicio (sin ninguna capability, `no-new-privileges`, un límite de procesos, límites de memoria y sin salida a internet) y después comprueba que el laboratorio hace lo que dice su archivo compose. Necesita Docker y se ejecuta en cada push, que es la insignia de arriba.

```bash
test/check.sh
```

## Licencia

Esta obra está bajo la licencia [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). Puedes compartirla y adaptarla para el aprendizaje y la enseñanza, siempre que reconozcas la autoría de Mitsuru Technologies Ltd, no la uses con fines comerciales y compartas lo que crees a partir de ella con la misma licencia. El texto completo está en el archivo `LICENSE`.

## Acerca de

Creado por [Mitsuru Technologies](https://mitsurutech.co.uk) para la [MitsuruTech Learning Platform](https://mitsurutech.co.uk/learning): Python, Java, Go, Node, SQL y Linux en el navegador para colegios e institutos, con laboratorios de contenedores, aplicaciones web desplegadas desde GitHub y cuestionarios que se corrigen solos. Prueba código sin cuenta en el [playground](https://mitsurutech.co.uk/playground).

Más laboratorios del mismo sitio: [lab-haskell-lab](https://github.com/mitsurutech/lab-haskell-lab), [lab-quantum-sim](https://github.com/mitsurutech/lab-quantum-sim), [lab-jupyter-data](https://github.com/mitsurutech/lab-jupyter-data) y [lab-git-gitea](https://github.com/mitsurutech/lab-git-gitea).
