git config --global push.default simple
# コミットメッセージ編集用エディタの設定
git config --global core.editor vim
# 日本語ファイル名の文字化け回避
git config --global core.quotepath false
# https の場合に認証情報を PC にキャッシュする (mac の場合)
git config --global credential.helper osxkeychain

git config --global alias.st status
git config --global alias.fe fetch --prune
git config --global alias.graph "log --graph --date-order --all --pretty=format:'%h %Cred%d %Cgreen%ad %Cblue%cn %Creset%s' --date=short"

# ref. http://qiita.com/kyanny/items/10a57a4f1d2806e3a3b8
git config --global alias.delete-merged-branches '!git branch --merged | grep -v \* | xargs -I % git branch -d %'
