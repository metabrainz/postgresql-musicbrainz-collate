CREATE EXTENSION musicbrainz_collate;

-- Warning: Older ICU versions (before 4.8 or 4.6) may give different results
SELECT * FROM (VALUES('AAA'), ('äää'), ('ÄÄÄ'), ('aaa')) AS x(txt)
    ORDER BY musicbrainz_collate(txt);
SELECT musicbrainz_collate('foobar');
SELECT musicbrainz_collate('ľščťžýáí');
SELECT musicbrainz_collate('');
SELECT musicbrainz_collate(null);
