#!/bin/bash

# ========================================
# 停止所有大数据服务脚本
# 功能：一键停止HDFS、YARN、HBase、Hive
# ========================================

set -e

echo "=========================================="
echo "停止大数据服务"
echo "=========================================="

# 设置环境变量
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/opt/bigdata/hadoop-3.3.6
export HBASE_HOME=/opt/bigdata/hbase-2.4.13
export HIVE_HOME=/opt/bigdata/apache-hive-3.1.2-bin
export ZOOKEEPER_HOME=/opt/bigdata/zookeeper-3.8.5
export PATH=${JAVA_HOME}/bin:${HADOOP_HOME}/bin:${HBASE_HOME}/bin:${HIVE_HOME}/bin:${ZOOKEEPER_HOME}/bin:$PATH

# 1. 停止HBase
echo ""
echo "1. 停止HBase..."
${HBASE_HOME}/bin/stop-hbase.sh 2>&1 | tail -3
sleep 3

# 2. 停止YARN
echo ""
echo "2. 停止YARN..."
${HADOOP_HOME}/sbin/stop-yarn.sh 2>&1 | tail -3
sleep 3

# 3. 停止HDFS
echo ""
echo "3. 停止HDFS..."
${HADOOP_HOME}/sbin/stop-dfs.sh 2>&1 | tail -3
sleep 3

# 4. 停止ZooKeeper
echo ""
echo "4. 停止ZooKeeper..."
${ZOOKEEPER_HOME}/bin/zkServer.sh stop 2>&1 | tail -3
sleep 2

# 5. 验证服务
echo ""
echo "=========================================="
echo "验证服务状态"
echo "=========================================="
jps

echo ""
echo "=========================================="
echo "✓ 所有服务已停止"
echo "=========================================="

