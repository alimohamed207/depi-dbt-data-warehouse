SELECT
    employee_id,
    department_key,
    country_key,
    gender_key,
    date_key
FROM {{ ref('fact_employee') }}
WHERE department_key IS NULL
   OR country_key IS NULL
   OR gender_key IS NULL
   OR date_key IS NULL
