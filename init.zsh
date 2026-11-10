#
# Custom aliases/settings
#

# any custom stuff should go here.
# ensure that 'custom' exists in the zmodules array in your .zimrc

export DOCKER_HOST=unix://$HOME/.colima/default/docker.sock
export ANDROID_HOME=$HOME/Library/Android/sdk
export LIBPQ_HOME=/opt/homebrew/opt/libpq
export GPG_TTY=$(tty)
export NODE_OPTIONS="--max-old-space-size=6144"

# development environment
export HOST_PRIVATE_IP=127.0.0.1        # IP for container port mapping
export MW_SERVER=http://localhost:8080  # MediaWiki server URL

typeset -U PATH path
path=($HOME/bin $HOME/.boxout $ANDROID_HOME/emulator $ANDROID_HOME/platform-tools $LIBPQ_HOME/bin $path)
export PATH

export HISTSIZE=50000
export SAVEHIST=100000
setopt EXTENDED_HISTORY
unsetopt SHARE_HISTORY

# zsh integrations
eval "$(mise activate zsh)"
eval "$(zoxide init zsh)"

# aliases
alias ..='cd ..'
alias ...='cd ../..'
alias h='history 0'
alias g='grep'
alias j='jobs -l'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias path='echo -e ${PATH//:/\\n}'
alias du='du -h'
alias df='df -h'

alias brake='bundle exec rake'
alias tunnel='autossh -M 20000 -nNT tunnel'
alias rmdirs.empty='find . -depth -type d -empty -exec rmdir -v {} \;'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias supabase-clean='docker rmi $(docker images --filter "reference=public.ecr.aws/supabase/*" -q) 2>/dev/null'
alias wipe-npx='echo "Deleting npx cache..." && rm -rf ~/.npm/_npx && echo "Done."'
alias wipe-supabase='docker volume ls --format "{{.Name}}" | grep "^supabase_" | xargs docker volume rm'
alias passport-sheet='f() { gm montage -tile 3x2 -geometry 600x600+0+0 -density 300 "$1" "$1" "$1" "$1" "$1" "$1" ${1%.*}-passport-sheet.jpg; }; f'

# npx aliases
npx_packages=(
  'expo'
  'expo-doctor@latest'
  'supabase@latest'
  'wrangler@latest'
)
for package in "${npx_packages[@]}"; do
  alias ${package%@*}="npx ${package}"
done

# sandbox aliases
alias bo='boxout'
alias claude='bo claude'
alias codex='bo codex'
