# config files that should be placed at your home directory (~/)

#概要(outline)
*ホームディレクトリに置く ~/.なんとかrc のようなファイル

#各ファイルの説明
## .bashrc-extra
~/.bashrc の末尾に追加する。
 cat .bashrc-extra >> ~/.bashrc

#おまけ(extra)
以下、テスト領域。
```c++
float ave (int dat[], int num) {
      int sum=0, i;
      for (i=0; i<num; i++) sum += dat[i];
      return (((float)sum)/num);
}
```
