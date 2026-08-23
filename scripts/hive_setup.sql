-- ========================================
-- Hive表创建脚本
-- 功能：创建数据仓库表结构
-- ========================================

-- 创建数据库
CREATE DATABASE IF NOT EXISTS restaurant_db;
USE restaurant_db;

-- ========================================
-- 1. 创建清洗后的订单数据表
-- ========================================
DROP TABLE IF EXISTS orders_cleaned;

CREATE EXTERNAL TABLE orders_cleaned (
    user_id STRING COMMENT '用户ID',
    order_id STRING COMMENT '订单ID',
    store_id STRING COMMENT '门店ID',
    dish_id STRING COMMENT '菜品ID',
    order_time STRING COMMENT '订单时间',
    amount DOUBLE COMMENT '订单金额'
)
COMMENT '清洗后的订单数据表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/restaurant/cleaned_data/orders';

-- ========================================
-- 2. 创建用户信息表
-- ========================================
DROP TABLE IF EXISTS user_profiles;

CREATE EXTERNAL TABLE user_profiles (
    user_id STRING COMMENT '用户ID',
    age_group STRING COMMENT '年龄段',
    gender STRING COMMENT '性别',
    preference_taste STRING COMMENT '偏好口味',
    member_level STRING COMMENT '会员等级',
    registration_date STRING COMMENT '注册日期'
)
COMMENT '用户信息表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/restaurant/raw_data/user_profiles'
TBLPROPERTIES ('skip.header.line.count'='1');

-- ========================================
-- 3. 创建菜品信息表
-- ========================================
DROP TABLE IF EXISTS dishes;

CREATE EXTERNAL TABLE dishes (
    dish_id STRING COMMENT '菜品ID',
    dish_name STRING COMMENT '菜品名称',
    category STRING COMMENT '菜品类别',
    price DOUBLE COMMENT '菜品价格',
    taste_type STRING COMMENT '口味类型',
    is_recommended INT COMMENT '是否推荐菜品'
)
COMMENT '菜品信息表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/restaurant/raw_data/dishes'
TBLPROPERTIES ('skip.header.line.count'='1');

-- ========================================
-- 验证表创建和数据加载
-- ========================================

-- 显示所有表
SHOW TABLES;

-- 查看表结构
DESCRIBE orders_cleaned;
DESCRIBE user_profiles;
DESCRIBE dishes;

-- 查看数据样例
SELECT * FROM orders_cleaned LIMIT 10;
SELECT * FROM user_profiles LIMIT 10;
SELECT * FROM dishes LIMIT 10;

-- 统计记录数
SELECT COUNT(*) AS order_count FROM orders_cleaned;
SELECT COUNT(*) AS user_count FROM user_profiles;
SELECT COUNT(*) AS dish_count FROM dishes;

