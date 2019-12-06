# initialize aliases
if [ -f ~/.aliases ]; then
	echo "Sourcing ~/.aliases..."
	source ~/.aliases;
fi

# initialize secrets
if [ -f ~/.aliases ]; then
	echo "Sourcing ~/.secrets..."
	source ~/.secrets;
fi


export CLICOLOR=1

#  The default order & value for CLICOLOR

# ls attribute					Foreground	Background
# ----------------------------------------------------
# 1-directory					e			x
# 2-sym_link					f			x
# 3-socket						c			x
# 4-pipe						d			x
# 5-executable					b			x
# 6-block_special				e			g
# 7-char_special				e			d
# 8-exe_setuid					a			b
# 9-exe_setgid					a			g
# a-dir_writeothers_sticky		a			c
# b-dir_writeothers_NOsticky	a			d

# code	color
# ----------------------------------------------------
# a		Black
# b		Red
# c		Green
# d		Brown
# e		Blue
# f		Magenta
# g		Cyan
# h		Light grey
# A		Bold black, usually shows up as dark grey
# B		Bold red
# C		Bold green
# D		Bold brown, usually shows up as yellow
# E		Bold blue
# F		Bold magenta
# G		Bold cyan
# H		Bold light grey; looks like bright white
# x		Default foreground or background
# ----------------------------------------------------

# For BSD variants	1  2  3  4  5  6  7  8  9  10 11
# 					ex fx cx dx bx eg ed ab ag ac ad
# export LSCOLORS=	Gx Fx Cx Dx Bx eg ed ab ag ac ed

# For Linux di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43

export LSCOLORS=Gxhxcxdxgxegfhbxfxacad

export GREP_OPTIONS='--color=auto'