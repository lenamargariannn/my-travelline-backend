ALTER TABLE translations DROP CONSTRAINT translations_locale_check;
ALTER TABLE translations ADD CONSTRAINT translations_locale_check
    CHECK (locale IN ('EN', 'HY', 'RU'));
