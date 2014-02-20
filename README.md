Phoga

Ruby on Railsで動くブログツールです

Getting started
=====

Gemfileに以下を追加します（Rails 4.0以降が必須）

```
gem 'phoga', github: 'halenohi/phoga'
```

bundlerを使ってgemをインストールします

インストールが出来たら各ファイルに設定を追加してください

```
# db/seeds.rb
Phoga::Engine.load_seed
```

```
# config/routes.rb
mount Phoga::Engine, at: '/admin'
```

設定を追加したら以下のコマンドでDBを構築し初期データを投入します

```
$ bundle exec rake phoga:install:migrations
$ bundle exec rake db:migrate
$ bundle exec rake db:seed
```

DBの構築が出来たらサーバーを起動して管理画面にログインしてください

```
$ bundle exec rails server
$ open http://localhost:3000/admin
```

初期時のユーザーは ```sample@example.com``` パスワードは ```samplepass``` でログインできます

Contribution
============

githubからレポジトリをクローンし、bundlerでgemをインストールしてください

```
$ cd path/to/workspace
$ git clone https://github.com/halenohi/phoga.git
$ bundle install --path vendor/bundle
```

```spec/dummy``` ディレクトリにあるダミーアプリを起動できます

```
$ cd spec/dummy
$ bundle exec rails server
$ open http://localhost:3000
```
