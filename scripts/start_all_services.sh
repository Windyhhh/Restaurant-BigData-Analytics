#!/bin/bash

# ========================================
# 启动所有大数据服务脚本
# 功能：一键启动HDFS、YARN、HBase、Hive
# ========================================

set -e

echo "=========================================="
echo "启动大数据服务"
echo "=========================================="

# 设置环境变量
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/opt/bigdata/hadoop-3.3.6
export HBASE_HOME=/opt/bigdata/hbase-2.4.13
export HIVE_HOME=/opt/bigdata/apache-hive-3.1.2-bin
export ZOOKEEPER_HOME=/opt/bigdata/zookeeper-3.8.5
export PATH=${JAVA_HOME}/bin:${HADOOP_HOME}/bin:${HBASE_HOME}/bin:${HIVE_HOME}/bin:${ZOOKEEPER_HOME}/bin:$PATH

# 1. 启动ZooKeeper
echo ""
echo "1. 启动ZooKeeper..."
${ZOOKEEPER_HOME}/bin/zkServer.sh start 2>&1 | tail -5
sleep 3

# 2. 启动HDFS
echo ""
echo "2. 启动HDFS..."
${HADOOP_HOME}/sbin/start-dfs.sh 2>&1 | tail -5
sleep 5

# 3. 启动YARN
echo ""
echo "3. 启动YARN..."
${HADOOP_HOME}/sbin/start-yarn.sh 2>&1 | tail -5
sleep 5

# 4. 启动HBase
echo ""
echo "4. 启动HBase..."
${HBASE_HOME}/bin/start-hbase.sh 2>&1 | tail -5
sleep 5

# 5. 验证服务
echo ""
echo "=========================================="
echo "验证服务状态"
echo "=========================================="
jps

echo ""
echo "=========================================="
echo "✓ 所有服务已启动"
echo "=========================================="
echo ""
echo "Web UI访问地址:"
echo "  HDFS NameNode: http://localhost:9870"
echo "  YARN ResourceManager: http://localhost:8088"
echo "  HBase Master: http://localhost:16010"
echo ""

