-- expected numeric range for day of month: 1-31
select day
from {{ ref('stg_tickit__dates') }}
group by day
having not (day >= 1 and day <= 31)