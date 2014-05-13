# 環境

* Ruby
 * ruby-2.0.0p451
* Ruby on Rails
 * Rails 4.1.0
* DB
 * PostgreSQL 9.3.4

# 起動の仕方

環境変数にアプリのIDとシークレットキーを入れてサーバーを起動する．

``
$ export FACEBOOK_APP_ID="FacebookAppのID"
$ export FACEBOOK_APP_SECRET="FacebookAppのシークレットキー"
``

# このアプリの動き

Deviseとomniauth-facebookを使って，Facebook認証を行うだけ．
