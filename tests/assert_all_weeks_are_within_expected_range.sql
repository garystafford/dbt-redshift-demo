-- expected numeric range for week of year: 1-52
select day
from {{ ref('stg_tickit__dates') }}
group by day
having not (day >= 1 and day <= 52)