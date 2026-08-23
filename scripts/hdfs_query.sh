#!/bin/bash

# ========================================
# HDFS查询脚本
# 功能：查看HDFS上的数据
# ========================================

# 设置环境变量
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/opt/bigdata/hadoop-3.3.6
export PATH=${JAVA_HOME}/bin:${HADOOP_HOME}/bin:$PATH

echo "========================================"
echo "HDFS数据查询"
echo "========================================"

HDFS_BASE="/restaurant"

# 显示整体目录结构
echo ""
echo "=== HDFS目录结构 ==="
hdfs dfs -ls -R ${HDFS_BASE}

# 查看订单日志样例数据
echo ""
echo "=== 订单日志样例数据（前10行）==="
hdfs dfs -cat ${HDFS_BASE}/raw_data/order_logs/order_log_20231201.txt | head -10

# 查看用户信息样例数据
echo ""
echo "=== 用户信息样例数据（前10行）==="
hdfs dfs -cat ${HDFS_BASE}/raw_data/user_profiles/user_profiles.csv | head -10

# 查看菜品信息样例数据
echo ""
echo "=== 菜品信息样例数据 ==="
hdfs dfs -cat ${HDFS_BASE}/raw_data/dishes/dishes.csv

# 统计文件大小
echo ""
echo "=== 文件大小统计 ==="
hdfs dfs -du -h ${HDFS_BASE}/raw_data

echo ""
echo "========================================"
echo "查询完成！"
echo "========================================"

