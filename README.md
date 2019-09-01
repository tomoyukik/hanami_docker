# Hanamiアプリケーション開発用のDocker環境

Hanamiのアプリケーション開発用のDocker環境。
`hanami_docker`ディレクトリがアプリケーションルートになるので、clonesするときはアプリケーション名を指定してクローンする。

```
$ git clone https://github.com/tomoyukik/hanami_docker.git ~/app
```

## ディレクトリの構成

```sh:ディレクトリ構成
app/
├── README.md
├── docker/
│   ├── Dockerfile
│   ├── entrypoint.sh
│   └── test.yml
├── docker-compose-dev.yml
├── docker-compose.yml
└── docker-sync.yml
```

## 各ファイルについて

- `docker/Dockerfile`
  - hanami image作成のためのDockerfile
- `entrypoint.sh`
  - imageの作成に使う
- `docker-compose.yml`
  - アプリケーションのコンテナを起動するために使うcomposeファイル
- `docker-compose-dev.yml`
  - docker-sync.ymlのvolumeを使うためのcomposeファイル
- `docker/test.yml`
  - test環境のためのcomposeファイル
- `docker-sync.yml`
  - docker-syncを起動するためのsyncファイル

## アプリの作成の仕方

この環境をそのまま使うと、アプリケーションの名前が`app`になるので、各ファイルを適宜書き換える必要がある。

### 1. イメージの作成

```
$ docker-compose build
```

### 1.5. `docker-sync`を使う場合は`docker-sync`を起動

```
$ docker-sync start
```

### 2. アップリケーションの作成

```sh:Terminal
$ docker-compose run --rm app bundle init
$ vim Gemfile
```

```ruby:Gemfile
# gem 'hanami'
```

```sh:Terminal
$ docker-compose run --rm app bundle install
$ docker-compose run --rm app bundle exec hanami new .
$ docker-compose run --rm app bundle update
```

`docker-sync`を使う場合は`docker-compose`を`docker-compose -f docker-compose.yml -f docker-compose-dev.yml`で置き換える。
