SELECT A.machine_id,
ROUND(
    SUM( 
        CASE WHEN 
        A.machine_id = B.machine_id 
        AND 
        A.process_id = B.process_id
        AND 
        A.activity_type = 'start'
        AND 
        B.activity_type = 'end'
        THEN 
        (B.timestamp - A.timestamp)
        END
    ) / COUNT(DISTINCT a.process_id)
,3)
AS processing_time

FROM Activity A, Activity B
GROUP BY A.machine_id
ORDER BY A.machine_id ASC
