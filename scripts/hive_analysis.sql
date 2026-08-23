-- ========================================
-- Hive数据分析脚本
-- 功能：实现各种业务分析查询
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
-- 分析2: VIP客户发现 - 找出消费总金额最高的前100名顾客
-- ========================================
SELECT 
    o.user_id,
    u.age_group,
    u.gender,
    u.preference_taste,
    u.member_level,
    COUNT(DISTINCT o.order_id) AS order_count,
    COUNT(o.dish_id) AS dish_count,
    SUM(o.amount) AS total_spending,
    AVG(o.amount) AS avg_order_amount
FROM orders_cleaned o
LEFT JOIN user_profiles u ON o.user_id = u.user_id
GROUP BY o.user_id, u.age_group, u.gender, u.preference_taste, u.member_level
ORDER BY total_spending DESC
LIMIT 100;

-- ========================================
-- 分析3: 菜品关联分析 - 探索常见的菜品组合
-- ========================================

-- 3.1 找出经常一起购买的菜品对
SELECT 
    a.dish_id AS dish_a,
    b.dish_id AS dish_b,
    d1.dish_name AS dish_a_name,
    d2.dish_name AS dish_b_name,
    COUNT(DISTINCT a.order_id) AS co_occurrence_count
FROM orders_cleaned a
JOIN orders_cleaned b ON a.order_id = b.order_id AND a.dish_id < b.dish_id
JOIN dishes d1 ON a.dish_id = d1.dish_id
JOIN dishes d2 ON b.dish_id = d2.dish_id
GROUP BY a.dish_id, b.dish_id, d1.dish_name, d2.dish_name
HAVING co_occurrence_count >= 5
ORDER BY co_occurrence_count DESC
LIMIT 20;

-- 3.2 购买"宫保鸡丁"(D001)的订单中，同时购买"可乐"(D005)的比例
WITH burger_orders AS (
    SELECT DISTINCT order_id
    FROM orders_cleaned
    WHERE dish_id = 'D001'
),
burger_cola_orders AS (
    SELECT DISTINCT a.order_id
    FROM orders_cleaned a
    WHERE a.dish_id = 'D001'
    AND EXISTS (
        SELECT 1 FROM orders_cleaned b
        WHERE b.order_id = a.order_id AND b.dish_id = 'D005'
    )
)
SELECT 
    COUNT(DISTINCT bo.order_id) AS total_burger_orders,
    COUNT(DISTINCT bco.order_id) AS burger_with_cola_orders,
    ROUND(COUNT(DISTINCT bco.order_id) * 100.0 / COUNT(DISTINCT bo.order_id), 2) AS percentage
FROM burger_orders bo
LEFT JOIN burger_cola_orders bco ON bo.order_id = bco.order_id;

-- ========================================
-- 分析4: 自定义分析 - 各门店营业额对比
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
-- 分析5: 自定义分析 - 每日销售趋势
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

-- ========================================
-- 分析6: 自定义分析 - 时段分析（高峰时段）
-- ========================================
SELECT 
    CASE 
        WHEN CAST(SUBSTR(order_time, 12, 2) AS INT) BETWEEN 6 AND 10 THEN '早餐时段(6-10点)'
        WHEN CAST(SUBSTR(order_time, 12, 2) AS INT) BETWEEN 11 AND 14 THEN '午餐时段(11-14点)'
        WHEN CAST(SUBSTR(order_time, 12, 2) AS INT) BETWEEN 17 AND 21 THEN '晚餐时段(17-21点)'
        ELSE '其他时段'
    END AS time_period,
    COUNT(DISTINCT order_id) AS order_count,
    SUM(amount) AS revenue,
    AVG(amount) AS avg_order_value
FROM orders_cleaned
GROUP BY 
    CASE 
        WHEN CAST(SUBSTR(order_time, 12, 2) AS INT) BETWEEN 6 AND 10 THEN '早餐时段(6-10点)'
        WHEN CAST(SUBSTR(order_time, 12, 2) AS INT) BETWEEN 11 AND 14 THEN '午餐时段(11-14点)'
        WHEN CAST(SUBSTR(order_time, 12, 2) AS INT) BETWEEN 17 AND 21 THEN '晚餐时段(17-21点)'
        ELSE '其他时段'
    END
ORDER BY revenue DESC;

-- ========================================
-- 分析7: 自定义分析 - 用户偏好分析
-- ========================================
SELECT 
    u.preference_taste,
    d.category,
    COUNT(*) AS purchase_count,
    SUM(o.amount) AS total_spending
FROM orders_cleaned o
JOIN user_profiles u ON o.user_id = u.user_id
JOIN dishes d ON o.dish_id = d.dish_id
GROUP BY u.preference_taste, d.category
ORDER BY u.preference_taste, purchase_count DESC;

-- ========================================
-- 分析8: 创建VIP客户视图（用于导出到HBase）
-- ========================================
CREATE VIEW IF NOT EXISTS vip_customers AS
SELECT 
    o.user_id,
    u.age_group,
    u.gender,
    u.preference_taste,
    u.member_level,
    COUNT(DISTINCT o.order_id) AS order_count,
    SUM(o.amount) AS total_spending,
    AVG(o.amount) AS avg_order_amount,
    MAX(o.order_time) AS last_order_time
FROM orders_cleaned o
LEFT JOIN user_profiles u ON o.user_id = u.user_id
GROUP BY o.user_id, u.age_group, u.gender, u.preference_taste, u.member_level
HAVING total_spending >= 500
ORDER BY total_spending DESC;

-- 查看VIP客户
SELECT * FROM vip_customers LIMIT 20;

