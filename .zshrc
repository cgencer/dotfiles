export PATH=$HOME/bin:/usr/local/bin:./bin:$PATH

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "~/.dotfiles", from:local
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "zsh-users/zsh-completions", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/fasd", from:oh-my-zsh
zplug "jenssegers/palenight.zsh-theme", as:theme
zplug load
