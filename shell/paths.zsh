# Directories to be prepended to PATH

export PATH="/opt/homebrew/bin:$PATH"

declare -a dirs_to_prepend
dirs_to_prepend=(
    "/usr/local/bin"
    "$FNM_MULTISHELL_PATH/bin"
)


# Directories to be appended to PATH
declare -a dirs_to_append
dirs_to_append=(
    "/usr/bin"
    "/usr/local/sbin"
    "$HOME/bin"
    "$HOME/.dotfiles/bin"
    "$(brew --prefix coreutils)/libexec/gnubin" # Add brew-installed GNU core utilities bin
    "$(brew --prefix)/share/npm/bin" # Add npm-installed package bin
    "$(brew --prefix)/sbin" # Homebrew's "sbin"
)


# Prepend directories to PATH
for dir in ${(k)dirs_to_prepend[@]}
do
    if [ -d ${dir} ]; then
        # If these directories exist, then prepend them to existing PATH
        PATH="${dir}:$PATH"
    fi
done

# Append directories to PATH
for dir in ${(k)dirs_to_append[@]}
do
    if [ -d ${dir} ]; then
        # If these bins exist, then append them to existing PATH
        PATH="$PATH:${dir}"
    fi
done

unset dirs_to_prepend dirs_to_append

export PATH
