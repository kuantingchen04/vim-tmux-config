# vim-tmux-config

1. Install bundle
2. .vimrc call :PluginInstall
(3. ubuntu)  Make sure you have Vim 7.4.1578 with Python 2 or Python 3 support
* compile latest vim for YCM
    * https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
    * [Warn] need revise the path when configure     
    * for Ubuntu 14.04 (Trusty) users: You can only use Python 2 or Python 3. If you try to compile vim with both python-config-dir and python3-config-dir, it will give you an error YouCompleteMe unavailable: requires Vim compiled with Python (2.6+ or 3.3+) support
    * ./configure --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu
    * change ycm_python_binary_path=‘/usr/lib/python2.7'
* Build YCM (https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64)

(3. mac) compile latest macvim for YCM (document)
