WITH first_login AS (
  SELECT player_id, MIN(event_date) AS first_date
  FROM Activity
  GROUP BY player_id
),
consecutive_logins AS (
  SELECT fl.player_id
  FROM first_login fl
  INNER JOIN Activity a ON fl.player_id = a.player_id AND a.event_date = DATE_ADD(fl.first_date, INTERVAL 1 DAY)
)
SELECT ROUND(COUNT(*) * 1.0 / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM consecutive_logins;
