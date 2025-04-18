create table retail_sales(
	transactions_id	int primary key,
	sale_date date,
	sale_time time,
	customer_id int,
	gender varchar(50),
	age int,
	category varchar(20),
	quantiy int,
	price_per_unit int,
	cogs float,
	total_sale int
);

select * from retail_sales;

--q=1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'

select * from retail_sales
where sale_date = '2022-11-05';

--q=2 Write a SQL query to retrieve all transactions where the category is 'Clothing' 
--    and the quantity sold is more than 4 in the month of Nov-2022:
select * from retail_sales
where category = 'Clothing'
		and quantiy >= 4
		and
		to_char(sale_date ,'YYYY-MM') = '2022-11';

-- q=3 Write a SQL query to calculate the total sales (total_sale) for each category.	 
	
select sum(total_sale) as total_sale_category_based,category
from retail_sales
group by category;


--q=4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category

select avg(age) as average_age,category from retail_sales
where category = 'Beauty'
group by category  ;

--q=5 Write a SQL query to find all transactions where the total_sale is greater than 1000.:


select transactions_id,total_sale from retail_sales
where total_sale >1000;

--q=6 Write a SQL query to find the total number of transactions (transaction_id) made by 
--    each gender in each category.:
select count(transactions_id) as total_no,gender from retail_sales
group by gender;

--q=7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

select 
	avg(total_sale) as average_sale,
	to_char(sale_date,'YYYY-MM') as month
	from retail_sales
group by to_char(sale_date,'YYYY-MM')
order by average_sale  desc
limit 1;

--q=8 Write a SQL query to find the top 5 customers based on the highest total sales

select customer_id,total_sale from retail_sales
where total_sale is not null
order by total_sale desc
limit 5;

--q=9 Write a SQL query to find the number of unique customers who purchased items from each category.:

select  count( distinct customer_id),category from retail_sales
group by category;

