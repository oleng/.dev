
# initialize shell input configs
if [ -f ~/.inputrc ]; then
    echo "Initializing ~/.inputrc..."
    bind -v -f ~/.inputrc
    clear
fi

# initialize secrets
if [ -f ~/.secrets ]; then
    echo "Sourcing ~/.secrets..."
    source ~/.secrets;
fi

##  aliases

## Dev tools
alias ls="ls -GF"
alias less="less -r"
alias which="type -f"
alias tmux="tmux -2"
alias git="/usr/local/bin/git"
alias python=python3
alias pip="python3 -m pip"
alias iterm=/Application/iTerm.app
alias editxt="subl -n"
alias txt="subl -n"
# remove just dangling images
alias docker-dangling-images="docker rmi $(docker images --filter dangling=true)"
# remove every stopped containers
alias docker-stopped-containers="docker rm $(docker ps -a -q -f status=exited)"
# remove every stopped containers, all networks not used by at least one container,
# all dangling images & dangling build caches
alias dockerprune="docker system prune"

## Operating system related
alias badblocks=/usr/local/opt/e2fsprogs/sbin/badblocks
# alias fusion_client=/Library/Extensions/AstekFusion2Family.kext/Contents/MacOS/fusion_client
alias refresh_alias="source ~/.aliases"

# common folders
alias projects="cd ~/projects"

## useful misc apps
alias yt="youtube-dl \
            -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
            --output '%(playlist_index)s - %(title)s %(upload_date)s - %(id)s.%(ext)s' \
            --yes-playlist \
            --write-sub \
            --write-info-json"

function yt-pl_index() {
    for i in "$@";
    do
        pl_index=$(jq '.playlist_index' "$i")
        # prefix file name with pl_index & `.`:
        # 12.Docker - Development with Docker.json
        new_name="${i/#/$pl_index.}"
        echo "$new_name"
        mv "$i" "$new_name"
    done
}


function fname_ext() {
    filename=$(basename -- "$1")
    extension=$([[ "$filename" = *.* ]] && echo ".${filename##*.}" || echo '')
    echo "filename: $filename"
    echo "ext: $extension"
}

function jsonbeautify() {
    while [ "$1" != "" ];
        do
            fname=$1
            # create a temporary beautified .json file
            result="${fname/.json/.json.tmp}"
            jq . "$fname" > "$result"
            rm "$fname" && mv "$result" "$fname"
            echo "$fname"
        shift
    done
}

## project related

alias proxy="proxybroker --verify-ssl --log DEBUG find --types HTTPS --lvl High --show-stat --strict --countries US UM VI CA HT JM PR NL DK NO PL DE FR UK --format json --outfile proxies/$(date +%Y%m%d_%H)_proxies.json"