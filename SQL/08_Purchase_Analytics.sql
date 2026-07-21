use Raga_Meds_Analytics;

/*==========================================================
                    PURCHASE ANALYTICS
==========================================================*/

-- monthly purchase trend

select
      date_format(p.purchase_date,'%Y-%m') as purchase_month,
      count(p.purchase_id) as total_purchases,
      round(sum(p.total_amount), 2) as total_purchase_cost
from purchases p
group by purchase_month
order by purchase_month;

-- monthly purchase growth

select
      purchase_month,
      total_purchase_cost,
      round(
      (
      total_purchase_cost -
      lag(total_purchase_cost) over(order by purchase_month)
      )
      /
      lag(total_purchase_cost) over(order by purchase_month)
      * 100, 2
      ) as growth_percentage
from
(
      select
            date_format(purchase_date,'%Y-%m') as purchase_month,
            sum(total_amount) as total_purchase_cost
      from purchases
      group by purchase_month
) monthly_purchase;

-- average purchase value

select
      round(avg(total_amount), 2) as average_purchase_value
from purchases;

-- most purchased medicines

select
      m.medicine_name,
      sum(pd.quantity) as quantity_purchased
from medicines m
join purchase_details pd
      on m.medicine_id = pd.medicine_id
group by
      m.medicine_id,
      m.medicine_name
order by quantity_purchased desc;

-- purchase cost by medicine

select
      m.medicine_name,
      round(sum(pd.subtotal), 2) as purchase_cost
from medicines m
join purchase_details pd
      on m.medicine_id = pd.medicine_id
group by
      m.medicine_id,
      m.medicine_name
order by purchase_cost desc;

-- category wise purchase cost

select
      c.category_name,
      round(sum(pd.subtotal), 2) as purchase_cost
from categories c
join medicines m
      on c.category_id = m.category_id
join purchase_details pd
      on m.medicine_id = pd.medicine_id
group by
      c.category_id,
      c.category_name
order by purchase_cost desc;

-- running purchase cost

select
      purchase_date,
      round(sum(total_amount), 2) as daily_purchase_cost,
      round(
      sum(sum(total_amount))
      over(order by purchase_date),
      2
      ) as running_purchase_cost
from purchases
group by purchase_date
order by purchase_date;

-- top 5 purchased medicines in each category

select
      category_name,
      medicine_name,
      purchase_cost,
      medicine_rank
from
(
      select
            c.category_name,
            m.medicine_name,
            round(sum(pd.subtotal), 2) as purchase_cost,
            dense_rank() over
            (
                  partition by c.category_name
                  order by sum(pd.subtotal) desc
            ) as medicine_rank
      from categories c
      join medicines m
            on c.category_id = m.category_id
      join purchase_details pd
            on m.medicine_id = pd.medicine_id
      group by
            c.category_name,
            m.medicine_name
) ranked_medicines
where medicine_rank <= 5
order by
      category_name,
      medicine_rank;