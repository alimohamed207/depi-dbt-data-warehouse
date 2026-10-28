
WITH genders AS (
    SELECT DISTINCT
        UPPER(TRIM(gender)) AS gender_name
    FROM {{ ref('obt_employees') }}
    WHERE gender IS NOT NULL
        AND TRIM(gender) <> ''
)
SELECT
    ROW_NUMBER() OVER (ORDER BY gender_name) AS gender_key,
    gender_name
FROM genders
