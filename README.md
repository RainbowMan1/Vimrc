## How to organize the directory

1. Clone repo to `~/`
2. Delete existing `.vimrc` in `~/`
3. Run the following command `ln -s ~/Vimrc/.vimrc ~/.vimrc` to link the .vimrc to the one in the repo

## TODO

1. Current implementaion makes as many build process as the number of writes. Write a python script to handle multiple writes while build is happening.
2. Parse compiler errors and highlight lines with errors in Vim
