## fish setting

fish config is `~/.config/fish`

```
cp fish/{config.fish,fish_plugins} ~/.config/fish
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

### install Node.js

jorgebucaran/nvm.fish is nvm wrapper.

```
nvm install v12
```

set Node default version

```
set --universal nvm_default_version v12
```
