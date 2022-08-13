function fish_git_open
    git remote -v | awk 'NR==1 { print $2 }' | xargs -ro vivaldi-stable > /dev/null 2>&1 &
end
