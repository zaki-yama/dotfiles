# dotfiles

## セットアップ（mise bootstrap）

前提として [mise](https://mise.jdx.dev/) がインストールされていること。`bootstrap`サブコマンドは比較的新しい機能のため、古いバージョンだと存在しない。

```bash
# miseが未インストールの場合
curl https://mise.run | sh

# bootstrapサブコマンドがない場合は更新
mise self-update
```

リポジトリをクローンする（場所は任意。`mise.toml`内の各`source`はこのファイル自身からの相対パスで解決されるため、どこにcloneしても動く）。

```bash
git clone https://github.com/zaki-yama/dotfiles.git
cd dotfiles
```

反映内容を確認してから適用する。

```bash
# 何が変更されるか確認（何も書き込まない）
mise bootstrap dotfiles apply --dry-run

# 適用状況の一覧
mise bootstrap dotfiles status

# 実際に適用（各種設定ファイルをホームディレクトリへシンボリックリンク）
mise bootstrap dotfiles apply
```

`mise.toml`の`[dotfiles]`に列挙されているファイルが、それぞれの対象パスへシンボリックリンクされる。リンク先に同名の実ファイルが既にある場合は上書きされず、確認を求められる（`--force`で強制上書き可能）。

新しく管理対象のファイルを追加する場合:

```bash
mise bootstrap dotfiles add --mode symlink --source <リポジトリ内の相対パス> <対象パス>
```

### Homebrewパッケージ・macOS設定

`[bootstrap.packages]`にHomebrewパッケージ、`[bootstrap.macos.defaults]`にmacOSの`defaults write`相当を宣言している（旧`Brewfile`/`setup.sh`はここに統合し削除した）。

```bash
# Homebrewパッケージのインストール状況確認・適用
mise bootstrap packages status
mise bootstrap packages apply

# macOSのdefaults設定状況確認・適用
mise bootstrap macos defaults status
mise bootstrap macos defaults apply
```

`dotfiles`/`packages`/`macos defaults`をまとめて実行したい場合は`mise bootstrap`（フル実行）を使う。

## セットアップ（従来のスクリプト、代替手段）

`mise`を使わない場合は`symlinks.sh`でも同じファイル群をシンボリックリンクできる。スクリプト自身の場所からリポジトリパスを解決するため、こちらもclone場所は任意。

```bash
./symlinks.sh
```

両者は同じファイル群を対象にしており、並行運用している。
