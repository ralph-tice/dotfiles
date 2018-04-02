# Ralph Tice's Dot Files

These are config files are based on [dotfiles](https://github.com/ryanb/dotfiles) by Ryan Bates and modified to set up a system the way I like it. It uses [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh).

I am running on Mac OS X, but it will likely work on Linux as well.


## Installation

Run the following commands in your terminal. It will prompt you before it does anything destructive. Check out the [Rakefile](https://github.com/devkmsg/dotfiles/blob/master/Rakefile) to see exactly what it does.

    git clone git://github.com/devkmsg/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    rake install
    rake packages
    

After installing, open a new terminal window to see the effects.

Feel free to customize the .zshrc file to match your preference.


## Features

I normally place all of my coding projects in ~/code, so this directory can easily be accessed (and tab completed) with the "c" command.

```terminal
c railsca<tab>
```

Tab completion is also added to rake and cap commands:

```
rake db:mi<tab>
cap de<tab>
```

To speed things up, the results are cached in local .rake_tasks~ and .cap_tasks~. It is smart enough to expire the cache automatically in most cases, but you can simply remove the files to flush the cache.

If you're using git, you'll notice the current branch name shows up in the prompt while in a git repository.

There are several features enabled in Ruby's irb including history and completion. Many convenience methods are added as well such as "ri" which can be used to get inline documentation in IRB. See irbrc file for details.


## Uninstall

To remove the dotfile configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.

```
unlink ~/.gemrc
unlink ~/.gitconfig
unlink ~/.gitignore
unlink ~/.gvimrc
unlink ~/.irbrc
unlink ~/.vim
unlink ~/.vimrc
unlink ~/.zshrc # careful here
rm -rf ~/.dotfiles
rm -rf ~/.oh-my-zsh
chsh -s /bin/bash # change back to Bash if you want
```

Then open a new terminal window to see the effects.
