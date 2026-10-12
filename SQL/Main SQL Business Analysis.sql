USE customer_shopping_analysis;
SELECT COUNT(*) AS total_transactions
FROM cleaned_customer_shopping;
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM cleaned_customer_shopping;
SELECT
    SUM(purchase_amount_usd) AS total_sales
FROM cleaned_customer_shopping;
SELECT
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping;
SELECT
    MIN(purchase_amount_usd) AS minimum_purchase,
    MAX(purchase_amount_usd) AS maximum_purchase
FROM cleaned_customer_shopping;
SELECT
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase,
    ROUND(AVG(review_rating), 2) AS average_rating
FROM cleaned_customer_shopping;
SELECT
    gender,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY gender
ORDER BY total_sales DESC;
SELECT
    category,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY category
ORDER BY total_sales DESC;
SELECT
    category,
    ROUND(AVG(review_rating), 2) AS average_rating
FROM cleaned_customer_shopping
GROUP BY category
ORDER BY average_rating DESC;
SELECT
    item_purchased,
    COUNT(*) AS purchase_count,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY item_purchased
ORDER BY total_sales DESC;
SELECT
    item_purchased,
    COUNT(*) AS purchase_count,
    SUM(purchase_amount_usd) AS total_sales
FROM cleaned_customer_shopping
GROUP BY item_purchased
ORDER BY total_sales DESC
LIMIT 10;
SELECT
    location,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY location
ORDER BY total_sales DESC;
SELECT
    location,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales
FROM cleaned_customer_shopping
GROUP BY location
ORDER BY total_sales DESC
LIMIT 10;
SELECT
    season,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY season
ORDER BY total_sales DESC;
SELECT
    subscription_status,
    COUNT(*) AS total_purchases,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase,
    ROUND(AVG(review_rating), 2) AS average_rating
FROM cleaned_customer_shopping
GROUP BY subscription_status;
SELECT
    discount_applied,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY discount_applied;
SELECT
    promo_code_used,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY promo_code_used;
SELECT
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY payment_method
ORDER BY total_transactions DESC;
SELECT
    shipping_type,
    COUNT(*) AS total_orders,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY shipping_type
ORDER BY total_orders DESC;
SELECT
    age_group,
    COUNT(*) AS total_purchases,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY age_group
ORDER BY total_sales DESC;
SELECT
    customer_type,
    COUNT(*) AS total_purchases,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY customer_type;
SELECT
    high_value_purchase,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY high_value_purchase;
SELECT
    customer_id,
    age,
    gender,
    item_purchased,
    category,
    purchase_amount_usd,
    location,
    season
FROM cleaned_customer_shopping
WHERE purchase_amount_usd >= 80
ORDER BY purchase_amount_usd DESC;
SELECT
    frequency_of_purchases,
    COUNT(*) AS total_purchases,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY frequency_of_purchases
ORDER BY total_sales DESC;
SELECT
    review_rating,
    COUNT(*) AS number_of_reviews
FROM cleaned_customer_shopping
GROUP BY review_rating
ORDER BY review_rating;
SELECT
    category,
    gender,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY category, gender
ORDER BY category, total_sales DESC;
SELECT
    category,
    subscription_status,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase
FROM cleaned_customer_shopping
GROUP BY category, subscription_status
ORDER BY total_sales DESC;
SELECT
    season,
    category,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount_usd) AS total_sales
FROM cleaned_customer_shopping
GROUP BY season, category
ORDER BY season, total_sales DESC;
SELECT
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(purchase_amount_usd), 2) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase,
    ROUND(AVG(review_rating), 2) AS average_rating,
    ROUND(AVG(age), 2) AS average_customer_age,
    SUM(previous_purchases) AS total_previous_purchases
FROM cleaned_customer_shopping;