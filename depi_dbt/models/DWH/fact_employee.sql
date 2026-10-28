
SELECT
    e.employee_id,

    d.department_key,
    c.country_key,
    g.gender_key,
    dt.date_key,

    e.salary,
    CAST(1 AS INT) AS employee_count

FROM {{ ref('obt_employees') }} AS e

LEFT JOIN {{ ref('dim_department') }} AS d
    ON TRIM(e.department) = d.department_name

LEFT JOIN {{ ref('dim_country') }} AS c
    ON TRIM(e.country) = c.country_name

LEFT JOIN {{ ref('dim_gender') }} AS g
    ON UPPER(TRIM(e.gender)) = g.gender_name

LEFT JOIN {{ ref('dim_date') }} AS dt
    ON TRY_CAST(e.date_of_birth AS DATE) = dt.[date]
