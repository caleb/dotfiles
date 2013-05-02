##
## GNU ls
##

# no            NORMAL, NORM            Global default, although everything should be something
# fi            FILE                    Normal file
# di            DIR                     Directory
# ln            SYMLINK, LINK, LNK      Symbolic link. If you set this to ‘target’ instead of a numerical value, the color is as for the file pointed to.
# pi            FIFO, PIPE              Named pipe
# do            DOOR                    Door
# bd            BLOCK, BLK              Block device
# cd            CHAR, CHR               Character device
# or            ORPHAN                  Symbolic link pointing to a non-existent file
# so            SOCK                    Socket
# su            SETUID                  File that is setuid (u+s)
# sg            SETGID                  File that is setgid (g+s)
# tw            STICKY_OTHER_WRITABLE   Directory that is sticky and other-writable (+t,o+w)
# ow            OTHER_WRITABLE          Directory that is other-writable (o+w) and not sticky
# st            STICKY                  Directory with the sticky bit set (+t) and not other-writable
# ex            EXEC                    Executable file (i.e. has ‘x’ set in permissions)
# mi            MISSING                 Non-existent file pointed to by a symbolic link (visible when you type ls -l)
# lc            LEFTCODE, LEFT          Opening terminal code
# rc            RIGHTCODE, RIGHT        Closing terminal code
# ec            ENDCODE, END            Non-filename text
# *.extension                           Every file using this extension e.g. *.jpg

# Effects              Foreground Colors   Background Colors
# 00 - Default color   31 - red            40 - black
# 01 - bold            32 - green          41 - red
# 04 - underlined      33 - orange         42 - green
# 05 - flashing text   34 - blue           43 - orange
# 07 - reversed        35 - purple         44 - blue
# 08 - concealed       36 - cyan           45 - purple
#                      37 - gray           46 - cyan
#                      90 - dark gray      47 - gray
#                      91 - light red      100 - dark gray
#                      92 - light green    101 - light red
#                      93 - yellow         102 - light green
#                      94 - light blue     103 - yellow
#                      95 - light purple   104 - light blue
#                      96 - turquoise      105 - light purple
#                                          106 - turquoise

# GNU LS
typeset -g -a LS_COLORS

LS_COLORS+="no=00"          # default (normal files) = default
LS_COLORS+="fi=00"          # normal file = default
LS_COLORS+="di=00;32"       # directory = green
LS_COLORS+="ln=00;36"       # symlink = cyan
LS_COLORS+="pi=40;33"       # pipe = orange / black
LS_COLORS+="so=01;32"       # socket = bold green
LS_COLORS+="bd=00;34;35"    # block device = blue / purple
LS_COLORS+="cd=40;33;01"    # character device = blue / orange
LS_COLORS+="or=01;05;37;41" # orphaned file = flashing bold gray / red
LS_COLORS+="mi=01;05;37;41" # missing symbolic link dest = flashing bold gray / red
LS_COLORS+="ex=00;31"       # executable = red
LS_COLORS+="*.cmd=00;31"    # executable = red
LS_COLORS+="*.exe=00;31"    # executable = red
LS_COLORS+="*.com=00;31"    # executable = red
LS_COLORS+="*.btm=00;31"    # executable = red
LS_COLORS+="*.bat=00;31"    # executable = red
LS_COLORS+="*.sh=00;31"     # executable = red
LS_COLORS+="*.csh=00;31"    # executable = red
LS_COLORS+="*.zsh=00;31"    # executable = red
LS_COLORS+="*.tar=00;93"    # archive = yellow
LS_COLORS+="*.tgz=00;93"    # archive = yellow
LS_COLORS+="*.arj=00;93"    # archive = yellow
LS_COLORS+="*.taz=00;93"    # archive = yellow
LS_COLORS+="*.lzh=00;93"    # archive = yellow
LS_COLORS+="*.zip=00;93"    # archive = yellow
LS_COLORS+="*.z=00;93"      # archive = yellow
LS_COLORS+="*.Z=00;93"      # archive = yellow
LS_COLORS+="*.gz=00;93"     # archive = yellow
LS_COLORS+="*.bz2=00;93"    # archive = yellow
LS_COLORS+="*.bz=00;93"     # archive = yellow
LS_COLORS+="*.tz=00;93"     # archive = yellow
LS_COLORS+="*.rpm=00;93"    # archive = yellow
LS_COLORS+="*.cpio=00;93"   # archive = yellow
LS_COLORS+="*.jpg=00;35"    # image = purple
LS_COLORS+="*.gif=00;35"    # image = purple
LS_COLORS+="*.bmp=00;35"    # image = purple
LS_COLORS+="*.xbm=00;35"    # image = purple
LS_COLORS+="*.xpm=00;35"    # image = purple
LS_COLORS+="*.png=00;35"    # image = purple
LS_COLORS+="*.tif=00;35"    # image = purple

# Join the array elements together with colons
LS_COLORS=${(j<:>)LS_COLORS}
export LS_COLORS


##
## BSD ls
##

# directory
# symbolic link
# socket
# pipe
# executable
# block special
# character special
# executable with setuid bit set
# executable with setgid bit set
# directory writable to others, with sticky bit
# directory writable to others, without sticky bit

# a - black                              A - bold black, usually shows up as dark grey
# b - red                                B - bold red
# c - green                              C - bold green
# d - brown                              D - bold brown
# e - blue                               E - bold blue
# f - magenta                            F - bold magenta
# g - cyan                               G - bold cyan
# h - light gray                         H - bold light gray
# x - default foreground or background   

typeset -g -a LSCOLORS

LSCOLORS+="cx" # directory = green
LSCOLORS+="gx" # symbolic link = cyan
LSCOLORS+="Cx" # socket = bold green
LSCOLORS+="dx" # pipe = brown
LSCOLORS+="bx" # executable = red
LSCOLORS+="eg" # block special = blue / magenta
LSCOLORS+="ed" # character special = blue / brown
LSCOLORS+="ab" # executable with setuid bit set = black / red
LSCOLORS+="ag" # executable with setgid bit set = black / cyan
LSCOLORS+="ac" # directory writable to others, with sticky bit = black / green
LSCOLORS+="dx" # directory writable to others, without sticky bit = brown

# Join the array elements together with nothing
LSCOLORS=${(j::)LSCOLORS}
export LSCOLORS
