#!/bin/sh -x

[ -d ../my-vim-ide/templates ] && \
[ -d ../c-support/c-support/templates ] && \
mv ../c-support/c-support/templates ../c-support/c-support/templates.org && \
ln -sf ../../my-vim-ide/templates ../c-support/c-support/templates

[ -d ../my-vim-ide/codesnippets ] && \
[ -d ../c-support/c-support/codesnippets ] && \
mv ../c-support/c-support/codesnippets ../c-support/c-support/codesnippets.org && \
ln -sf ../../my-vim-ide/codesnippets ../c-support/c-support/codesnippets

return 0 || exit 0
