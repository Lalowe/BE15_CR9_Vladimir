-- query 1 how many rows has Producer 
SELECT COUNT(*) FROM Producer

-- query 2 which products were produced by a  producer "Nike"
SELECT pr.name ,p.name from Product pr
JOIN Producer p on pr.fk_producer_id = p.producer_id
where p.name = 'Nike';

-- query 3 who has order on 2022-03-07 ,ascending
SELECT order_no ,order_date FROM Order_ID 
WHERE order_date > '2022-03-07'
ORDER BY order_date  ASC

-- query 4 Which customers live on street Volgogradska
SELECT * FROM `Customer`
WHERE street = 'Volgogradska'

-- query 5 which transport company has ZIP in Slovakia ?

SELECT t.transport_company ,t.fk_zip_id ,z.country from Transport t 
JOIN ZIP z on t.fk_zip_id = z.zip_id 
WHERE Country = 'Slovakia';


-- query 6 from which producer ordered customer with name Juraj Janosik 
SELECT c.name, pr.name from Invoice i
JOIN Account a on i.fk_account_id = a.account_id
JOIN Customer c on a.fk_customer_id = c.customer_id
JOIN Order_ID o on i.fk_order_id = o.order_no
JOIN Product_list p on o.fk_product_list_id = p.product_list_id
JOIN Producer pr on p.product_list_id = pr.producer_id
WHERE c.name = 'Juraj Janosik'

-- query 7 names of products cost more than 100 , ascending 

SELECT name , price  FROM Product
WHERE price > 100
ORDER BY price ASC

-- query 8 in which dates were issued invoices/orders for customers from Slovakia
SELECT z.country, o.order_date ,c.name from Invoice i 
JOIN Order_ID o on i.fk_order_id = o.order_no
JOIN Account a on i.fk_account_id = a.account_id
JOIN Customer c on a.fk_customer_id = c.customer_id
JOIN ZIP z on c.fk_zip_id = z.zip_id
WHERE z.country = 'Slovakia'


-- query 9  how many orders do we have in company between 2022.02.27 - 2022.03.02 + price for produkt descending
SELECT  order_no , order_date  , p.price from Order_ID o
JOIN Product_list pl on o.fk_product_list_id = pl.product_list_id
JOIN Product p on pl.fk_product_id = p.product_id
WHERE o.order_date > '2022-02-26' and o.order_date <'2022-03-02'
ORDER BY o.order_date DESC


-- query 10 Which shipment is transported from warehouse department with name CLOTHES
SELECT  s.shipment_id, w.name FROM Transport t
JOIN shipment s on t.fk_shipment_id = s.shipment_id
JOIN Warehouse w on t.fk_warehouse_id = w.warehouse_id
WHERE w.name = 'CLOTHES'

-- query 11 Sum of all product prices
SELECT  
SUM(Product.price) FROM Product


