function fzf_select_history
  if test (count $argv) = 0
    history | fzf --prompt="History>" | read foo
  else
    history | fzf --prompt="History>" --query "$argv " | read foo
  end

  if [ $foo ]
    commandline $foo
    echo $foo | xclip -selection clipboard
  else
    commandline ''
  end
end
