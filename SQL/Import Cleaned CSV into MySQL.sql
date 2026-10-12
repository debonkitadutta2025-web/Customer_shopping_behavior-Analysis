SELECT * FROM customer_shopping_analysis.cleaned_customer_shopping;
SELECT COUNT(*) AS total_records
FROM cleaned_customer_shopping;
SELECT *
FROM cleaned_customer_shopping
LIMIT 10;
DESCRIBE cleaned_customer_shopping;
SELECT 
    SUM(purchase_amount_usd) AS total_sales
FROM cleaned_customer_shopping;
SELECT
    MIN(purchase_amount_usd) AS minimum_purchase,
    MAX(purchase_amount_usd) AS maximum_purchase,
    AVG(purchase_amount_usd) AS average_purchase,
    SUM(purchase_amount_usd) AS total_sales
FROM cleaned_customer_shopping;
SELECT
    SUM(customer_id IS NULL) AS missing_customer_id,
    SUM(age IS NULL) AS missing_age,
    SUM(gender IS NULL) AS missing_gender,
    SUM(purchase_amount_usd IS NULL) AS missing_purchase_amount,
    SUM(review_rating IS NULL) AS missing_rating,
    SUM(previous_purchases IS NULL) AS missing_previous_purchases
    FROM cleaned_customer_shopping;
    SELECT
    customer_id,
    COUNT(*) AS record_count
FROM cleaned_customer_shopping
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(purchase_amount_usd) AS total_sales,
    AVG(purchase_amount_usd) AS average_purchase,
    AVG(review_rating) AS average_rating
FROM cleaned_customer_shopping;
