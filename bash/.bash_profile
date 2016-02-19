# Source other config files if they exist
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.profile ]; then
    source ~/.profile
fi

# OPAM configuration
. /Users/Lance/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
