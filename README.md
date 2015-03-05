mj-base Cookbook
=====================
サーバーに必要なアプリケーションのインストールを主に行う cookbook。

mj-base Cookbook では

* mj-baseでデフォルトで設定しているアプリケーションのインストール
* オプションとして追加でインストールしたいアプリケーションのインストール
* motd の設定（趣味）

を行っている。


Requirements
------------
motd の設定を行っている関係で common_applications['figlet'] のインストール指定は必須とする。


Attributes
----------

* node['mj-base']['common_applications'] = mj-base であらかじめ指定しているアプリケーション
* node['mj-base']['option_applications'] = オプションとして追加でインストールしたいアプリケーション

どちらに指定しても要はインストールするだけなのでどっちに指定してもいいんだけど。。。


Usage
-----

node や role にて jsonで mj-base の実行を指定

```json
{
  "name":"otokomae_node",
  "run_list": [
    "recipe[mj-base]"
  ]
}
```

attributes の指定では environments にて default, ovrerrideで指定をオススメ。

```json
{
    "name": "otokomae-env",
    "default_attributes": {
        "mj-base": {
            "override_applications": ["foo", "bar"]
        }
    },
    "override_attributes": {
        "mj-base": {
            "common_applications": ["git", "curl", "zsh"]
        },
    },
    "run_list": [
    ]
}
```

