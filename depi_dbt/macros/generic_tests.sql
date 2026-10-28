{% test non_negative(model, column_name) %}
SELECT {{ column_name }}
FROM {{ model }}
WHERE {{ column_name }} < 0
{% endtest %}

{% test not_empty(model, column_name) %}
SELECT {{ column_name }}
FROM {{ model }}
WHERE {{ column_name }} IS NULL
   OR TRIM(CAST({{ column_name }} AS VARCHAR(4000))) = ''
{% endtest %}

{% test unique_combination_of_columns(model, combination_of_columns) %}
SELECT
    {% for column in combination_of_columns %}
        {{ column }}{% if not loop.last %}, {% endif %}
    {% endfor %}
FROM {{ model }}
GROUP BY
    {% for column in combination_of_columns %}
        {{ column }}{% if not loop.last %}, {% endif %}
    {% endfor %}
HAVING COUNT(*) > 1
{% endtest %}
