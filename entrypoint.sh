#!/usr/bin/bash
python manage.py migrate --check
status=$?
if [[ status != 0 ]]; then
  python manage.py migrate
fi
python manage.py collectstatic -c --no-input
exec "$@"
