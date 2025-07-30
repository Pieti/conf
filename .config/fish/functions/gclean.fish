function gclean --wraps='/usr/bin/git'
    set -f main_branch master
    echo $main_branch
    /usr/bin/git branch --merged $main_branch | grep -vE "^\*|$main_branch" | xargs -n 1 git branch -d
end
