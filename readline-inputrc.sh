# Use VI mode for navigating on the terminal
set editing-mode vi
set show-mode-in-prompt on
# Set the cursor to a bar for insert mode
set vi-ins-mode-string \1\e[6 q\2
# set the cursor to a box for command mode
set vi-cmd-mode-string \1\e[2 q\2
