# ##############################################################################
# #     ░█▀▀░▀█▀░█▀▀░█░█░░░█▀▀░█░█░█▀▀░█░░░█░░░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀       # 
# #     ░█▀▀░░█░░▀▀█░█▀█░░░▀▀█░█▀█░█▀▀░█░░░█░░░░░█░░░█░█░█░█░█▀▀░░█░░█░█       #
# #     ░▀░░░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀       #
# #~~~~~~~~~~~~~~~~~~~~ author: https://github.com/arifvn ~~~~~~~~~~~~~~~~~~~~~#
# ##############################################################################

# ##############################################################################
# #                               AUTOSTART                                    # 
# ##############################################################################

# Run startx at login from tty
# if status --is-login
#   if test -z "$DISPLAY" -a $XDG_VTNR = 1
#     exec startx -- -keeptty
#   end
# end

# Disable fish greeting messages
set fish_greeting

# ##############################################################################
# #                                 PATHS                                      # 
# ##############################################################################

set -gx PATH $HOME/.bin/ $PATH
set -gx PATH $HOME/.npm-global/bin/ $PATH

# ##############################################################################
# #                             ENV VARIABLES                                  # 
# ##############################################################################

set -gx TERM xterm-256color
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx LANG en_US.UTF-8

set -U SXHKD_SHELL sh
set -gx REPO_DIR $HOME/ghq
set -gx WALLPAPER_DIR $HOME/.wallpapers/
set -gx FZF_DEFAULT_OPTS "--layout=reverse --cycle --color=bg+:#181F21,bg:#181F21,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD"

# ##############################################################################
# #                              ABBREVIATION                                  # 
# ##############################################################################

# [vim]
abbr --add vi 'nvim'
abbr --add vim 'nvim'
abbr --add v 'nvim'

# [exa]
abbr --add ll 'exa --long --icons --all --group-directories-first --no-permissions --no-user --no-time --no-filesize'
abbr --add ls 'exa --long --icons --all --group-directories-first'
abbr --add lst 'exa --long --icons --tree --all --group-directories-first --no-permissions --no-user --no-time --no-filesize'
abbr --add lsd 'exa --long --icons --all --only-dirs'
abbr --add lsg 'exa --icons --grid --all --group-directories-first'

# [commons]
abbr --add rc 'ranger'
abbr --add j 'z'
abbr --add tm 'tmux'
abbr --add clone 'ghq get' 
abbr --add du 'dust' 

# [extra]
abbr --add l 'clear'
abbr --add pt 'pkill tmux'
abbr --add tma 'tmux attach'
abbr --add ef 'exec fish'
abbr --add vio 'nvim "+lua require(\'telescope.builtin\').oldfiles()"'
abbr --add mv 'mv -v'
abbr --add cp 'cp -vr'
abbr --add dun 'pkill dunst && dunst &; notify-send "DUNST" "Dunst is Working!"'

# [cd]
function cd; builtin cd $argv && exa --long --icons --all --group-directories-first --no-permissions --no-user --no-time --no-filesize; end
# [rm]
function rm-vr; rm -vr $argv && echo "" && exa --long --icons --all --group-directories-first --no-permissions --no-user --no-time --no-filesize; end
abbr --add rm 'rm-vr'
  
# [zip]
abbr --add mtar 'tar -cvf'    # mtar <archive_compress>
abbr --add utar 'tar -xvf'    # utar <archive_decompress> <file_list>
abbr --add zip 'zip -r'       # zip <archive_compress> <file_list>
abbr --add uz 'unzip'         # uz <archive_decompress> -d <dir>

# ##############################################################################
# #                                  THEME                                     # 
# ##############################################################################

# Catppuccin: https://github.com/catppuccin/fish/blob/main/conf.d/frappe.fish

# special
set -l foreground c6d0f5
set -l selection 414559

# palette
set -l teal 81c8be
set -l flamingo eebebe
set -l mauve ca9ee6
set -l pink f4b8e4
set -l red e78284
set -l peach ef9f76
set -l green a6d189
set -l yellow e5c890
set -l blue 8caaee
set -l gray 737994

# syntax highlighting
set -g fish_color_normal $foreground
set -g fish_color_command $blue
set -g fish_color_param $flamingo
set -g fish_color_keyword $red
set -g fish_color_quote $green
set -g fish_color_redirection $pink
set -g fish_color_end $peach
set -g fish_color_error $red
set -g fish_color_gray $gray
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $pink
set -g fish_color_escape $flamingo
set -g fish_color_autosuggestion $gray
set -g fish_color_cancel $red

# prompt
set -g fish_color_cwd $yellow
set -g fish_color_user $teal
set -g fish_color_host $blue

# completion pager
set -g fish_pager_color_progress $gray
set -g fish_pager_color_prefix $pink
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $gray

# ##############################################################################
# #                                STARSHIP                                    # 
# ##############################################################################

# Source startship prompt
starship init fish | source
