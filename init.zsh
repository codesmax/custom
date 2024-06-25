#
# Custom aliases/settings
#

# any custom stuff should go here.
# ensure that 'custom' exists in the zmodules array in your .zimrc

path=($HOME/bin $path)
export PATH

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

alias ctail="colortail -k $HOME/.colortail"
alias mtail="multitail"
alias brake='bundle exec rake'
alias tunnel='autossh -M 20000 -nNT tunnel'
alias rmdirs.empty='find . -depth -type d -empty -exec rmdir -v {} \;'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias lprint='/usr/bin/lp -o nobanner -d $LPDEST'  # Assumes LPDEST is defined
alias pjet='enscript -h -G -fCourier9 -d $LPDEST' # Pretty-print using enscript
