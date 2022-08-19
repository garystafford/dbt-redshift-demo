-- all quanities of tickets sold should be a positive value of 1 or greater
-- there should be no credits (negative values)
select qty_sold
from {{ ref('stg_tickit__sales') }}
group by qty_sold
having not (qty_sold >= 1)