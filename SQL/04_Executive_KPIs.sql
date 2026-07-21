use Raga_Meds_Analytics;

/*==========================================================
                    EXECUTIVE KPIs
==========================================================*/

-- total revenue

select round(sum(total_amount), 2) as total_revenue
from sales;

-- total profit

select round(sum(sd.sub_total - (m.cost_price * sd.quantity)), 2) as total_profit
from sale_details sd
join medicines m
on sd.medicine_id = m.medicine_id;

-- gross profit margin

select round(
(sum(sd.sub_total - (m.cost_price * sd.quantity))
/
sum(sd.sub_total)) * 100, 2) as gross_profit_margin
from sale_details sd
join medicines m
on sd.medicine_id = m.medicine_id;

-- total orders

select count(*) as total_orders
from sales;

-- average order value

select round(avg(total_amount), 2) as average_order_value
from sales;

-- current inventory quantity

select sum(stock_quantity) as current_inventory
from inventory;

-- inventory value

select round(sum(i.stock_quantity * m.cost_price), 2) as inventory_value
from inventory i
join medicines m
on i.medicine_id = m.medicine_id;

-- medicines below reorder level

select count(*) as medicines_to_reorder
from inventory
where stock_quantity <= reorder_level;