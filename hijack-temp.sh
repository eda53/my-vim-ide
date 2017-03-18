#!/bin/sh -x

[ -d ../my-vim-ide/templates ] && \
[ -d ../vim-template/templates ] && \
mv ../vim-template/templates ../vim-template/templates.org && \
ln -sf ../my-vim-ide/templates ../vim-template/templates

#[ -d ../my-vim-ide/codesnippets ] && \
#[ -d ../c-support/c-support/codesnippets ] && \
#mv ../c-support/c-support/codesnippets ../c-support/c-support/codesnippets.org && \
#ln -sf ../../my-vim-ide/codesnippets ../c-support/c-support/codesnippets

return 0 || exit 0
