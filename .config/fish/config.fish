setenv EDITOR vim

abbr -a e nvim
abbr -a g git
abbr -a l ls
abbr -a ... ../..
abbr -a ws cd ~/ws

if test -f ~/.config/fish/config_local.fish
    source ~/.config/fish/config_local.fish
end

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow . $dir'
setenv FZF_DEFAULT_OPTS '--height 40%'
