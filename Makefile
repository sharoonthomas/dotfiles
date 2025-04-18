install: install-vim install-bash install-zsh install-psql \
         install-virtualenvwrapper \
         install-git install-python install-keybindings \
	 install-vscode

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s `pwd`/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc

install-sh:
	rm -f ~/.myprofile
	ln -s `pwd`/sh/myprofile ~/.myprofile

install-bash: install-sh
	rm -f ~/.bashrc
	ln -s `pwd`/bash/bashrc ~/.bashrc

install-zsh: install-sh
	rm -f ~/.zshrc
	ln -s `pwd`/zsh/zshrc ~/.zshrc
	ln -s `pwd`/zsh/custom ~/.zsh-custom

install-psql:
	rm -f ~/.psqlrc
	ln -s `pwd`/psql/psqlrc ~/.psqlrc

install-git:
	rm -f ~/.gitconfig
	ln -s `pwd`/git/gitconfig ~/.gitconfig
	ln -s `pwd`/git/gitignore ~/.gitignore

install-virtualenvwrapper:
	mkdir -p ~/.virtualenvs
	ln -sf `pwd`/virtualenvwrapper/* ~/.virtualenvs

install-python:
	rm -f ~/.pythonstartup.py
	ln -s `pwd`/python/pythonstartup.py ~/.pythonstartup.py

dump-terminal-settings:
	cp ~/Library/Preferences/com.apple.Terminal.plist terminal
	plutil -convert xml1 terminal/com.apple.Terminal.plist

install-terminal-settings:
ifeq ($(shell uname),Darwin)
	cp ~/Library/Preferences/com.apple.Terminal.plist terminal/old-settings.bak
	cp terminal/com.apple.Terminal.plist ~/Library/Preferences
	@echo "Old terminal settings were saved in terminal folder"
endif

install-keybindings:
	rm -f ~/Library/KeyBindings/DefaultKeyBinding.dict
	mkdir -p ~/Library/KeyBindings

install-vscode:
	mkdir -p ~/Library/Application Support/Code/User
	rm -f ~/Library/Application\ Support/Code/User/settings.json
	rm -f ~/Library/Application\ Support/Code/User/keybindings.json
	ln -s `pwd`/vscode/settings.json ~/Library/Application\ Support/Code/User
	ln -s `pwd`/vscode/keybindings.json ~/Library/Application\ Support/Code/User
	ln -s `pwd`/osx/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict

install-slate-config:
	ln -s `pwd`/slate/config ~/.slate

install-mutt:
	mkdir -p ~/.mutt/cache
	mkdir -p ~/.mutt/certificates
	rm -f ~/.muttrc
	ln -s `pwd`/mutt/muttrc ~/.muttrc
	rm -f ~/.mutt/gpg.rc
	ln -s `pwd`/mutt/gpg.rc ~/.mutt/gpg.rc
	rm -f ~/.mutt/solarized
	ln -s `pwd`/mutt/mutt-colors-solarized ~/.mutt/solarized
