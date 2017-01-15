#!/bin/bash

HOMEDIR="/opt/katastr.io"
COMMIT=$(git log --oneline | head -n 1 | cut -d ' ' -f 1)

cd ~/clone

rsync -aqz ./* codeship@193.85.199.37:${HOMEDIR}/papertrail-${COMMIT} && \
ssh codeship@193.85.199.37 "find ${HOMEDIR} -maxdepth 1 -type d ! -name papertrail-${COMMIT} -name 'papertrail-*' -exec rm -rf '{}' \;"
