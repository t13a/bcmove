#!/bin/bash

set -euo pipefail

BCMOVE_USER=bcmove
BCMOVE_GROUP=bcmove
BCMOVE_HOME=/bcmove

addgroup -S ${BCMOVE_GROUP}
adduser -h ${BCMOVE_HOME} -g ${BCMOVE_GROUP} -s /sbin/nologin -G ${BCMOVE_GROUP} -SDH ${BCMOVE_USER}

if [ -z "${CROND_DISABLED:-}" ]
then
    cat << EOF > /var/spool/cron/crontabs/${BCMOVE_USER}
${CROND_SCHEDULE} /usr/local/bin/bcmove cron
EOF
fi

exec "${@}"
