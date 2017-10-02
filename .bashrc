stty -ixon
function googl { 
  local url=$(cat <&0)
    (
	set -e pipefail;
        echo "{}" \
            | json -e "this.longUrl='$url'" \
            | curl -sf https://www.googleapis.com/urlshortener/v1/url \
                -H 'Content-Type: application/json' -d@- \
            | json id
    )
}
export CLICOLOR=1
export LSCOLORS=Cxfxcxdxbxegedabagaced
export DYLD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH 
export PS_BASE=/usr/local

alias node='rlwrap node'

export PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

export PATH=$PATH:/usr/local/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin
