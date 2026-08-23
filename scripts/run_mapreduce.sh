#!/bin/bash

# ========================================
# MapReduce任务执行脚本
# 功能：运行数据清洗MapReduce程序
# ========================================

# 设置环境变量
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/opt/bigdata/hadoop-3.3.6
export PATH=${JAVA_HOME}/bin:${HADOOP_HOME}/bin:/mnt/c/ProgramData/chocolatey/lib/maven/apache-maven-3.9.11/bin:$PATH

echo "========================================"
echo "开始执行MapReduce数据清洗任务"
echo "========================================"

HDFS_BASE="/restaurant"
INPUT_PATH="${HDFS_BASE}/raw_data/order_logs"
OUTPUT_PATH="${HDFS_BASE}/cleaned_data/orders"

# 1. 删除已存在的输出目录
echo ""
echo "步骤1: 清理旧的输出目录..."
hdfs dfs -rm -r -f ${OUTPUT_PATH}

# 2. 编译MapReduce程序
echo ""
echo "步骤2: 编译MapReduce程序..."
cd mapreduce
mvn clean package

if [ $? -ne 0 ]; then
    echo "编译失败！"
    exit 1
fi

echo "编译成功！"

# 3. 运行MapReduce任务
echo ""
echo "步骤3: 运行MapReduce任务..."
echo "输入路径: ${INPUT_PATH}"
echo "输出路径: ${OUTPUT_PATH}"

hadoop jar target/order-data-cleaner-1.0-SNAPSHOT.jar \
    com.restaurant.OrderDataCleaner \
    ${INPUT_PATH} \
    ${OUTPUT_PATH}

if [ $? -ne 0 ]; then
    echo "MapReduce任务执行失败！"
    exit 1
fi

# 4. 查看输出结果
echo ""
echo "步骤4: 查看清洗后的数据（前20行）..."
hdfs dfs -cat ${OUTPUT_PATH}/part-* | head -20

# 5. 统计结果
echo ""
echo "步骤5: 统计清洗结果..."
echo "总记录数:"
hdfs dfs -cat ${OUTPUT_PATH}/part-* | wc -l

echo ""
echo "========================================"
echo "MapReduce数据清洗任务完成！"
echo "========================================"

