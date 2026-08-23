-- ========================================
-- Hive数据分析脚本（简化版）
-- 功能：实现关键业务分析查询
-- ========================================

USE restaurant_db;

-- ========================================
-- 分析1: 销量排行榜 - 统计销量最高的前10名菜品
-- ========================================
SELECT 
    d.dish_id,
    d.dish_name,
    d.category,
    d.price,
    COUNT(*) AS sales_count,
    SUM(o.amount) AS total_revenue
FROM orders_cleaned o
JOIN dishes d ON o.dish_id = d.dish_id
GROUP BY d.dish_id, d.dish_name, d.category, d.price
ORDER BY sales_count DESC
LIMIT 10;

-- ========================================
-- 分析2: VIP客户发现 - 找出消费总金额最高的前10名顾客
-- ========================================
SELECT 
    o.user_id,
    u.age_group,
    u.gender,
    u.preference_taste,
    u.member_level,
    COUNT(DISTINCT o.order_id) AS order_count,
    SUM(o.amount) AS total_spending,
    AVG(o.amount) AS avg_order_amount
FROM orders_cleaned o
LEFT JOIN user_profiles u ON o.user_id = u.user_id
GROUP BY o.user_id, u.age_group, u.gender, u.preference_taste, u.member_level
ORDER BY total_spending DESC
LIMIT 10;

-- ========================================
-- 分析3: 各门店营业额对比
-- ========================================
SELECT 
    o.store_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(o.dish_id) AS total_dishes_sold,
    SUM(o.amount) AS total_revenue,
    AVG(o.amount) AS avg_order_value,
    COUNT(DISTINCT o.user_id) AS unique_customers
FROM orders_cleaned o
GROUP BY o.store_id
ORDER BY total_revenue DESC;

-- ========================================
-- 分析4: 每日销售趋势
-- ========================================
SELECT 
    SUBSTR(order_time, 1, 10) AS order_date,
    COUNT(DISTINCT order_id) AS daily_orders,
    COUNT(dish_id) AS daily_dishes,
    SUM(amount) AS daily_revenue,
    AVG(amount) AS avg_order_amount
FROM orders_cleaned
GROUP BY SUBSTR(order_time, 1, 10)
ORDER BY order_date;

