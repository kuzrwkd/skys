# SKYS（相場観察予想システム）

## ローカル環境構築

**前提条件**
- Docker for Macがインストール済みである事
- Docker for Macでkubernetesが実行可能になっている事

① このリポジトリをclone後に実行
```
git submodule update --init --recursive
```

最初からsubmoduleも一緒にcloneするやり方

```
git clone --recursive git@github.com:kuzrwkd/skys.git
```

② 各submoduleのreadmeに書いてある通りに `.env` ファイルを作成する

③ `make build`

④ `api/node/deployment.yml` の `volumes.hostPath.path` を自分の環境へ合わせる（`app`ディレクトリまでの絶対パス）

⑤ `make apply`

## kubernetes dashboard立ち上げ手順

① localhost起動
```
make dashboard
```

② tokenを生成（コピーしておく）  
```
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
```

③ 画面を開いて「トークン」の項目が選択されている事を確認  
　 コピーしたtokenをフォームへ入力してサインインする
```
open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
```

## git submodule トラブルシューティング

**`git submodule foreach git commit` などで、既にコミット済みのmoduleがあるとそこで処理が終了する**

**対策**

`|| :` をつける

```
git submodule foreach 'git commit || :'
```