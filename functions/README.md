# Zsh Custom Functions

このリポジトリは、Zshの `autoload` 機能を利用した自作ビルトイン関数を管理するためのものです。
通常のエイリアスやスクリプトとは異なり、シェルのカレントプロセス内で実行されるため、`cd` などのシェル内部状態を操作するコマンドも正常に動作します。

## 構成

- `functions/`: 自作関数の置き場。ファイル名がそのままコマンド名になります。

## インストール・セットアップ

### 1. リポジトリのクローン

任意の場所にクローンします（例: `~/.zsh/functions`）。

```bash
mkdir -p ~/.zsh
git clone [https://github.com/YOUR_USERNAME/zsh-functions.git](https://github.com/YOUR_USERNAME/zsh-functions.git) ~/.zsh/zsh-functions

```
## 動作確認（Builtin判定）

セットアップ後、作成した関数が正しく「シェル関数（現在のプロセスで実行される状態）」として認識されているか確認するには、`type` コマンドを使用します。

```zsh
type mkcd
```
