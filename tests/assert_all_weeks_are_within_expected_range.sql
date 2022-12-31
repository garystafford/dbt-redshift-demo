-- expected numeric range for week of year: 1-53
select week
from {{ ref('stg_tickit__dates') }}
group by week
having not (week >= 1 and week <= 53)
