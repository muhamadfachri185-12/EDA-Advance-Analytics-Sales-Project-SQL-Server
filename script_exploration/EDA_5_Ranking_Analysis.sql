-- which 5 products generate the highest revenue?

select top 5
p.product_name,
sum (f.sales_amount) total_revenue
from gold.fact_sales f
left join gold.dim_products p
on p.product_key = f.product_key
group by p.product_name
order by total_revenue desc

select *
from (
select
p.product_name,
sum (f.sales_amount) total_revenue,
row_number() over (order by sum(f.sales_amount) desc) as rank_products
from gold.fact_sales f
left join gold.dim_products p
on p.product_key = f.product_key
group by p.product_name) t
where rank_products <= 5

-- which 5 products generate the worst-performing of sales?
select top 5
p.product_name,
count (f.sales_amount) total_sales
from gold.fact_sales f
left join gold.dim_products p
on p.product_key = f.product_key
group by p.product_name
order by total_sales asc

-- Find the top 10 customers who have generated the highes revenue
select top 10
c.customer_key,
c.first_name,
c.last_name,
sum(f.sales_amount) as total_revenue
from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key = f.customer_key
group by c.customer_key, c.first_name, c.last_name
order by total_revenue desc


-- Find the top 3 customers with the fewest orders placed
select top 3
c.customer_key,
c.first_name,
c.last_name,
count(distinct order_number) as total_orders
from gold.fact_sales f
left join gold.dim_customers c
on c.customer_key = f.customer_key
group by c.customer_key, c.first_name, c.last_name
order by total_orders asc