## fish setting

fish config is `~/.config/fish`

```
cp fish/* ~/.config/fish
```

### use plugin manager [fisher](https://github.com/jorgebucaran/fisher)

use [fisher](https://github.com/jorgebucaran/fisher).

install

```
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

copy plugins. the configure is fish/fish_plugins 

```
cp fish/* ~/.config/fish
```

apply plugin

```
fisher update
```

### install peco

oh-my-fish/plugin-peco depends on peco.

```
brew install peco
```