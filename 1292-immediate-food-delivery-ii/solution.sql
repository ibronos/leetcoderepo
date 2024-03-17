
WITH first_orders AS (
  SELECT
    customer_id,
    order_date,
    customer_pref_delivery_date,
    CASE
      WHEN order_date = customer_pref_delivery_date THEN 'immediate'
      ELSE 'scheduled'
    END AS order_type
  FROM
    (
      SELECT
        customer_id,
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
      FROM
        Delivery
    ) t
  WHERE
    rn = 1
)
SELECT
  ROUND(
    100.0 * SUM(CASE WHEN order_type = 'immediate' THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS immediate_percentage
FROM
  first_orders;
