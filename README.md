# MVL’s dotfiles

Forked from [Mathias Bynens'](https://github.com/mathiasbynens/dotfiles)

![Screenshot of my shell prompt](http://i.imgur.com/ro9VoAd.png)

Based around a Monokai theme, includes the solutions I've found thus far to my most frequent terminal-related tasks.

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/mvaldesdeleon/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/mvaldesdeleon/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE-MIT.txt}
```

To update later on, just run that command again.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before anything else takes place.

Here’s an example `~/.path` file that adds some directories to the `$PATH`:

```bash
# Verbose but straight-forward
path_directories=(
  '~/bin'
  '~/tools'
  '~/utils'
)

export PATH=$(printf "%s:" "${path_directories[@]}")$PATH

# Additional paths (e.g., Z_PATH ) are also defined here
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Default username and hostname for prompt customization
export DEFAULT_USERNAME='mvaldes'
export DEFAULT_HOSTNAME='Martins-MacBook-Pro'

# Personal data for Git setup
export FULL_NAME="Martín Valdés de León"
export HOME_EMAIL="m.valdesdeleon@home.com"
export WORK_EMAIL="m.valdesdeleon@work.com"

# Git credentials
GIT_AUTHOR_NAME="$FULL_NAME"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"

# Disabled to allow local overrides
# GIT_AUTHOR_EMAIL='$WORK_EMAIL'
# GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$WORK_EMAIL"

# Easier navigation: Custom/Work-related directories
# [aliases for quick cd'ing into specific directories, not included here]

# Git local user.email switcheroo
git config --global alias.work '! git config user.email "$WORK_EMAIL"'
git config --global alias.home '! git config user.email "$HOME_EMAIL"'

# Init NVM
. ~/.nvm/nvm.sh
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/mvaldesdeleon/dotfiles/fork) instead, though.

### Z.sh

You will notice that [.bashrc:10](.bashrc) also initializes [Z.sh](https://github.com/rupa/z). If you do not want to use this script, just remove or comment-out this line.

### Bash Completion

I've included my bash completion files as part of this repo. Should you want to use them, just copy them to somewhere appropriate and update the BASH_COMPLETION_DIR variable in [.bashrc:21](.bashrc).

Keep in mind that these are simply the files I'm currently using, and that they might very well be out-of-date. I am not the creator/maintainer of these and I'm just providing them for completion's sake.

## TODO's

* Take a better screenshot (?)
* Implement .editorconfig and Preferences.sublime-settings
* Implement "New machine" files (.osx, Homebrew, Caskfile)

## Feedback

Suggestions/improvements
[welcome](https://github.com/mvaldesdeleon/dotfiles/issues)!

## Author

Martín Valdés de León.

Based on original work by [Mathias Bynens](https://github.com/mathiasbynens), as well as whoever [contributed on his project](https://github.com/mathiasbynens/dotfiles/contributors)