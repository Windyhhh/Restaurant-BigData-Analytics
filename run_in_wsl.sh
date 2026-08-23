#!/bin/bash

# ========================================
# WSL环境下运行餐厅经营分析系统
# ========================================

set -e

echo "=========================================="
echo "餐厅经营分析系统 - WSL演示"
echo "=========================================="
echo ""

# 检查环境
echo "【步骤1】检查环境..."
echo "当前目录: $(pwd)"
echo "用户: $(whoami)"
echo "系统: $(uname -a)"
echo ""

# 检查必要的工具
echo "【步骤2】检查必要工具..."
echo "Java版本:"
java -version 2>&1 | head -3
echo ""

echo "Hadoop版本:"
hadoop version 2>&1 | head -3
echo ""

# 检查数据文件
echo "【步骤3】检查数据文件..."
echo "订单日志文件:"
ls -lh data/order_log_*.txt
echo ""

echo "用户信息文件:"
ls -lh data/user_profiles.csv
echo ""

echo "菜品信息文件:"
ls -lh data/dishes.csv
echo ""

# 显示原始数据样本
echo "【步骤4】显示原始数据样本..."
echo ""
echo "=== 订单日志样本 (前5行) ==="
head -5 data/order_log_20231201.txt
echo ""

echo "=== 用户信息样本 (前3行) ==="
head -3 data/user_profiles.csv
echo ""

echo "=== 菜品信息样本 (前3行) ==="
head -3 data/dishes.csv
echo ""

# 查看MapReduce代码
echo "【步骤5】MapReduce数据清洗代码..."
echo ""
echo "=== OrderDataCleaner.java (前30行) ==="
head -30 mapreduce/src/main/java/com/restaurant/OrderDataCleaner.java
echo ""

# 查看Hive分析SQL
echo "【步骤6】Hive数据分析SQL..."
echo ""
echo "=== hive_analysis.sql (前30行) ==="
head -30 scripts/hive_analysis.sql
echo ""

# 编译MapReduce程序
echo "【步骤7】编译MapReduce程序..."
cd mapreduce
mvn clean package -q 2>&1 | tail -10
if [ -f "target/order-data-cleaner-1.0-SNAPSHOT.jar" ]; then
    echo "✓ MapReduce程序编译成功"
    ls -lh target/order-data-cleaner-1.0-SNAPSHOT.jar
else
    echo "✗ MapReduce程序编译失败"
    exit 1
fi
cd ..
echo ""

# 显示项目结构
echo "【步骤8】项目结构..."
echo ""
echo "=== 项目文件树 ==="
tree -L 2 -I 'target|metastore_db|backup' 2>/dev/null || find . -maxdepth 2 -type f -name "*.sh" -o -name "*.sql" -o -name "*.java" | head -20
echo ""

# 显示脚本文件
echo "【步骤9】可用的演示脚本..."
echo ""
ls -lh scripts/*.sh | awk '{print $9, "(" $5 ")"}'
echo ""

# 显示文档文件
echo "【步骤10】可用的文档..."
echo ""
ls -lh *.md | awk '{print $9, "(" $5 ")"}'
echo ""

echo "=========================================="
echo "✓ 环境检查完成！"
echo "=========================================="
echo ""
echo "接下来可以运行："
echo "  1. 启动服务: cd scripts && ./start_all_services.sh"
echo "  2. 上传数据: cd scripts && ./hdfs_setup.sh"
echo "  3. 清洗数据: cd scripts && ./run_mapreduce.sh"
echo "  4. 分析数据: cd scripts && hive -f hive_analysis.sql"
echo ""
echo "或使用演示菜单:"
echo "  cd scripts && ./demo_menu.sh"
echo ""

