#!/bin/bash

# ========================================
# HBase表创建脚本
# 功能：创建HBase表用于存储顾客订单行为数据
# ========================================

# 设置环境变量
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HBASE_HOME=/opt/bigdata/hbase-2.4.13
export PATH=${JAVA_HOME}/bin:${HBASE_HOME}/bin:$PATH

echo "========================================"
echo "开始创建HBase表"
echo "========================================"

# 使用HBase Shell创建表
hbase shell << EOF

# 1. 删除已存在的表（如果存在）
disable 'customer_orders'
drop 'customer_orders'

# 2. 创建customer_orders表
# RowKey设计: userId_timestamp (例如: U001_20231201081523)
# 设计原理:
#   - 使用userId作为前缀，支持按用户查询
#   - 使用timestamp作为后缀，支持时间范围查询
#   - 避免热点：不同用户的数据分散在不同Region
#   - 支持范围扫描：可以查询某用户在特定时间段的订单
# 
# 列族设计:
#   - order_info: 存储订单基本信息（订单ID、门店ID、订单时间、金额）
#   - dish_info: 存储菜品信息（菜品列表）
#   - user_info: 存储用户信息（年龄段、偏好等）

create 'customer_orders', 
  {NAME => 'order_info', VERSIONS => 1, TTL => 2592000, COMPRESSION => 'SNAPPY'},
  {NAME => 'dish_info', VERSIONS => 1, TTL => 2592000, COMPRESSION => 'SNAPPY'},
  {NAME => 'user_info', VERSIONS => 1, TTL => 2592000, COMPRESSION => 'SNAPPY'}

# 3. 查看表结构
describe 'customer_orders'

# 4. 列出所有表
list

EOF

echo ""
echo "========================================"
echo "HBase表创建完成！"
echo "========================================"
echo ""
echo "表设计说明："
echo "表名: customer_orders"
echo "RowKey: userId_timestamp (例如: U001_20231201081523)"
echo "列族:"
echo "  - order_info: 订单基本信息"
echo "  - dish_info: 菜品信息"
echo "  - user_info: 用户信息"
echo "TTL: 2592000秒 (30天)"
echo "========================================"

