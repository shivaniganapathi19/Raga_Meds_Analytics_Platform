use Raga_Meds_Analytics;

/*==========================================================
                    CUSTOMER ANALYTICS
==========================================================*/

-- customer lifetime value

select
      c.customer_id,
      c.customer_name,
      count(s.sale_id) as total_orders,
      round(sum(s.total_amount), 2) as lifetime_value
from customers c
join sales s
      on c.customer_id = s.customer_id
group by 
      c.customer_id,
      c.customer_name
order by lifetime_value desc;

-- repeat customers

select
      c.customer_name,
      count(s.sale_id) as total_orders
from customers c
join sales s
      on c.customer_id = s.customer_id
group by 
	  c.customer_id,
      c.customer_name
having count(s.sale_id) > 1
order by total_orders desc;

-- top 10 valuable customers

select
      c.customer_name,
      round(sum(s.total_amount), 2) as lifetime_value
from customers c
join sales s
      on c.customer_id = s.customer_id
group by 
      c.customer_id,
      c.customer_name
order by lifetime_value desc
limit 10;

-- customer purchase frequency

select
      c.customer_name,
      count(s.sale_id) as purchase_frequency,
      round(avg(s.total_amount), 2) as average_purchase_value
from customers c
join sales s
      on c.customer_id = s.customer_id
group by 
      c.customer_id,
      c.customer_name
order by purchase_frequency desc;

-- average customer lifetime value

select round(avg(customer_total), 2) as average_customer_value
from
(   select
		sum(total_amount) as customer_total
    from sales
group by customer_id) customer_summary;

-- customers spending above average

select
	  c.customer_name,
      round(sum(s.total_amount), 2) as lifetime_value
from customers c
join sales s
      on c.customer_id = s.customer_id
group by c.customer_id,c.customer_name
having lifetime_value >
(
select avg(customer_total)
from
(   select sum(total_amount) as customer_total
    from sales
group by customer_id
) customer_summary
)
order by lifetime_value desc;

-- revenue by city

select
      c.city,
      count(distinct c.customer_id) as customers,
	  round(sum(s.total_amount), 2) as revenue
from customers c
join sales s
      on c.customer_id = s.customer_id
group by c.city
order by revenue desc;

-- customer age group analysis

select
case
when c.age between 18 and 30 then '18-30'
when c.age between 31 and 45 then '31-45'
when c.age between 46 and 60 then '46-60'
else '60+'
end as age_group,
count(*) as total_customers
from customers c
group by age_group
order by age_group;

-- revenue by age group

select
case
when c.age between 18 and 30 then '18-30'
when c.age between 31 and 45 then '31-45'
when c.age between 46 and 60 then '46-60'
else '60+'
end as age_group,
round(sum(s.total_amount),2) as revenue
from customers c
join sales s
     on c.customer_id = s.customer_id
group by age_group
order by revenue desc;

-- customer ranking based on spending

select
      c.customer_name,
      round(sum(s.total_amount), 2) as lifetime_value,
dense_rank() over(order by sum(s.total_amount) desc) as customer_rank
from customers c
join sales s
      on c.customer_id = s.customer_id
group by 
	  c.customer_id,
      c.customer_name;

-- customer journey summary

select
      c.customer_name,
      min(s.sale_date) as first_purchase,
      max(s.sale_date) as latest_purchase,
      count(s.sale_id) as total_orders,
      round(sum(s.total_amount), 2) as lifetime_value
from customers c
join sales s
      on c.customer_id = s.customer_id
group by 
      c.customer_id,
      c.customer_name
order by lifetime_value desc;

-- rfm analysis (recency, frequency, monetary)

select
      c.customer_name,
	  datediff((select max(sale_date) from sales), max(s.sale_date)) as recency,
      count(s.sale_id) as frequency,
      round(sum(s.total_amount), 2) as monetary
from customers c
join sales s
      on c.customer_id = s.customer_id
group by 
      c.customer_id,
      c.customer_name
order by monetary desc;