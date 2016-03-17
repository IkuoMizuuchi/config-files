# config files that should be placed at your home directory (~/)

## 概要(outline)
* ホームディレクトリに置く ~/.なんとかrc のようなファイル
* 便利なシェルスクリプト（コマンド）数種

## 各ファイルの説明
### .bashrc-extra
* インストール方法
    - ~/.bashrc の末尾に追加する。

```sh
  cat .bashrc-extra >> ~/.bashrc
```

* 内容
    - ~/.bash_aliases があれば読み込む。
    - ~/.my-settings があれば読み込む。

### .my-settings
* インストール方法
    - ホームディレクトリにシンボリックリンクを張る
    - 以下は`~/config-files/`に`clone`したときの例

```sh
  ln -s ~/config-files/.my-settings ~
```

* 内容
    - OS に応じた環境変数の設定を行う。

### .bash_aliases
* インストール方法
    - ホームディレクトリにシンボリックリンクを張る
    - `ikuo_rm`, `ikuo_unrm`, `cp_date` のインストールが必要

```sh
  ln -s ~/config-files/.bash_aliases ~
  cp ikuo_rm ikuo_unrm cp_date /usr/local/bin/    ##アップデートに対応するためにシンボリックリンクでもOK
  mkdir ~/.trash
  chmod go-rwx ~/.trash     ##ゴミ箱の中は他人には見えないようにする。  
```

* 内容
    - bash のエイリアス設定

### .emacs
* インストール方法
    - ホームディレクトリにシンボリックリンクを張る

```sh
  ln -s ~/config-files/.emacs ~
```

* 内容
    - Emacs の設定

## おまけ(extra)
以下、テスト領域。

```c++
float ave (int dat[], int num) {
      int sum=0, i;
      for (i=0; i<num; i++) sum += dat[i];
      return (((float)sum)/num);
}
```