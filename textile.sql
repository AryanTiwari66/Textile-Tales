CREATE DATABASE textile;
use textile;
## Q1

SELECT
     details.product_name,
     SUM(sales.qty) AS Sale_counts
FROM sales AS Sales
INNER JOIN product_details AS details
     on sales.prod_id = details.product_id
GROUP BY details.product_name
ORDER BY Sale_counts DESC;
    
##2
SELECT
    SUM(price*qty) AS nodis_revenue
FROM sales AS Sales;

    
##3
WITH cte_transaction_products AS (
    SELECT 
          txn_id,
          COUNT(DISTINCT prod_id) product_count
    FROM sales
    GROUP BY txn_id
)
SELECT
	ROUND(AVG(product_count)) AS avg_unique_products
FROM cte_transaction_products;    
 	
 ##4
 WITH cte_transaction_discounts AS (
    SELECT
          txn_id,
          SUM(price*qty*discount)/100 AS total_discount
    FROM sales 
    GROUP BY txn_id)
        
SELECT 
	ROUND(AVG(total_discount)) AS avg_unique_product
FROM cte_transaction_discounts;      
    
##5
WITH cte_member_revenue AS (
    SELECT
          member,txn_id,
          SUM(price*qty) AS revenue
    FROM sales
    GROUP BY 
          member,
          txn_id
)
SELECT 
	member,
	ROUND(AVG(revenue),2) AS avg_revenue          
FROM cte_member_revenue
GROUP BY member;
   
##6   
SELECT 
   details.product_name,
   SUM(sales.qty*sales.price) AS nodis_revenue
FROM sales AS sales
INNER JOIN product_details AS details
   ON sales.prod_id = details.product_id
GROUP BY details.product_name
ORDER BY nodis_revenue DESC LIMIT 3;   

##7

SELECT 
	details.segment_id,
	details.segment_name,
	SUM(sales.qty) AS total_quantity,
	SUM(sales.qty * sales.price) AS total_revenue,
	SUM(sales.qty * sales.price * sales.discount)/100 AS total_discount
FROM sales AS sales
INNER JOIN product_details AS details
	ON sales.prod_id = details.product_id
GROUP BY 
	details.segment_id,
	details.segment_name
ORDER BY total_revenue DESC;


##8

SELECT 
	details.segment_id,
	details.segment_name,
	details.product_id,
	details.product_name,
	SUM(sales.qty) AS product_quantity
FROM sales AS sales
INNER JOIN product_details AS details
	ON sales.prod_id = details.product_id
GROUP BY
	details.segment_id,
	details.segment_name,
	details.product_id,
	details.product_name
ORDER BY product_quantity DESC
LIMIT 5;


##9

SELECT 
	details.category_id,
	details.category_name,
	SUM(sales.qty) AS total_quantity,
	SUM(sales.qty * sales.price) AS total_revenue,
	SUM(sales.qty * sales.price * sales.discount)/100 AS total_discount
FROM sales AS sales
INNER JOIN product_details AS details
	ON sales.prod_id = details.product_id
GROUP BY 
	details.category_id,
	details.category_name
ORDER BY total_revenue DESC;


##10

SELECT 
	details.category_name,
	details.product_id,
	details.product_name,
	SUM(sales.qty) AS product_quantity
FROM sales AS sales
INNER JOIN product_details AS details
	ON sales.prod_id = details.product_id
GROUP BY
    details.category_name,
	details.product_id,
	details.product_name
ORDER BY product_quantity DESC
LIMIT 3;

   

   
   
    
    
    
 