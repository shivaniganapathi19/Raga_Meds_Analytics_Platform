use Raga_Meds_Analytics;

/*==========================================================
                  SUPPLIER ANALYTICS
==========================================================*/

-- total purchase value by supplier

select
      s.supplier_name,
      round(sum(p.total_amount), 2) as purchase_value
from suppliers s
join purchases p
      on s.supplier_id = p.supplier_id
group by
      s.supplier_id,
      s.supplier_name
order by purchase_value desc;

-- total purchase orders by supplier

select
      s.supplier_name,
      count(p.purchase_id) as total_purchase_orders
from suppliers s
join purchases p
      on s.supplier_id = p.supplier_id
group by
      s.supplier_id,
      s.supplier_name
order by total_purchase_orders desc;

-- average purchase value by supplier

select
      s.supplier_name,
      round(avg(p.total_amount), 2) as average_purchase_value
from suppliers s
join purchases p
      on s.supplier_id = p.supplier_id
group by
      s.supplier_id,
      s.supplier_name
order by average_purchase_value desc;

-- top 10 suppliers by purchase value

select
      s.supplier_name,
      round(sum(p.total_amount), 2) as purchase_value
from suppliers s
join purchases p
      on s.supplier_id = p.supplier_id
group by
      s.supplier_id,
      s.supplier_name
order by purchase_value desc
limit 10;

-- supplier contribution percentage

select
      s.supplier_name,
      round(sum(p.total_amount), 2) as purchase_value,
      round(
            sum(p.total_amount) * 100 /
            (select sum(total_amount) from purchases), 2) as contribution_percentage
from suppliers s
join purchases p
      on s.supplier_id = p.supplier_id
group by
      s.supplier_id,
      s.supplier_name
order by purchase_value desc;

-- supplier ranking based on purchase value

select
      s.supplier_name,
      round(sum(p.total_amount), 2) as purchase_value,
      dense_rank() over(order by sum(p.total_amount) desc) as supplier_rank
from suppliers s
join purchases p
      on s.supplier_id = p.supplier_id
group by
      s.supplier_id,
      s.supplier_name;

-- supplier-wise medicine count

select
      s.supplier_name,
      count(distinct pd.medicine_id) as medicines_supplied
from suppliers s
join purchases p
      on s.supplier_id = p.supplier_id
join purchase_details pd
      on p.purchase_id = pd.purchase_id
group by
      s.supplier_id,
      s.supplier_name
order by medicines_supplied desc;

-- average medicines per purchase

select
      s.supplier_name,
      round(avg(purchase_summary.medicine_count), 2) as average_medicines_per_purchase
from suppliers s
join purchases p
      on s.supplier_id = p.supplier_id
join
(
      select
            purchase_id,
            count(distinct medicine_id) as medicine_count
      from purchase_details
      group by purchase_id
) purchase_summary
      on p.purchase_id = purchase_summary.purchase_id
group by
      s.supplier_id,
      s.supplier_name
order by average_medicines_per_purchase desc;

-- highest single purchase from each supplier

select
      s.supplier_name,
      round(max(p.total_amount), 2) as highest_purchase
from suppliers s
join purchases p
      on s.supplier_id = p.supplier_id
group by
      s.supplier_id,
      s.supplier_name
order by highest_purchase desc;