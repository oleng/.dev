
# initialize aliases
if [ -f ~/.aliases ]; then
    echo "Sourcing ~/.aliases..."
    source ~/.aliases;
fi

# initialize shell input configs
if [ -f ~/.inputrc ]; then
    echo "Initializing ~/.inputrc..."
    bind -v -f ~/.inputrc
fi

# initialize secrets
if [ -f ~/.secrets ]; then
    echo "Sourcing ~/.secrets..."
    source ~/.secrets;
fi
