use Raga_Meds_Analytics;

/*==========================================================
                    INVENTORY ANALYTICS
==========================================================*/

-- current inventory status

select
      m.medicine_name,
      i.stock_quantity,
      i.reorder_level,
      i.warehouse
from inventory i
join medicines m
      on i.medicine_id = m.medicine_id
order by i.stock_quantity desc;

-- medicines below reorder level

select
      m.medicine_name,
      i.stock_quantity,
      i.reorder_level,
      i.warehouse
from inventory i
join medicines m
      on i.medicine_id = m.medicine_id
where i.stock_quantity <= i.reorder_level
order by i.stock_quantity;

-- inventory value by medicine

select
      m.medicine_name,
      i.stock_quantity,
      m.cost_price,
      round(i.stock_quantity * m.cost_price, 2) as inventory_value
from inventory i
join medicines m
      on i.medicine_id = m.medicine_id
order by inventory_value desc;

-- total inventory value

select
      round(sum(i.stock_quantity * m.cost_price), 2) as total_inventory_value
from inventory i
join medicines m
      on i.medicine_id = m.medicine_id;

-- inventory value by warehouse

select
      i.warehouse,
      round(sum(i.stock_quantity * m.cost_price), 2) as inventory_value
from inventory i
join medicines m
      on i.medicine_id = m.medicine_id
group by i.warehouse
order by inventory_value desc;

-- stock availability status

select
      m.medicine_name,
      i.stock_quantity,
      i.reorder_level,
case
when i.stock_quantity = 0 then 'Out of Stock'
when i.stock_quantity <= i.reorder_level then 'Low Stock'
else 'In Stock'
end as stock_status
from inventory i
join medicines m
      on i.medicine_id = m.medicine_id
order by i.stock_quantity;

-- inventory ranking based on value

select
      m.medicine_name,
      round(i.stock_quantity * m.cost_price, 2) as inventory_value,
dense_rank() over(order by i.stock_quantity * m.cost_price desc) as inventory_rank
from inventory i
join medicines m
      on i.medicine_id = m.medicine_id;

-- category wise inventory value

select
      c.category_name,
      round(sum(i.stock_quantity * m.cost_price), 2) as inventory_value
from categories c
join medicines m
      on c.category_id = m.category_id
join inventory i
      on m.medicine_id = i.medicine_id
group by 
	  c.category_id,
      c.category_name
order by inventory_value desc;

-- category wise stock quantity

select
      c.category_name,
      sum(i.stock_quantity) as total_stock
from categories c
join medicines m
      on c.category_id = m.category_id
join inventory i
      on m.medicine_id = i.medicine_id
group by 
      c.category_id,
      c.category_name
order by total_stock desc;

-- inventory turnover indicator

select
      m.medicine_name,
      sum(sd.quantity) as quantity_sold,
      i.stock_quantity,
      round(sum(sd.quantity) / nullif(i.stock_quantity,0), 2) as turnover_ratio
from medicines m
join sale_details sd
      on m.medicine_id = sd.medicine_id
join inventory i
      on m.medicine_id = i.medicine_id
group by m.medicine_id,
         m.medicine_name,
         i.stock_quantity
order by turnover_ratio desc;

-- medicines sorted by expiry date

select
      medicine_name,
      expiry_date
from medicines
order by expiry_date;

-- remaining shelf life of medicines

select
      medicine_name,
      expiry_date,
      datediff(expiry_date,current_date) as shelf_life_days
from medicines
order by shelf_life_days;

-- medicine expiry status

select
      medicine_name,
      expiry_date,
case
when expiry_date < current_date then 'Expired'
when expiry_date <= date_add(current_date, interval 90 day) then 'Expiring Soon'
else 'Safe'
end as expiry_status
from medicines
order by expiry_date;