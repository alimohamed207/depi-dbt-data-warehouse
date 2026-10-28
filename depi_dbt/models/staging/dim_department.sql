
WITH departments AS (
    SELECT DISTINCT
        TRIM(department) AS department_name
    FROM {{ ref('obt_employees') }}
    WHERE department IS NOT NULL
        AND TRIM(department) <> ''
)
SELECT
    ROW_NUMBER() OVER (ORDER BY department_name) AS department_key,
    department_name
FROM departments
