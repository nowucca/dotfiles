# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# init jenv http://www.jenv.be/
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# init z https://github.com/rupa/z
. ~/init/z/z.sh


# GTK path for wireshark GUI to work
GTK_PATH=/usr/local/lib/gtk-2.0

# Include git completion if present
if [ -f $(brew --prefix)/share/zsh/site-functions/git-completion.bash ]; then
	. $(brew --prefix)/share/zsh/site-functions/git-completion.bash
fi

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi

# Git completions even with git alias: http://stackoverflow.com/questions/342969/how-do-i-get-bash-completion-to-work-with-aliases
 __git_complete g __git_main

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh ssh_screen;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    echo "Loading bash completions from $(brew --prefix)/share/bash-completion/bash_completion"
    . $(brew --prefix)/share/bash-completion/bash_completion
fi
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    echo "Loading bash completions from $(brew --prefix)/etc/bash_completion"
   . $(brew --prefix)/etc/bash_completion
fi

###################################
# Find lcoations, not bulletproof #
###################################
export WHERE=`uname -n | cut -f1 -d.`
export WHEREFROM=`who am i | cut -f2 -d " "`

###################################
# Output Welcome Messages         #
###################################
echo "Logged in from `who am i | cut -f2 -d " "`"
tput smso
echo "TERM set to $TERM"
tput rmso
if [ "$DISPLAY" = "" ]
then
    echo "DISPLAY not set"
else
    echo "DISPLAY is $DISPLAY"
fi

###################################
# STTY Settings                   #
###################################
stty -ixon
stty erase \ intr \ kill \ susp \

# ixon (-ixon) Enable (disable) START/STOP output control
# Output is stopped by sending STOP control character and
# started by sending the START control character.


#############################################################
# System specific customization                             #
#############################################################
export OSTYPE=`uname -s`
case "$OSTYPE" in
        "Linux")
        ;;

        "Darwin")
          echo "Cool, a Mac!"
        ;;

        *)
          echo "Cool! A new machine!  Using default settings."
        ;;
esac



