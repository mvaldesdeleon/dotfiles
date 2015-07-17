# Load ~/.path, ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{path,extra,bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && . "$file"
done
unset file

# Init z
# NOTE: Z_PATH will not be tilde-expanded. Take care of that yourself (i.e., eval Z_PATH="~/bin"; export Z_PATH;)
. "${Z_PATH}/z.sh"

# Keep the history
shopt -s histappend
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
# Autocorrect typos in path names when using `cd`
shopt -s cdspell
# Enable extended globbing
shopt -s extglob

BASH_COMPLETION_DIR="$HOME/Miscellaneous/etc/bash_completion.d"

# Load bash completions
for file in "$BASH_COMPLETION_DIR"/*.sh; do
  [ -r "$file" ] && . "$file"
done
unset file

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f "$BASH_COMPLETION_DIR/git-completion.sh" ]; then
  complete -o default -o nospace -F _git g
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;
export NVM_DIR="/Users/mvaldes/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
