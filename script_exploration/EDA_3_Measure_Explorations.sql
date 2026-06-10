-- Find the Total Sales
Select sum(sales_amount) as total_sales from gold.fact_sales

-- Find how many items are sold
select sum(quantity) as total_items_sold from gold.fact_sales


--Find the Total number of Orders
select count(order_number) as total_orders from gold.fact_sales
select count(distinct order_number) as total_orders from gold.fact_sales

-- Find the total number of products
select count(product_name) as total_products from gold.dim_products
select count(distinct product_name) as total_products from gold.dim_products

-- Find the total number of customers
select count(customer_key) as total_customers from gold.dim_customers

-- Find the total number of customers that has placed an order
select count(distinct customer_key) as total_customers from gold.fact_sales;

-- Generate a report that shows all key metrics of the business
Select 'Total Sales' as measure_name, sum(sales_amount) as measure_value from gold.fact_sales

-- Generate a report that shows all key metrics of the business
select 'Total Sales' as measure_name, sum(sales_amount) as measure_value from gold.fact_sales
union all
select 'Total Quantity', sum(quantity) from gold.fact_sales
union all
select 'Average Price', avg(price) from gold.fact_sales
union all 
select 'Ttal Nr.Orders', count(product_name) from gold.dim_products
union all
select 'Total Nr. Customers', count(customer_key) from gold.dim_customers