select * from customer
select * from product 
select * from sales 
/* Marketing  customers who are above 36, from 36 to 45, above 45  */
select region, 
case 
when age >= 36 then 'Category 1'
when age >= 54 then 'Category 3'
else 'Category 2' end as age_group, count(*)
from customer 
group by region , age_group
order by region, count desc

/*supply chain department*/
/*a top 5 selling product*/
select c.product_id, p.product_name, c.sold_products from
(select e.product_id ,sum(e.quantity) as sold_products from (select  a.*, b.region
from sales as a
left join customer as b 
on a.customer_id=b.customer_id) as e 
where e.region='East'
group by e.product_id) as c
left join product p 
on p.product_id=c.product_id
order by c.sold_products desc 
limit 5
/* b) 5 least selling product in south region */
select c.product_id, p.product_name, c.sold_products from
(select e.product_id ,sum(e.quantity) as sold_products from (select  a.*, b.region
from sales as a
left join customer as b 
on a.customer_id=b.customer_id) as e 
where e.region='South'
group by e.product_id) as c
left join product p 
on p.product_id=c.product_id
order by c.sold_products asc 
limit 5
 
 /* Finance*/
 /* a) Total loss due to discount */
 select sum(sales*discount) as total_discount_loss from sales  
 
 /* b) Total revenue and discount for each product */ 
 select product_id, sum(discount*sales) as discount_amount, (sum(sales)-sum(sales*discount)) as revenue_after_loss
 from sales
 group by product_id 
 order by revenue_after_loss
 



left join product p 
on p.product_id=c.product_id
order by c.sold_products asc 
limit 5

/* Finance */ 
/* a) total loss after discount */ 

/* b) total revenue and discount for each product */
