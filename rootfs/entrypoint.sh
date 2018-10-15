#!/bin/bash

set -euo pipefail

if [ -z "${CROND_DISABLED:-}" ]
then
    cat << EOF > /var/spool/cron/crontabs/root
${CROND_SCHEDULE} /usr/local/bin/bcmove cron
EOF
fi

exec "${@}"
