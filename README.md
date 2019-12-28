# .dev
Sick of manually setting up configs & forgetting preferred setups from one machine to another.
Stolen & borrowed shamelessly from many, mostly [herrbischoff/awesome-macos-command-line](https://github.com/herrbischoff/awesome-macos-command-line) & [donnemartin/dev-setup](https://github.com/donnemartin/dev-setup)

This (hopefully) organic repo is for automating development setups on new installs (or resetting to default configurations & environments), including dotfiles.

[//]: # (
	guide:
	- if inside a folder there's a subfolder that doesn't need its content listed, prefix all the names of subfolders in the same level with a slash, otherwise leave the slash out.
	- add whitespace between root folders & files, but after first child sublevel avoid whitespace.
	)

	├─── dotfiles
	│   ├── .docker
	│   │  	└── config.json
	│   ├── .git_template
	│   │   ├── /hooks
	│   │   ├── /info
	│   │   │  └── exclude
	│   │   ├── description
	│   ├── .ssh
	│   │   └── config
	│   ├── .bash_profile
	│   ├── .bashrc
	│   ├── .gitconfig
	│   ├── .gitignore
	│   ├── tmux.conf
	│   │
	├─── install_cfg
	│   ├── brew_packages.conf
	│   └── Preference.sublime-settings
	│  
	├── brew_install_packages.sh
	├── dotfiles.sh
	├── osx.sh
	└── start.sh

