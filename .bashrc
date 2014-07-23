# Load ~/.path, ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{path,extra,bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && . "$file"
done
unset file

BASH_COMPLETION_DIR="/opt/local/etc/bash_completion.d"

# Load bash completions
file_list=("$BASH_COMPLETION_DIR"/*.bash)
for file in $file_list; do
  [ -r "$file" ] && . "$file"
done
unset file_list
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

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f "$BASH_COMPLETION_DIR/git-completion.bash" ]; then
  complete -o default -o nospace -F _git g
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;