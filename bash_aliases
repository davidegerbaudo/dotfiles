alias enw="emacs -nw"

alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias kcern="kinit -f $USER@CERN.CH"
alias kfnal="kinit -f $USER@FNAL.GOV"
alias boxster="ssh -Y boxster-clued0.fnal.gov"
alias cayman="ssh -Y cayman-clued0.fnal.gov"
alias nifae06="ssh -Y nifae06.cern.ch"
alias nifae06tunnel="ssh -L 5902:localhost:5902 nifae06.cern.ch"
alias at3="ssh -Y at3.pic.es"
alias pcatr17='ssh -Y pcatr17.cern.ch'
alias pc3='ssh -Y atlaspc3.ps.uci.edu'
alias pc4='ssh -Y atlaspc4.ps.uci.edu'
alias pc5='ssh -Y atlaspc5.ps.uci.edu'
alias pc8='ssh -Y atlaspc8.ps.uci.edu'
alias pc9='ssh -Y atlaspc9.ps.uci.edu'
alias gp1='ssh -Y gpatlas1.ps.uci.edu'
alias gp2='ssh -Y gpatlas2.ps.uci.edu'
alias gp1hop='ssh -tCL 5906:localhost:5906 atlaspc5.ps.uci.edu ssh -CL 5906:localhost:22 gpatlas1.ps.uci.edu'
alias gp2hop='ssh -tCL 5907:localhost:5906 atlaspc5.ps.uci.edu ssh -CL 5907:localhost:22 gpatlas2.ps.uci.edu'
alias vproxy='voms-proxy-init -voms atlas -valid 144:00'
alias dipp='$HOME/bin/dipp.py' # get it from https://raw.github.com/davidegerbaudo/python-scripts/master/various/dipp.py
alias psu='pgrep -u $USER | xargs ps -f -p'

# cannot define an alias with arg; use a function instead
mktoday() {
    local target_dir="/tmp/${USER}/`date +%F`" && [[ $# -gt 0 ]]  && target_dir="/tmp/${USER}/${1}-`date +%F`" ;
    echo "mkdir ${target_dir}"
    mkdir -p ${target_dir}
    }

# determine whether this is an interactive shell
# (from http://tldp.org/LDP/abs/html/intandnonint.html)
isthisshellinteractive() {
 case $- in
 *i*)    # interactive shell
         echo yes
 ;;
 *)      # non-interactive shell
         echo no
 ;;
 esac
}

# short for 'find base-location -name "*some-name*" -exec grep some-thing {}' \; -print
fgrepp() {
    if [[ 2 -gt $# || $# -gt 3 ]]
    then
        echo "Usage: fgrep where [approxname] whattogrep"
    else
        local base_dir="${1}"
        local name_pattern="*"    && [[ $# -gt 2 ]]  && name_pattern="*${2}*" ;
        local word_pattern="${2}" && [[ $# -gt 2 ]]  && word_pattern="${3}" ;
        # echo "find  ${base_dir} -type f -iname \"${name_pattern}\" -exec grep --color='auto' ${word_pattern} {} \; -print"
        find  ${base_dir} -type f -iname "${name_pattern}" -exec grep --color='auto' ${word_pattern} {} \; -print
    fi
}


# git aliases
alias gad='git add'
alias gadp='git add -p'
alias gpu='git push'
alias glg='git log'
alias glp='git log --pretty=format:"%h - %an, %ad : %s"'
alias gst='git status'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias gcm='git commit -m'
alias gcma='git commit -am'
alias gbr='git branch'
alias gco='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpl='git pull'
alias gcl='git clone'

# svn aliases
alias svs='svn status'
alias svi='svn info'
alias svd='svn diff'
alias svu='svn update'
alias svc='svn commit'
alias svcm='svn commit -m'
