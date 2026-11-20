select 
(DATE_FORMAT(T1.trans_date,'%Y-%m'))
as month,
T1.country,
sum(
    case when 
    DATE_FORMAT(T2.trans_date,'%Y-%m') = DATE_FORMAT(T1.trans_date,'%Y-%m')
    then 1
    else 0
    end
)
as trans_count,

sum(
    case when 
    DATE_FORMAT(T2.trans_date,'%Y-%m') = DATE_FORMAT(T1.trans_date,'%Y-%m')
    and T2.state = 'approved'
    then 1
    else 0
    end
)
as approved_count,

sum(
    case when
    DATE_FORMAT(T2.trans_date,'%Y-%m') = DATE_FORMAT(T1.trans_date,'%Y-%m')
    then T2.amount
    else 0
    end
)
as trans_total_amount,

sum(
    case when 
    DATE_FORMAT(T2.trans_date,'%Y-%m') = DATE_FORMAT(T1.trans_date,'%Y-%m')
    and T2.state = 'approved'
    then T2.amount
    else 0
    end
)
as approved_total_amount

from Transactions T1
join Transactions T2 on T1.id = T2.id
group by month, T1.country
order by month asc, T1.id asc
