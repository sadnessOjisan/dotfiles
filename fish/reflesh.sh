rm -rf ~/.config/fish
mkdir -p ~/.config/fish
cp -rf ./fish/config/ ~/.config/fish/conf.d
cp -f ./fish/plugin/fish_plugins ~/.config/fish/fish_plugins
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fish
fisher update