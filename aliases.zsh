# Navigation
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts
alias g="git"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias storm="open -a /Applications/PhpStorm.app"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias finder="open ."
alias diff="colordiff"
alias hosts="code /etc/hosts"
alias aliases="code ~/.dotfiles/aliases.zsh"
alias exports="code ~/.dotfiles/exports.zsh"
alias vim="code"
alias cap="captain"
alias tree="tree -C"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
alias flushdns="dscacheutil -flushcache && echo \"DNS cache cleared\""
alias d="docker"
alias dc="docker-compose"
alias c="composer"
alias ping="prettyping --nolegend"

# PHP stuff
alias ci="composer install --ignore-platform-reqs"
alias cu="composer update --ignore-platform-reqs"
alias cr="composer require --ignore-platform-reqs"
alias serve="PORT=3000 php -S 0.0.0.0:3000"
alias art="php artisan"
alias climb="composer outdated --outdated --direct"

# Docker run with bound current directory
function docker_run() {
	if [ -z "$PORT" ]; then
		docker run -it --init --rm \
			-v $(pwd):/directory \
			-w /directory \
			--network tlnetwork \
			${@}
	else
		echo "Binding localhost:$PORT to container";
		docker run -it --init --rm \
			-v $(pwd):/directory \
			-w /directory \
			-p ${PORT}:${PORT} \
			--network tlnetwork \
			${@}
	fi
}

# Docker aliases
alias composer="docker_run -v ~/.composer:/root/.composer -v ~/.ssh:/root/.ssh jenssegers/php:cli composer"
alias php="docker_run jenssegers/php:cli php"
alias php5="docker_run php:5-alpine php"
alias php70="docker_run php:7.0-alpine php"
alias ruby="docker_run -v ~/.gem:/root/.gem ruby:slim ruby"
alias gem="docker_run -v ~/.gem:/root/.gem ruby:slim gem"
alias blackfire="docker_run -e BLACKFIRE_CLIENT_ID -e BLACKFIRE_CLIENT_TOKEN blackfire/blackfire blackfire"
alias php-cs-fixer="docker_run ekreative/php-cs-fixer php-cs-fixer"

# Generate a random uuid
alias uuid="uuidgen | tr '[:upper:]' '[:lower:]' | tr -d '\n' | pbcopy && pbpaste && echo"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Recursively delete `.DS_Store` files
alias dotclean="find . -type f -name '*.DS_Store' -ls -delete"

# Generate a random string
random() {
	openssl rand -base64 512 | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

# Get string length of first argument
strlen() {
	echo ${#1}
}

# Get daily commits
daily() {
	for D in ~/Projects/*/.git; do
		git --git-dir=$D log --author "$(git config user.name)" --since="00:00" --pretty=tformat:" - %s" | cat
	done
}

# Base64 decode strings
base64_decode() {
	echo $1 | base64 --decode
}

# Quickly transfer file
transfer() {
	tmpfile=$( mktemp -t transferXXX )
	curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
	cat $tmpfile;
	rm -f $tmpfile;
}

# Get dns records for a host
function dnsrecords() {
	dig +nocmd $1 A +multiline +noall +answer;
	dig +nocmd $1 AAAA +multiline +noall +answer;
	dig +nocmd $1 NS +multiline +noall +answer;
	dig +nocmd $1 SOA +multiline +noall +answer;
	dig +nocmd $1 MX +multiline +noall +answer;
	dig +nocmd $1 TXT +multiline +noall +answer;
	dig +nocmd $1 DNSKEY +multiline +noall +answer;
	dig +nocmd $1 CAA +multiline +noall +answer;
}

timestamp() {
	if [ $# -eq 0 ]; then
		date +%s | pbcopy && pbpaste && echo
	else
		date -r $1
	fi
}