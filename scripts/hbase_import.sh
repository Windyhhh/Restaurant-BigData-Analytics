#!/bin/bash

# ========================================
# HBase数据导入脚本
# 功能：从清洗后的数据导入到HBase
# ========================================

# 设置环境变量
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HBASE_HOME=/opt/bigdata/hbase-2.4.13
export PATH=${JAVA_HOME}/bin:${HBASE_HOME}/bin:$PATH

echo "========================================"
echo "开始导入数据到HBase"
echo "========================================"

# 使用HBase Shell插入示例数据
hbase shell << EOF

# 插入示例订单数据
# RowKey格式: userId_timestamp

# 用户U001的订单
put 'customer_orders', 'U001_20231201081523', 'order_info:order_id', 'O001'
put 'customer_orders', 'U001_20231201081523', 'order_info:store_id', 'S001'
put 'customer_orders', 'U001_20231201081523', 'order_info:order_time', '2023-12-01 08:15:23'
put 'customer_orders', 'U001_20231201081523', 'order_info:amount', '58.50'
put 'customer_orders', 'U001_20231201081523', 'dish_info:dishes', 'D001,D005'
put 'customer_orders', 'U001_20231201081523', 'user_info:age_group', '25-30'
put 'customer_orders', 'U001_20231201081523', 'user_info:preference', '辣味'

put 'customer_orders', 'U001_20231201094215', 'order_info:order_id', 'O006'
put 'customer_orders', 'U001_20231201094215', 'order_info:store_id', 'S001'
put 'customer_orders', 'U001_20231201094215', 'order_info:order_time', '2023-12-01 09:42:15'
put 'customer_orders', 'U001_20231201094215', 'order_info:amount', '65.00'
put 'customer_orders', 'U001_20231201094215', 'dish_info:dishes', 'D003,D005'
put 'customer_orders', 'U001_20231201094215', 'user_info:age_group', '25-30'
put 'customer_orders', 'U001_20231201094215', 'user_info:preference', '辣味'

# 用户U002的订单
put 'customer_orders', 'U002_20231201082345', 'order_info:order_id', 'O002'
put 'customer_orders', 'U002_20231201082345', 'order_info:store_id', 'S002'
put 'customer_orders', 'U002_20231201082345', 'order_info:order_time', '2023-12-01 08:23:45'
put 'customer_orders', 'U002_20231201082345', 'order_info:amount', '72.00'
put 'customer_orders', 'U002_20231201082345', 'dish_info:dishes', 'D003,D007'
put 'customer_orders', 'U002_20231201082345', 'user_info:age_group', '31-35'
put 'customer_orders', 'U002_20231201082345', 'user_info:preference', '清淡'

put 'customer_orders', 'U002_20231201121537', 'order_info:order_id', 'O012'
put 'customer_orders', 'U002_20231201121537', 'order_info:store_id', 'S002'
put 'customer_orders', 'U002_20231201121537', 'order_info:order_time', '2023-12-01 12:15:37'
put 'customer_orders', 'U002_20231201121537', 'order_info:amount', '55.00'
put 'customer_orders', 'U002_20231201121537', 'dish_info:dishes', 'D001,D006'
put 'customer_orders', 'U002_20231201121537', 'user_info:age_group', '31-35'
put 'customer_orders', 'U002_20231201121537', 'user_info:preference', '清淡'

# 用户U003的订单
put 'customer_orders', 'U003_20231201083512', 'order_info:order_id', 'O003'
put 'customer_orders', 'U003_20231201083512', 'order_info:store_id', 'S001'
put 'customer_orders', 'U003_20231201083512', 'order_info:order_time', '2023-12-01 08:35:12'
put 'customer_orders', 'U003_20231201083512', 'order_info:amount', '95.80'
put 'customer_orders', 'U003_20231201083512', 'dish_info:dishes', 'D002,D004,D006'
put 'customer_orders', 'U003_20231201083512', 'user_info:age_group', '18-24'
put 'customer_orders', 'U003_20231201083512', 'user_info:preference', '甜味'

EOF

echo ""
echo "========================================"
echo "数据导入完成！"
echo "========================================"

