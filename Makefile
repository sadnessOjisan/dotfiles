SHELL=/bin/zsh

.PHONY: nvim
nvim:
	sh nvim/install-plugin-manager.sh
	if [ ! -d ${HOME}/.config/nvim ]; then mkdir -p ${HOME}/.config/nvim; fi
	ln -s -f ${PWD}/nvim/init.vim ${HOME}/.config/nvim/init.vim
	ln -s -f ${PWD}/nvim/coc-config.json ${HOME}/.config/nvim/coc-config.json

.PHONY: brew
brew:
	sh brew/install.sh
	brew tap Homebrew/bundle
	brew bundle --file "brew/Brewfile"
	
.PHONY: zsh-conf
zsh-conf:
	ln -sf ${PWD}/.zshenv ${HOME}/.zshenv
	mkdir -p ${HOME}/.zsh
	ln -sf ${PWD}/zsh/.zshenv ${HOME}/.zsh/.zshenv
	if [ ! -e ${HOME}/.zsh/.zshenv.local ]; then ln -sf ${PWD}/zsh/.zshenv.local ${HOME}/.zsh/.zshenv.local; fi
	ln -sf ${PWD}/zsh/.zshrc ${HOME}/.zsh/.zshrc
	if [ ! -e ${HOME}/.zsh/.zshrc.local ]; then ln -sf ${PWD}/zsh/.zshrc.local ${HOME}/.zsh/.zshrc.local; fi
	ln -sf ${PWD}/zsh/.zprofile ${HOME}/.zsh/.zprofile
	if [ ! -e ${HOME}/.zsh/.zprofile.local ]; then ln -sf ${PWD}/zsh/.zprofile.local ${HOME}/.zsh/.zprofile.local; fi
	ln -sf ${PWD}/zsh/scripts ${HOME}/.zsh/

.PHONY: zsh-plugin
zsh-plugin: 
	sh ${PWD}/zsh/install-plugin.sh

.PHONY: zsh
zsh: zsh-plugin zsh-conf

.PHONY: starship
starship: 
	curl -sS https://starship.rs/install.sh | sh

.PHONY: alacritty
alacritty:
	if [ ! -d ${HOME}/.config/alacritty ]; then mkdir -p ${HOME}/.config/alacritty; fi
	ln -s -f ${PWD}/alacritty/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml

.PHONY: starship_conf
starship_conf: 
	if [ ! -d ${HOME}/.config ]; then mkdir -p ${HOME}/.config; fi
	ln -s -f ${PWD}/starship/starship.toml ${HOME}/.config/starship.toml

.PHONY: lang
lang:
	sh ${PWD}/lang/rust/install.sh
	sh ${PWD}/lang/node/install.sh

.PHONY: tmux_conf
tmux_conf: 
	ln -sf ${PWD}/tmux/.tmux.conf ${HOME}/.tmux.conf

.PHONY: pre
pre:
	if [ ! -d /usr/local/bin ]; then sudo mkdir -p /usr/local/bin; fi

.PHONY: conf 
conf: zsh_conf zsh-plugin alacritty tmux_conf startship_conf tmux_conf

.PHONY: all
all: pre starship starship_conf nvim lang zsh brew alacritty tmux_conf
