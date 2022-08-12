function _fzf_change_directory_up
  if [ (count $argv) ]
    fzf --prompt="ChangeDirUp>" --query "$argv " | read foo
  else
    fzf --prompt="ChangeDirUp>" | read foo
  end
  
  if [ $foo ]
    builtin cd $foo
    commandline -r ''
    commandline -f repaint
  else
    commandline ''
  end
end

function fzf_change_directory_up
  begin
    # add custom directories to be listed
    # echo $HOME/.dotfiles
    
    set parent "$(dirname $(pwd))" 
    set grandparent "$(dirname $parent)"

    echo $grandparent
    echo $parent
   
    # list all directories
    echo $parent | xargs fd --hidden --type directory --max-depth 2 --exclude .git --full-path /
    
  end | _fzf_change_directory_up $argv
end
