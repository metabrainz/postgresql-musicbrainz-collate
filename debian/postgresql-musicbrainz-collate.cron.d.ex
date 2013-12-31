#
# Regular cron jobs for the postgresql-musicbrainz-collate package
#
0 4	* * *	root	[ -x /usr/bin/postgresql-musicbrainz-collate_maintenance ] && /usr/bin/postgresql-musicbrainz-collate_maintenance
