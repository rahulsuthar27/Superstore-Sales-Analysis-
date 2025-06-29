create database Project;
use project;
select * from superstore;

#--Number of Rows
select count(*) from superstore;

-- get the unique ship Mode 
select distinct(`ship mode`) from superstore;

show columns from superstore;

-- count how many orders were placed
select count(distinct `order id`) from superstore;

-- Show total sales per category
select Category,sum(`Sales`) 
from superstore
group by Category;

-- List all customers from California
select distinct `Customer Name`
from superstore
where State="California";

 -- Find the total no of unique customers
select count(distinct `Customer ID`)
from superstore;

-- what is the total profit for the 'Chairs' sub-category
select `sub-category` ,sum(Profit)as so
from superstore
group by `sub-category`
having `sub-category`='chairs';

-- Show top 5 products by sales.
select `product name`,sum(sales) as sale
from superstore
group by `Product name`
order by sale desc
limit 5;

-- Find the earliest and latest order date
select min(`order date`) as `earliest order date`,max(`order date`) as `oldest order date`
 from superstore;
 
 -- Average discount per region
 select region,avg(discount) 
 from superstore
 group by region ;
 
 
 -- state with highest total sales
 select state,sum(sales) as total_sales
 from superstore
 group by state
 order by total_sales desc
 limit 1;
 
 
 -- Total quantity of products sold per sub-category
 select `sub-category`,sum(quantity) as `total quantity` 
 from superstore
 group  by `sub-category`;
 
 -- List customers with more than 2 order
 select `customer id`,`customer name`,count(distinct `order id`)
 from superstore
 group by `customer id`,`customer name`
 having count(distinct `order id`)>2;




-- Number of orders shipped using `Second Class`
select count(distinct `order id`)
from superstore
where `ship mode`="Second Class";
select * from superstore;


-- Top 3 sub categories by profit in each category
select *
from (
select Category, `Sub-Category`, SUM(Profit) as total_profits,
RANK() OVER (PARTITION BY  Category ORDER BY SUM(Profit) Desc) as rk
from superstore
group by Category, `Sub-Category`)
as ranked_subs
where rk <= 3;

-- Find orders with negative profit
select * from superstore
where profit <0;

select min(profit),max(profit) from superstore;


-- Cities where more than 10000 of sales happened
select city,sum(sales)
from superstore
group by  city
having sum(sales)<10000;


-- Cities where more than 10000 of sales happened
select `product name`
from superstore
where sales=0 and profit=0
;

-- Sub-categories where discount was always 0.
select `sub-category` 
from superstore
group by `sub-category` 
having max(discount)=0;



select * from superstore;

-- Rank customers by Profit in each region
select * from(
select region,`customer name`,sum(profit),
rank() over(partition by region order by sum(profit) desc)
from superstore
group by region,`customer name`
) as region customer;


-- Which states have the lowest average sales per order?
select state,avg(sales_order) as average_sale from(
select state ,`order id`,sum(sales) as sales_order
from superstore
group by state,`order id`
) as sate_sale
group by state
order by average_sale asc;

-- Write a CTE to find most profitable product in each sub-category.
with ao as(
select `sub-category`,`product name`,sum(profit) as so,
rank() over(partition by `sub-category` order by sum(profit) desc) as sr
from superstore
group by `sub-category`,`product name`
)
select * from ao
where sr<2;