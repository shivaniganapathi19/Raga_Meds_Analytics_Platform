use Raga_Meds_Analytics;

/*==========================================================
                    SALES ANALYTICS
==========================================================*/

-- monthly sales revenue

select
      date_format(s.sale_date,'%Y-%m') as sales_month,
      count(s.sale_id) as total_orders,
      round(sum(s.total_amount), 2) as total_revenue
from sales s
group by sales_month
order by sales_month;

-- monthly sales growth

select
      sales_month,
      total_revenue,
      round(
      (
      total_revenue -
      lag(total_revenue) over(order by sales_month)
      )
      /
      lag(total_revenue) over(order by sales_month)
      * 100, 2
      ) as growth_percentage
from
(
      select
            date_format(sale_date,'%Y-%m') as sales_month,
            sum(total_amount) as total_revenue
      from sales
      group by sales_month
) monthly_sales;

-- monthly profit trend

select
      date_format(s.sale_date,'%Y-%m') as sales_month,
      round(sum(sd.sub_total - (m.cost_price * sd.quantity)), 2) as total_profit
from sales s
join sale_details sd
      on s.sale_id = sd.sale_id
join medicines m
      on sd.medicine_id = m.medicine_id
group by sales_month
order by sales_month;

-- daily sales revenue

select
      s.sale_date,
      count(s.sale_id) as total_orders,
      round(sum(s.total_amount), 2) as daily_revenue
from sales s
group by s.sale_date
order by s.sale_date;

-- average daily sales

select
      round(avg(daily_revenue), 2) as average_daily_sales
from
(
      select
            sale_date,
            sum(total_amount) as daily_revenue
      from sales
      group by sale_date
) daily_sales;

-- highest sales day

select
      sale_date,
      round(sum(total_amount), 2) as revenue
from sales
group by sale_date
order by revenue desc
limit 1;

-- sales by payment method

select
      payment_method,
      count(sale_id) as total_orders,
      round(sum(total_amount), 2) as revenue
from sales
group by payment_method
order by revenue desc;

-- weekday sales analysis

select
      dayname(sale_date) as weekday,
      count(sale_id) as total_orders,
      round(sum(total_amount), 2) as revenue
from sales
group by weekday
order by revenue desc;

-- top selling medicines by revenue

select
      m.medicine_name,
      sum(sd.quantity) as quantity_sold,
      round(sum(sd.sub_total), 2) as revenue
from medicines m
join sale_details sd
      on m.medicine_id = sd.medicine_id
group by
      m.medicine_id,
      m.medicine_name
order by revenue desc;

-- top selling medicines by quantity

select
      m.medicine_name,
      sum(sd.quantity) as quantity_sold
from medicines m
join sale_details sd
      on m.medicine_id = sd.medicine_id
group by
      m.medicine_id,
      m.medicine_name
order by quantity_sold desc;

-- lowest selling medicines

select
      m.medicine_name,
      sum(sd.quantity) as quantity_sold
from medicines m
join sale_details sd
      on m.medicine_id = sd.medicine_id
group by
      m.medicine_id,
      m.medicine_name
order by quantity_sold
limit 10;

-- category wise sales revenue

select
      c.category_name,
      round(sum(sd.sub_total), 2) as revenue
from categories c
join medicines m
      on c.category_id = m.category_id
join sale_details sd
      on m.medicine_id = sd.medicine_id
group by
      c.category_id,
      c.category_name
order by revenue desc;

-- category wise quantity sold

select
      c.category_name,
      sum(sd.quantity) as quantity_sold
from categories c
join medicines m
      on c.category_id = m.category_id
join sale_details sd
      on m.medicine_id = sd.medicine_id
group by
      c.category_id,
      c.category_name
order by quantity_sold desc;

-- revenue contribution by medicine

select
      m.medicine_name,
      round(sum(sd.sub_total), 2) as revenue,
      round(
            sum(sd.sub_total) * 100 /
            (select sum(sub_total) from sale_details), 2) as revenue_percentage
from medicines m
join sale_details sd
      on m.medicine_id = sd.medicine_id
group by
      m.medicine_id,
      m.medicine_name
order by revenue desc;

-- top 10 most profitable medicines

select
      m.medicine_name,
      round(sum(sd.sub_total - (m.cost_price * sd.quantity)), 2) as total_profit
from medicines m
join sale_details sd
      on m.medicine_id = sd.medicine_id
group by
      m.medicine_id,
      m.medicine_name
order by total_profit desc
limit 10;

-- profit margin by medicine

select
      m.medicine_name,
      round(
      (
      sum(sd.sub_total - (m.cost_price * sd.quantity))
      /
      sum(sd.sub_total)
      ) * 100, 2
      ) as profit_margin
from medicines m
join sale_details sd
      on m.medicine_id = sd.medicine_id
group by
      m.medicine_id,
      m.medicine_name
order by profit_margin desc;

-- running revenue

select
      sale_date,
      round(sum(total_amount), 2) as daily_revenue,
      round(
      sum(sum(total_amount))
      over(order by sale_date),
      2
      ) as running_revenue
from sales
group by sale_date
order by sale_date;

-- monthly sales ranking

select
      sales_month,
      revenue,
      dense_rank() over(order by revenue desc) as sales_rank
from
(
      select
            date_format(sale_date,'%Y-%m') as sales_month,
            sum(total_amount) as revenue
      from sales
      group by sales_month
) monthly_sales;

-- top 5 medicines in each category

select
      category_name,
      medicine_name,
      revenue,
      medicine_rank
from
(
      select
            c.category_name,
            m.medicine_name,
            sum(sd.sub_total) as revenue,
            dense_rank() over
            (
                  partition by c.category_name
                  order by sum(sd.sub_total) desc
            ) as medicine_rank
      from categories c
      join medicines m
            on c.category_id = m.category_id
      join sale_details sd
            on m.medicine_id = sd.medicine_id
      group by
            c.category_name,
            m.medicine_name
) ranked_medicines
where medicine_rank <= 5
order by
      category_name,
      medicine_rank;