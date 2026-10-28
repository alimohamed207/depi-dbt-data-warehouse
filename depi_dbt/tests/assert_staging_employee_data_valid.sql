SELECT employee_id, salary, date_of_birth
FROM {{ ref('obt_employees') }}
WHERE employee_id IS NULL
   OR salary IS NULL
   OR salary < 0
   OR date_of_birth IS NULL
