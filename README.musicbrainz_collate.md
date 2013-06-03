PostgreSQL MusicBrainz Collate Extension
========================================

This extension provides collate support using the
[Unicode Collation Algorithm](http://www.unicode.org/unicode/reports/tr10/),
as it is implemented by the
[International Components for Unicode](http://userguide.icu-project.org/collation)
library.


Usage
-----

This module provides a simple function to generate a sortkey from a postgresql
TEXT column.

    test=> select * from unsorted order by musicbrainz_collate(column) limit 4;
     name
    ------
     AAA
     ÄÄÄ
     aaa
     äää

Note that older versions of ICU may give a different order:

     name
    ------
     aaa
     AAA
     äää
     ÄÄÄ

Warning: Collate always assumes that input is UTF-8 encoded. This function is
not very useful in databases with other encodings.

Warning: Indexes based on this function should be rebuilt after upgrading ICU.


Requirements
------------

To use this extension you will need:

- PostgreSQL version 8.3 or newer
- libicu version 3.8 or newer

You will need -dev packages installed for both of those, check that pg_config
and icu-config are in your path.


Installation
------------

To build and install this extension, simply run:

    % make
    % sudo make install

Then, to activate this extension in your database, run the SQL:

    CREATE EXTENSION musicbrainz_collate;

Databases using the old extension system can be upgraded with:

    CREATE EXTENSION musicbrainz_collate FROM unpackaged;

If you run into problems with building, see [PostgreSQL wiki for
troubleshooting](https://wiki.postgresql.org/wiki/Extension_build_troubleshooting)


License
-------

musicbrainz_collate, a postgresql extension to sort with the UCA.
Copyright 2010  MetaBrainz Foundation

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
