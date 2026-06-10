-- Explore All Countries our customers come from

Select distinct country from gold.dim_customers

-- Explore All Categories "The Major Division"
Select distinct category,subcategory, product_name from gold.dim_products
order by 1,2,3

-- Find the date of the first and last order

select 
min(order_date) as first_order_date,
max(order_date) as last_order_date,
datediff (year, min (order_date), max(order_date)) as order_range_years
from gold.fact_sales;

-- Find the date youngest and the oldest customer
select 
min(birthdate) as oldest_birthdate,
datediff(year, min(birthdate), getdate()) as oldest_age,
max(birthdate) as youngest_birthdate,
datediff(year, max(birth
from gold.dim_customers