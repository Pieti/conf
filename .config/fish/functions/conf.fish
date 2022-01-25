function conf --wraps='/usr/bin/git'
    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv;
end
