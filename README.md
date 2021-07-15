## How to organize the directory

1. sudo add-apt-repository ppa:jonathonf/vim
2. sudo apt-get update
3. sudo apt-get install vim
4. sudo apt-get install vim-gtk
5. Clone repo to `~/`
6. Delete existing `.vimrc` in `~/`
7. Run the following command `ln -s ~/Vimrc/.vimrc ~/.vimrc` to link the .vimrc to the one in the repo

## TODO (C++)

1. Current implementaion makes as many build process as the number of writes. Write a python script to handle multiple writes while build is happening.
2. Match regex patterns to ignore directories and files for compile on write like .gitignore
3. Parse compiler errors and highlight lines with errors in Vim
