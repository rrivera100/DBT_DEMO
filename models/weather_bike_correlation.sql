with cte as
(
    select t.*
    from {{ ref('trip_fact') }} t
)

select * from cte