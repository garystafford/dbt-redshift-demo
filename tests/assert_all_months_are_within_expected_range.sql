-- expected numeric range of month: 1-12
select month
from {{ ref('stg_tickit__dates') }}
group by month
having not (month >= 1 and month <= 12)