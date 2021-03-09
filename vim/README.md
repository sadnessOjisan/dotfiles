# nvim config

## how to configure

install nvim

```
brew install neovim
```

configure

```
cp vim/init.vim ~/.config/nvim/init.vim
```

vim plug

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## TODO

- [ ] LSP経由で補完
- [ ] ファイラ
- [ ] ファインダー
- [ ] カッコ補完
- [ ] コメント補完