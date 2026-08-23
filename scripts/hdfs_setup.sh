#!/bin/bash

# ========================================
# HDFS数据上传脚本
# 功能：创建HDFS目录结构并上传原始数据
# ========================================

# 设置环境变量
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/opt/bigdata/hadoop-3.3.6
export PATH=${JAVA_HOME}/bin:${HADOOP_HOME}/bin:$PATH

echo "========================================"
echo "开始HDFS数据上传流程"
echo "========================================"

# HDFS基础路径
HDFS_BASE="/restaurant"

# 1. 创建HDFS目录结构
echo ""
echo "步骤1: 创建HDFS目录结构..."
hdfs dfs -mkdir -p ${HDFS_BASE}/raw_data/order_logs
hdfs dfs -mkdir -p ${HDFS_BASE}/raw_data/user_profiles
hdfs dfs -mkdir -p ${HDFS_BASE}/raw_data/dishes
hdfs dfs -mkdir -p ${HDFS_BASE}/cleaned_data
hdfs dfs -mkdir -p ${HDFS_BASE}/output

echo "目录结构创建完成！"

# 2. 上传订单日志文件
echo ""
echo "步骤2: 上传订单日志文件..."
hdfs dfs -put -f data/order_log_20231201.txt ${HDFS_BASE}/raw_data/order_logs/
hdfs dfs -put -f data/order_log_20231202.txt ${HDFS_BASE}/raw_data/order_logs/
hdfs dfs -put -f data/order_log_20231203.txt ${HDFS_BASE}/raw_data/order_logs/

echo "订单日志上传完成！"

# 3. 上传用户信息文件
echo ""
echo "步骤3: 上传用户信息文件..."
hdfs dfs -put -f data/user_profiles.csv ${HDFS_BASE}/raw_data/user_profiles/

echo "用户信息上传完成！"

# 4. 上传菜品信息文件
echo ""
echo "步骤4: 上传菜品信息文件..."
hdfs dfs -put -f data/dishes.csv ${HDFS_BASE}/raw_data/dishes/

echo "菜品信息上传完成！"

# 5. 验证上传结果
echo ""
echo "步骤5: 验证上传结果..."
echo ""
echo "=== 订单日志目录 ==="
hdfs dfs -ls ${HDFS_BASE}/raw_data/order_logs/

echo ""
echo "=== 用户信息目录 ==="
hdfs dfs -ls ${HDFS_BASE}/raw_data/user_profiles/

echo ""
echo "=== 菜品信息目录 ==="
hdfs dfs -ls ${HDFS_BASE}/raw_data/dishes/

echo ""
echo "========================================"
echo "HDFS数据上传完成！"
echo "========================================"

