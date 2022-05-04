select T1.State_name,T1.OrderCount as totalOrders,T2.Month,T2.OrderCount_of_Month, (T2.OrderCount_of_Month/T1.OrderCount)*100 as monthly_order_percentage
From
 ({{ ref('statewise_order_count') }})T1
 JOIN ( {{ ref('statewise_monthly_order_count') }} ) T2 ON T1.STATE_name=T2.State_name



