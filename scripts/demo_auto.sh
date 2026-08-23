#!/bin/bash

# ========================================
# 餐厅经营分析系统 - 自动化演示脚本
# 功能：一键运行完整的数据处理流程
# ========================================

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# 日志函数
log_step() {
    echo ""
    echo -e "${BLUE}========================================${NC}"
    echo -e "${CYAN}【步骤 $1】$2${NC}"
    echo -e "${BLUE}========================================${NC}"
}

log_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

log_error() {
    echo -e "${RED}✗ $1${NC}"
}

# 主程序
main() {
    echo -e "${BLUE}"
    echo "╔════════════════════════════════════════╗"
    echo "║  餐厅经营分析系统 - 完整演示流程      ║"
    echo "║  Restaurant Analysis System Demo       ║"
    echo "╚════════════════════════════════════════╝"
    echo -e "${NC}"
    
    # 步骤1: 启动服务
    log_step "1/7" "启动所有大数据服务"
    echo "启动: ZooKeeper, HDFS, YARN, HBase..."
    ./start_all_services.sh
    log_success "所有服务已启动"
    
    # 步骤2: 上传数据
    log_step "2/7" "上传原始数据到HDFS"
    echo "上传: 订单日志、用户信息、菜品数据..."
    ./hdfs_setup.sh
    log_success "数据上传完成"
    
    # 步骤3: 数据清洗
    log_step "3/7" "运行MapReduce数据清洗"
    echo "清洗: 过滤无效记录、解析字段、转换格式..."
    ./run_mapreduce.sh
    log_success "数据清洗完成"
    
    # 步骤4: 创建HBase表
    log_step "4/7" "创建HBase表"
    echo "创建: customer_orders表，定义列族..."
    ./hbase_setup.sh
    log_success "HBase表创建完成"
    
    # 步骤5: 导入HBase
    log_step "5/7" "导入数据到HBase"
    echo "导入: 将清洗后的数据导入HBase..."
    ./hbase_import.sh
    log_success "HBase数据导入完成"
    
    # 步骤6: Hive分析
    log_step "6/7" "创建Hive表并执行分析"
    echo "分析: 销量排行、VIP客户、菜品关联、门店对比、销售趋势..."
    hive -f hive_setup.sql
    hive -f hive_analysis.sql > hive_analysis_results.txt
    log_success "Hive分析完成，结果已保存"
    
    # 步骤7: 完成
    log_step "7/7" "演示完成"
    echo -e "${GREEN}"
    echo "╔════════════════════════════════════════╗"
    echo "║  ✓ 完整演示流程已成功执行！           ║"
    echo "╚════════════════════════════════════════╝"
    echo -e "${NC}"
    
    echo ""
    echo "📊 分析结果位置:"
    echo "  - Hive分析结果: hive_analysis_results.txt"
    echo ""
    echo "🌐 Web UI访问地址:"
    echo "  - HDFS NameNode: http://localhost:9870"
    echo "  - YARN ResourceManager: http://localhost:8088"
    echo "  - HBase Master: http://localhost:16010"
    echo ""
}

# 错误处理
trap 'log_error "演示过程中出现错误，请检查日志"; exit 1' ERR

# 启动
main

