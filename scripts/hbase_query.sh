#!/bin/bash

# ========================================
# HBase查询脚本
# 功能：演示各种HBase查询操作
# ========================================

# 设置环境变量
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HBASE_HOME=/opt/bigdata/hbase-2.4.13
export PATH=${JAVA_HOME}/bin:${HBASE_HOME}/bin:$PATH

echo "========================================"
echo "HBase查询示例"
echo "========================================"

hbase shell << EOF

# 1. 查询特定用户的所有订单（范围扫描）
echo ""
echo "=== 查询用户U001的所有订单 ==="
scan 'customer_orders', {STARTROW => 'U001_', STOPROW => 'U001_~'}

# 2. 查询特定订单（精确查询）
echo ""
echo "=== 查询特定订单 ==="
get 'customer_orders', 'U001_20231201081523'

# 3. 查询用户在特定时间段的订单
echo ""
echo "=== 查询用户U001在2023-12-01的订单 ==="
scan 'customer_orders', {STARTROW => 'U001_20231201', STOPROW => 'U001_20231202'}

# 4. 只查询订单信息列族
echo ""
echo "=== 只查询订单基本信息 ==="
scan 'customer_orders', {STARTROW => 'U001_', STOPROW => 'U001_~', COLUMNS => ['order_info']}

# 5. 统计表中的记录数
echo ""
echo "=== 统计总记录数 ==="
count 'customer_orders'

# 6. 查看表的前10条记录
echo ""
echo "=== 查看前10条记录 ==="
scan 'customer_orders', {LIMIT => 10}

EOF

echo ""
echo "========================================"
echo "查询完成！"
echo "========================================"
echo ""
echo "常用查询说明："
echo "1. 查询特定用户: scan 'customer_orders', {STARTROW => 'U001_', STOPROW => 'U001_~'}"
echo "2. 查询特定订单: get 'customer_orders', 'U001_20231201081523'"
echo "3. 时间范围查询: scan 'customer_orders', {STARTROW => 'U001_20231201', STOPROW => 'U001_20231202'}"
echo "========================================"

