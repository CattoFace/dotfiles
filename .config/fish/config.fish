if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_greeting
   fastfetch --load-config paleofetch
end
function fish_right_prompt
   set_color -r blue
   set -l S (math "$CMD_DURATION/1000")
   set -l M (math "floor($S/60)")
   set -l H (math "floor($M/60)")
   if test $H -gt 0
       echo -n -s $H h $(math $M % 60) m $(math "floor($S) % 60") s
   else if test $M -gt 0
       echo -n -s $M m $(math "floor($S) % 60") s
   else if test $S -gt 1
       echo -n -s $S s
   else
       echo -n -s $CMD_DURATION ms
   end
   echo -n " ~ " (date +%H:%M:%S)
   set_color normal
end
pyenv init - | source
alias clear="clear & fastfetch --load-config paleofetch"
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias dotfilesu='dotfiles pull ; dotfiles add -u && dotfiles commit -m "dotfiles update" && dotfiles push'
alias clear='clear && fastfetch --load-config paleofetch'
alias cat='bat'
alias grep='rg'
alias n='nvim'
