function _fzf_change_directory
  if [ (count $argv) ]
    fzf --prompt="ChangeDir>" --query "$argv " | read foo
  else
    fzf --prompt="ChangeDir>" | read foo
  end
  
  if [ $foo ]
    builtin cd $foo
    commandline -r ''
    commandline -f repaint
  else
    commandline ''
  end
end

function fzf_change_directory
  begin
    # add custom directories to be listed
    if test -d $HOME/.dotfiles 
      echo $HOME/.dotfiles
    end
    
    # list current directory except .git
    fd --hidden --type directory --exclude .git --absolute-path
  end | _fzf_change_directory $argv
end
