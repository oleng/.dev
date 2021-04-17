
# initialize shell input configs
if [ -f ~/.inputrc ]; then
    printf "Initializing ~/.inputrc..."
    bind -v -f ~/.inputrc
    clear
fi

# initialize secrets
if [ -f ~/.secrets ]; then
    printf "Sourcing ~/.secrets..."
    source ~/.secrets
    clear
fi

# check if `python` symlink exists
# if `test` can't find symlink for `python` in `/usr/local/bin` then create one
if [ ! -L "/usr/local/bin/python" ]; then
    SOURCE_SYMLINK=/usr/local/bin/python3
    SYMLINKED_PYTHON=/usr/local/bin/python

    # parameters: source_file target_file
    ln -s $SOURCE_SYMLINK $SYMLINKED_PYTHON

    printf "Created symlink at $SYMLINKED_PYTHON to python at:"
    echo $(readlink $SYMLINKED_PYTHON)
fi

# https://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script/27875395#27875395
# https://stackoverflow.com/a/1885670


##  aliases

## Dev tools
alias ls="ls -GF"
alias less="less -r"
alias which="type -f"
alias tmux="tmux -2"
alias git="/usr/local/bin/git"
alias python="python3"
alias pip="python3 -m pip"
# create new venv with command prompt on
function mkvenv() {
    read -p "This will create new venv in this directory & activate it. Continue [y/n]? " confirm
    if [ $confirm = 'y' ]; then
        if [[ -d "$(pwd)/.venv" && -e "$(pwd)/.venv/bin/activate" ]]; then
            printf '.venv already exists.'
        else
            _pyversion="$(python -V)"
            echo "Creating new venv with ${_pyversion}..."
            python -m venv .venv --prompt $(basename $(pwd))
        fi
        echo "activating $(basename $(pwd))..."
        source .venv/bin/activate
    else
        printf 'Aborted venv creation.'
    fi
}

alias iterm=/Application/iTerm.app
alias editxt="code"
alias txt="code"

# remove just dangling images
alias docker_rm-dangling-images="docker rmi $(docker images --filter dangling=true)"
# remove every stopped containers
alias docker_rm-stopped-containers="docker rm $(docker ps -a -q -f status=exited)"
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