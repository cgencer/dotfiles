export PATH=$HOME/bin:/usr/local/bin:./bin:$PATH

export ZSH=$HOME/.oh-my-zsh
export ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "~/.dotfiles", from:local
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/fasd", from:oh-my-zsh
zplug "jenssegers/palenight.zsh-theme", as:theme
zplug load
