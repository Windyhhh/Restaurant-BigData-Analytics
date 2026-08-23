#!/bin/bash

# ========================================
# Hive执行脚本
# 功能：执行Hive SQL脚本
# ========================================

# 设置环境变量
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/opt/bigdata/hadoop-3.3.6
export HIVE_HOME=/opt/bigdata/apache-hive-3.1.2-bin
export PATH=${JAVA_HOME}/bin:${HADOOP_HOME}/bin:${HIVE_HOME}/bin:$PATH

echo "========================================"
echo "Hive数据仓库操作"
echo "========================================"

# 1. 创建表并加载数据
echo ""
echo "步骤1: 创建Hive表并加载数据..."
hive -f hive_setup.sql

if [ $? -ne 0 ]; then
    echo "Hive表创建失败！"
    exit 1
fi

echo "Hive表创建成功！"

# 2. 执行数据分析
echo ""
echo "步骤2: 执行数据分析查询..."
hive -f hive_analysis.sql > hive_analysis_results.txt

if [ $? -ne 0 ]; then
    echo "Hive分析执行失败！"
    exit 1
fi

echo "Hive分析执行成功！"
echo "结果已保存到: hive_analysis_results.txt"

# 3. 显示部分结果
echo ""
echo "步骤3: 显示分析结果摘要..."
head -50 hive_analysis_results.txt

echo ""
echo "========================================"
echo "Hive操作完成！"
echo "========================================"

