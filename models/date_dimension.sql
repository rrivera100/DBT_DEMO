with cte as
(
    select  to_timestamp(started_at) as started_at,
            date(to_timestamp(started_at)) as date_started_at,
            hour(to_timestamp(started_at)) as hour_started_at,
            {{get_season('started_at')}} as season_of_year,
            {{get_day_type('started_at')}} as day_type
    from {{ ref('bike_correction') }}
    -- from {{ source('demo', 'bike') }}
    where started_at != 'started_at'
)

select * from cte