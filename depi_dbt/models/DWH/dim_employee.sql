SELECT
    employee_id,
    first_name,
    last_name,
    gender,
    email,
    date_of_birth
FROM {{ ref('obt_employees') }}