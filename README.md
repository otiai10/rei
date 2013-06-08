#rei

- 修正たくさんして、何がmodifiedなんだっけーってなる
- git status して、ファイル名コピペして、% vi ぺーすと
- とかめんどくさい
- ので
- この「コピーしてペースト」の手間のみを省きます

#Usage

```shell
% ruby rei.rb git status

# そしたらgit statusの出力が出るので
# jk移動して編集したいファイルの上でEnter
# vimで開きます

# ほかにも

% ruby rei.rb tree -f
% ruby rei.rb grep -l hoge **/*

# など、ファイルパスを出力するコマンドなら
# なんでも繋げることがでるお（＾ω＾ ≡ ＾ω＾）
```

# おすしたべたい
.zshrc
```shell
alias rei='ruby PATH_TO/REI_RUBY/rei.rb'
```

rei
rubyでedit、それ(it)
