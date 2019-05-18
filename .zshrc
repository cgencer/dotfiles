export PATH=$HOME/bin:/usr/local/bin:./bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export NVM_LAZY_LOAD=true

source $ZSH/oh-my-zsh.sh
source /usr/local/share/antigen/antigen.ZSH

antigen use oh-my-zsh

antigen bundle zsh-autosuggestions
antigen bundle git
antigen bundle docker
antigen bundle fasd
antigen bundle lukechilds/zsh-nvm

antigen theme jenssegers/zsh jenssegers

antigen apply

# Load dotfiles
for file in ~/.{path,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
