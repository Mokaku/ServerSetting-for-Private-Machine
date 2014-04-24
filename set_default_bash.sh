#!/bin/bash -ex

cat <<__EOA__ >~/.login
# .login
#
# ログインシェルがcsh/tcshだった場合に好きなシェルを起動する。
# chshできるならした方が良いが、chshできない環境で重宝する。
set favorit_shell=/bin/bash
set favorit_shell_opt=--login
if ( -f "\$favorit_shell" && "\$shell" != "\$favorit_shell" ) then
  exec \$favorit_shell \$favorit_shell_opt
endif
__EOA__

cat <<__EOB__ >~/.profile
# .profile
#
# ログインシェルがshだった場合に好きなシェルを起動する。
# ログインシェルがbashの場合にも利用可能。
# (ただし.bash_profileや.bash_loginがある場合は読まれない)
# chshできるならした方が良いが、chshできない環境で重宝する。
FAVORIT_SHELL=/bin/bash
## FAVORIT_SHELL_OPT=--login
if [ -e \$FAVORIT_SHELL -a "\$SHELL" != "\$FAVORIT_SHELL" ] ; then
  exec \$FAVORIT_SHELL \$FAVORIT_SHELL_OPT
fi
__EOB__
