select 
customer_segment,
age_group,
count(customer_number) as total_customers,
sum(total_sales) as total_sales
from gold.report_customers
group by customer_segment,age_group