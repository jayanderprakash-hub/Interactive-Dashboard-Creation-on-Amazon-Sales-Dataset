create database amazon_sales_db;

use amazon_sales_db;

select * from amazon_sales_dataset$;

--Query 1--

select product_category, ROUND(avg(total_revenue), 0) as average_revenue 
from amazon_sales_dataset$
group by product_category;

--Query 2--

select customer_region, ROUND(sum(total_revenue), 0) as regional_revenue
from amazon_sales_dataset$
group by customer_region
order by regional_revenue DESC;

--Query 3--

select product_category, sum(quantity_sold) as total_quantity_sold
from amazon_sales_dataset$
group by product_category
order by total_quantity_sold DESC;

--Query 4--

select payment_method, ROUND(sum(total_revenue), 0) as revenue_acquired
from amazon_sales_dataset$
group by (payment_method)
order by revenue_acquired Desc;

--Query 5--

select product_category, ROUND(avg(rating), 3) as average_rating
from amazon_sales_dataset$
group by product_category
order by average_rating DESC;

-- Query 6--

select order_id, product_category, total_revenue 
from amazon_sales_dataset$
where total_revenue in (
	select TOP 10 total_revenue
	from amazon_sales_dataset$
	order by total_revenue DESC
	);

--Query 8--

select order_id, product_category, review_count
from amazon_sales_dataset$
order by review_count DESC;

--Query 10--
select product_id, ROUND(avg(rating), 3) as high_performing_prds
from amazon_sales_dataset$
group by product_id
having avg(rating) > 4
order by high_performing_prds DESC;

--Query 9--

select EOMONTH(order_date) as EndOfMonth, ROUND(sum(total_revenue),0) as RevenueEarned
from amazon_sales_dataset$
group by EOMONTH(order_date)
order by EndOfMonth;

--Query 7--
select discount_percent, quantity_sold, total_revenue
from amazon_sales_dataset$
order by total_revenue DESC;