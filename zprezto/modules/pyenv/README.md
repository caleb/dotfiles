pyenv
======

Enables the Python environment version manager ([pyenv](https://github.com/yyuu/pyenv))

### Usage

Install pyenv by cloning the repository into your home directory:

    git clone git://github.com/yyuu/pyenv.git ~/.pyenv

Then follow the instructions on the [pyenv](https://github.com/yyuu/pyenv)

### OS X Note

Make sure you build/install python with the correct arguments (i.e. OS X doesn't have real GNU Readline, but it pretends to, so you can use the following command after installing readline with homebrew):

    LDFLAGS="-L/usr/local/opt/readline/lib" CFLAGS="-I/usr/local/opt/readline/include" pyenv install 2.7.5
