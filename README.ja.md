# Docker Compose で学ぶ Prolog ラボ：SWI-Prolog による事実、規則、リスト、バックトラック

[English](README.md) | [Français](README.fr.md) | [Español](README.es.md) | [日本語](README.ja.md) | [Deutsch](README.de.md)

[![check](https://github.com/mitsurutech/lab-prolog-lab/actions/workflows/check.yml/badge.svg)](https://github.com/mitsurutech/lab-prolog-lab/actions/workflows/check.yml)

[MitsuruTech Learning Platform](https://mitsurutech.co.uk/learning) の授業向けにすぐ使えるラボです。このプラットフォームでは、学校や大学が生徒一人ひとりに専用のデータベース、コンテナ、ブラウザ上のターミナルを提供できます。これは SWI-Prolog のラボで、事実、家族関係の規則、リスト処理のプログラムを収めた 3 つの小さなファイルと、Prolog に質問するためのターミナルが入っています。

Docker Compose ファイル（`compose.yaml`）1 つだけででき、お手元のパソコンでもプラットフォーム上でも同じように動きます。プラットフォームでは、生徒一人ひとりが専用のコピーを使い、インターネットへの接続はありません。

## プラットフォームでの使い方

**試すには：** [コンテナのページ](https://mitsurutech.co.uk/container)を開き、**Sample labs**（サンプルラボ）からこのラボを見つけて Start を押します。無料アカウントが必要です。

**クラスの課題として出すには：**

1. モジュールで、種類が **Lab** のタスクを作り、**In a GitHub repository** を選びます。
2. `https://github.com/mitsurutech/lab-prolog-lab` とブランチ `main` を指定します。Compose ファイルは既定の `compose.yaml` です。変更したい場合は、先にリポジトリをフォークしてください。
3. 公開（Publish）します。生徒のコピーはどれも、公開したコミットから始まるため、あとでここを変更しても、すでに出したラボは変わりません。

ヘルプマニュアルの[このラボのページ](https://mitsurutech.co.uk/help/lab-prolog-lab)と[コンテナラボのガイド](https://mitsurutech.co.uk/help/labs)に残りの説明があります。対応する基礎レッスンは **Prolog Basics** で、このラボは大学レベルのモジュール[Logic and functional programming](https://mitsurutech.co.uk/resources/university/logic-functional)の中で扱われます。まだ学校のアカウントがありませんか。[最初の 1 年は無料](https://mitsurutech.co.uk/pricing)（50 人まで）で、[登録](https://mitsurutech.co.uk/signup)にはメールアドレスだけが必要です。

## お手元のパソコンで動かす

Docker と Compose プラグインが必要です。このラボには Web ページはありません。ラボのターミナルを使います。

```bash
docker compose up -d
docker compose exec prolog swipl -q -g "member(X, [a, b, c]), write(X), nl" -t halt
```

停止するには `docker compose down`、ファイルも削除するには `docker compose down -v` を使います。このラボは、教材ファイルを最初の 1 回だけボリュームに書き込むので、生徒が編集した内容は、停止して再び起動しても残ります。

## ラボで動かないこと

このラボにはインターネットへの接続がないため、何かをインストールしたりダウンロードしたりすることはできません。ツールが表示するものはすべて英語です。ラボが何であり、何ではないかは、`compose.yaml` の先頭のコメントに書かれています。

## ラボの検証

`test/check.sh` は、プラットフォームのランナーがすべてのサービスを起動するのと同じ方法（すべてのケーパビリティを削除、`no-new-privileges`、プロセス数の上限、メモリの上限、インターネットへの接続なし）でラボを起動し、そのラボが Compose ファイルに書かれたとおりに動くかを確認します。Docker が必要で、プッシュのたびに実行されます。先頭のバッジがその結果です。

```bash
test/check.sh
```

## ライセンス

この作品は [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) でライセンスされています。Mitsuru Technologies Ltd のクレジットを表示し、商用には使わず、これをもとに作ったものを同じライセンスで共有するなら、学習と教育のために共有・改変できます。全文は `LICENSE` ファイルにあります。

## このリポジトリについて

[Mitsuru Technologies](https://mitsurutech.co.uk) が [MitsuruTech Learning Platform](https://mitsurutech.co.uk/learning) のために作りました。学校や大学向けに、Python、Java、Go、Node、SQL、Linux をブラウザで学べ、コンテナラボ、GitHub からデプロイする Web アプリ、自動採点のクイズを備えています。[プレイグラウンド](https://mitsurutech.co.uk/playground)では、アカウントなしでコードを試せます。

同じところから出ている他のラボ：[lab-haskell-lab](https://github.com/mitsurutech/lab-haskell-lab)、[lab-quantum-sim](https://github.com/mitsurutech/lab-quantum-sim)、[lab-jupyter-data](https://github.com/mitsurutech/lab-jupyter-data)、[lab-git-gitea](https://github.com/mitsurutech/lab-git-gitea)。
