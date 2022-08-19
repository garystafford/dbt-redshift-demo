-- expected numeric range of quarter: 1-4
select qtr
from {{ ref('stg_tickit__dates') }}
group by qtr
having not (qtr >= 1 and qtr <= 4)