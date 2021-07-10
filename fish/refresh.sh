rm -rf ~/.config/fish/**
cp -r fish/config.fish ~/.config/fish
curl -sL https://git.io/fisher | source
fisher install jorgebucaran/fisher
cp -r fish/fish_plugins ~/.config/fish
fisher update