function _fzf_open_file
  if [ (count $argv) ]
    fzf --prompt="OpenFile>" --query "$argv " | read foo
  else
    fzf --prompt="OpenFile>" | read foo
  end
  
  if [ $foo ]
    $EDITOR $foo
    commandline -r ''
    commandline -f repaint
  else
    commandline ''
  end
end

function fzf_open_file
  begin
    # list files under current directory except .git
    fd --hidden --type file --exclude .git --absolute-path
    
    # add another directories eg.
    # fd . $REPO_DIR --hidden --type file --exclude .git --absolute-path
    
  end | _fzf_open_file $argv
end
