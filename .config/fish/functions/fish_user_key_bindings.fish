function fish_user_key_bindings
	# Change Directory = Ctrl+J or Ctrl+F
  bind \cj fzf_change_directory 
  bind \cf fzf_change_directory 

	# Change Directory Up = Ctrl+U
  bind \cu fzf_change_directory_up
  
	# Jump to Local Repository = Ctrl+G
  bind \cg fzf_jump_to_repository
  
	# Open File = Ctrl+O
  bind \co fzf_open_file
  
	# Select History = Ctrl+R
  bind \cr fzf_select_history 

  # Accept Suggesions = Ctrl + / or Ctrl +
  bind \c_ forward-char
end
