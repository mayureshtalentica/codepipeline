#!/usr/bin/env sh

for env in ${ARGS}
do
export $env
done

export CD_INSIGHTS_CONFIG="/cd_insights/config/${ENV}.json"
chmod +x config/env/${ENV}.sh
. ./config/env/${ENV}.sh

python3 manage.py runserver 0.0.0.0:8000 --settings=cd_insights.settings.config