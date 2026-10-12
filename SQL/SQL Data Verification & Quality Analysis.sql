USE customer_shopping_analysis;
SELECT COUNT(*) AS total_records
FROM cleaned_customer_shopping;
SELECT COUNT(*) AS total_columns
FROM information_schema.columns
WHERE table_schema = 'customer_shopping_analysis'
AND table_name = 'cleaned_customer_shopping';

DESCRIBE cleaned_customer_shopping;

SELECT *
FROM cleaned_customer_shopping
LIMIT 10;
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CONCAT_WS('|',
        customer_id,
        age,
        gender,
        item_purchased,
        category,
        purchase_amount_usd,
        location,
        size,
        color,
        season,
        review_rating,
        subscription_status,
        shipping_type,
        discount_applied,
        promo_code_used,
        previous_purchases,
        payment_method,
        frequency_of_purchases,
        age_group,
        customer_type,
        high_value_purchase
    )) AS unique_rows
FROM cleaned_customer_shopping;
SELECT
    SUM(customer_id IS NULL) AS missing_customer_id,
    SUM(age IS NULL) AS missing_age,
    SUM(gender IS NULL) AS missing_gender,
    SUM(item_purchased IS NULL) AS missing_item,
    SUM(category IS NULL) AS missing_category,
    SUM(purchase_amount_usd IS NULL) AS missing_purchase_amount,
    SUM(location IS NULL) AS missing_location,
    SUM(size IS NULL) AS missing_size,
    SUM(color IS NULL) AS missing_color,
    SUM(season IS NULL) AS missing_season,
    SUM(review_rating IS NULL) AS missing_rating,
    SUM(subscription_status IS NULL) AS missing_subscription,
    SUM(shipping_type IS NULL) AS missing_shipping,
    SUM(discount_applied IS NULL) AS missing_discount,
    SUM(promo_code_used IS NULL) AS missing_promo,
    SUM(previous_purchases IS NULL) AS missing_previous_purchases,
    SUM(payment_method IS NULL) AS missing_payment,
    SUM(frequency_of_purchases IS NULL) AS missing_frequency,
    SUM(age_group IS NULL) AS missing_age_group,
    SUM(customer_type IS NULL) AS missing_customer_type,
    SUM(high_value_purchase IS NULL) AS missing_purchase_classification
FROM cleaned_customer_shopping;
SELECT
    MIN(age) AS minimum_age,
    MAX(age) AS maximum_age,
    AVG(age) AS average_age
FROM cleaned_customer_shopping;
SELECT *
FROM cleaned_customer_shopping
WHERE age < 18
   OR age > 100;
   SELECT
    MIN(purchase_amount_usd) AS minimum_purchase,
    MAX(purchase_amount_usd) AS maximum_purchase,
    AVG(purchase_amount_usd) AS average_purchase,
    SUM(purchase_amount_usd) AS total_sales
FROM cleaned_customer_shopping;
SELECT *
FROM cleaned_customer_shopping
WHERE purchase_amount_usd <= 0;
SELECT
    MIN(review_rating) AS minimum_rating,
    MAX(review_rating) AS maximum_rating,
    AVG(review_rating) AS average_rating
FROM cleaned_customer_shopping;
SELECT *
FROM cleaned_customer_shopping
WHERE review_rating < 0
   OR review_rating > 5;
   SELECT
    MIN(previous_purchases) AS minimum_previous_purchases,
    MAX(previous_purchases) AS maximum_previous_purchases,
    AVG(previous_purchases) AS average_previous_purchases
FROM cleaned_customer_shopping;
SELECT *
FROM cleaned_customer_shopping
WHERE previous_purchases < 0;
SELECT
    gender,
    COUNT(*) AS customer_count
FROM cleaned_customer_shopping
GROUP BY gender
ORDER BY customer_count DESC;
SELECT
    category,
    COUNT(*) AS purchase_count
FROM cleaned_customer_shopping
GROUP BY category
ORDER BY purchase_count DESC;
SELECT
    season,
    COUNT(*) AS purchase_count
FROM cleaned_customer_shopping
GROUP BY season
ORDER BY purchase_count DESC;
SELECT
    subscription_status,
    COUNT(*) AS customer_count
FROM cleaned_customer_shopping
GROUP BY subscription_status;
SELECT
    payment_method,
    COUNT(*) AS transaction_count
FROM cleaned_customer_shopping
GROUP BY payment_method
ORDER BY transaction_count DESC;
SELECT
    frequency_of_purchases,
    COUNT(*) AS customer_count
FROM cleaned_customer_shopping
GROUP BY frequency_of_purchases
ORDER BY customer_count DESC;
SELECT
    age_group,
    COUNT(*) AS customer_count
FROM cleaned_customer_shopping
GROUP BY age_group
ORDER BY age_group;
SELECT
    customer_type,
    COUNT(*) AS customer_count
FROM cleaned_customer_shopping
GROUP BY customer_type;
SELECT
    high_value_purchase,
    COUNT(*) AS purchase_count
FROM cleaned_customer_shopping
GROUP BY high_value_purchase;
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(purchase_amount_usd) AS total_sales,
    ROUND(AVG(purchase_amount_usd), 2) AS average_purchase,
    ROUND(AVG(review_rating), 2) AS average_rating,
    MIN(age) AS minimum_age,
    MAX(age) AS maximum_age
FROM cleaned_customer_shopping;