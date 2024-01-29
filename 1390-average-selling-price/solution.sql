select Prices.product_id,
round(
    COALESCE(
        sum(
            case when
            Prices.product_id = U1.product_id
            and
            U1.purchase_date between Prices.start_date and Prices.end_date
            then
            (U1.units * Prices.price)
            else
            0
            end
        )
        /
        (
            select sum(U2.units)
            from  UnitsSold U2
            where U2.product_id = U1.product_id
            and U1.product_id = Prices.product_id
            group by U1.product_id
        )
    ,0)
,2) 
as average_price
from Prices
left join UnitsSold U1 on Prices.product_id = U1.product_id
group by Prices.product_id

