-- all prices paid for tickets should be a positive value of $1 or greater
-- there should be no credits (negative values)
select price_paid
from {{ ref('stg_tickit__sales') }}
group by price_paid
having not (price_paid >= 1)