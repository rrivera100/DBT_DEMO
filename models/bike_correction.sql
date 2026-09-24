with bike as
(
    select
        ride_id,
        replace(started_at, '"', '') started_at,
        replace(ended_at, '"', '') ended_at,
        start_station_name,
        start_station_id,
        end_station_name,
        end_station_id,
        start_lat,
        start_lng,
        end_lat,
        eng_lng,
        member_casual
    from {{ source('demo', 'bike') }}
    where ride_id != '"bikeid"'
)

select * from bike