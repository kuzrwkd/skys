# SKYS（相場観察予想システム）

## dashboard立ち上げ手順

① dashboardをlocalhostで立ち上げる  
`make dashboard`

② 下記コマンドでtokenを生成し、コピーしておく  
`kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"`

③ dashboardをブラウザで開いて「トークン」が選択されている事を確認し、コピーしたtokenをフォームへ入力してサインインする  
`open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/`