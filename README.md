# dotfiles

> These are my dotfiles. There are many like them, but these ones are mine.

# Install Brew

    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install All the software packages

    $ brew bundle
    $ curl -L git.io/antigen > antigen.zh
    $ curl -L -o ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    $ nvim +PlugInstall +qa

If the python3 provider is missing:
    $ python3 -m pip install --user --upgrade pynvim/
    $ nvim :UpdateRemotePlugin +qa



# Symlink dotfiles

    $ git clone git@github.com:thnukid/dotfiles.git ~/.dotfiles

    $ stow git neovim personal-git ruby ssh zsh
