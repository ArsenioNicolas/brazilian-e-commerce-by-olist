-- Query 1: Overall KPIs
SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price)::numeric, 2) AS total_revenue,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    ROUND(AVG(oi.price)::numeric, 2) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered';

-- Query 2: Revenue by State
SELECT c.customer_state, 
       ROUND(SUM(oi.price)::numeric, 2) AS revenue
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY revenue DESC
LIMIT 10;

-- Query 3: Revenue by Product Category
SELECT pcn.product_category_name_english, 
       ROUND(SUM(oi.price)::numeric, 2) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
JOIN product_category pcn ON pcn.product_category_name = p.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY pcn.product_category_name_english
ORDER BY revenue DESC
LIMIT 10;

-- Query 4: Monthly Revenue Trend
SELECT DATE_TRUNC('month', order_purchase_timestamp::timestamp) AS months,
       ROUND(SUM(oi.price)::numeric, 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY months
ORDER BY months;

-- Query 5: Revenue by Payment Method
SELECT payment_type, 
       COUNT(o.order_id) AS total_orders,
       ROUND(SUM(op.payment_value)::numeric, 2) AS revenue
FROM orders o
JOIN order_payments op ON o.order_id = op.order_id
WHERE o.order_status = 'delivered'
GROUP BY payment_type
ORDER BY revenue DESC;

-- Query 6: Best Rated Categories
SELECT pcn.product_category_name_english, 
       ROUND(AVG(ors.review_score)::numeric, 2) AS avg_review_score,
       COUNT(ors.review_id) AS review_count
FROM orders o
JOIN order_reviews ors ON o.order_id = ors.order_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
JOIN product_category pcn ON pcn.product_category_name = p.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY pcn.product_category_name_english
ORDER BY avg_review_score DESC
LIMIT 10;

-- Query 7: Worst Rated Categories
SELECT pcn.product_category_name_english, 
       ROUND(AVG(ors.review_score)::numeric, 2) AS avg_review_score,
       COUNT(ors.review_id) AS review_count
FROM orders o
JOIN order_reviews ors ON o.order_id = ors.order_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
JOIN product_category pcn ON pcn.product_category_name = p.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY pcn.product_category_name_english
ORDER BY avg_review_score ASC
LIMIT 10;

-- Query 8: Top 10 Sellers by Revenue
SELECT s.seller_id, 
       s.seller_city,
       s.seller_state,
       ROUND(SUM(oi.price)::numeric, 2) AS revenue,
       COUNT(o.order_id) AS total_orders
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN sellers s ON s.seller_id = oi.seller_id
WHERE o.order_status = 'delivered'
GROUP BY s.seller_id, s.seller_city, s.seller_state
ORDER BY revenue DESC
LIMIT 10;