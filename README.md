# Install 
zsh
oh-my-zsh
gruvbox-zsh

# Install config
## Storing your dotfiles using a non-bare, default repository:
1. git init $HOME/.cfg
2. alias config='/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'
3. echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'" >> $HOME/.zsh/aliases
4. config config --local status.showUntrackedFiles no
5. config add .vimrc + config commit -m "add .vimrc" + Set up a remote repository on GitHub or your Git server of choice + config push

## Installing:
1. echo ".cfg" >> .gitignore
2. git clone <remote-git-repo-url> $HOME/.cfg
3. alias config='/usr/bin/git --git-dir=$HOME/.cfg/.git --work-tree=$HOME'
4. config config --local status.showUntrackedFiles no
5. config checkout
