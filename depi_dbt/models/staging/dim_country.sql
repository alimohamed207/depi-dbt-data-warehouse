
WITH countries AS (
    SELECT DISTINCT
        TRIM(country) AS country_name
    FROM {{ ref('obt_employees') }}
    WHERE country IS NOT NULL
        AND TRIM(country) <> ''
)
SELECT
    ROW_NUMBER() OVER (ORDER BY country_name) AS country_key,
    country_name
FROM countries
