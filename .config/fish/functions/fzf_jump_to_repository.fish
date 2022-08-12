function _fzf_jump_to_repository
  if [ (count $argv) ]
    fzf --prompt="JumpToRepo>" --query "$argv " | read foo
  else
    fzf --prompt="JumpToRepo>" | read foo
  end
  
  if [ $foo ]
    builtin cd $foo
    commandline -r ''
    commandline -f repaint
  else
    commandline ''
  end
end

function fzf_jump_to_repository
  begin
    # list local repositories with full path
    ghq list -p
    
  end | _fzf_jump_to_repository $argv
end
