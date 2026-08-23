#!/bin/bash

# ========================================
# 餐厅经营分析系统 - 交互式演示菜单
# 功能：提供菜单选择，用户可选择运行各个功能模块
# ========================================

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 显示菜单
show_menu() {
    clear
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}  餐厅经营分析系统 - 交互式演示菜单${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""
    echo -e "${GREEN}【第一阶段】服务启动与数据准备${NC}"
    echo "  1. 启动所有大数据服务 (Hadoop/HBase/Hive)"
    echo "  2. 上传原始数据到HDFS"
    echo "  3. 查询HDFS中的原始数据"
    echo ""
    echo -e "${GREEN}【第二阶段】数据清洗与处理${NC}"
    echo "  4. 运行MapReduce数据清洗任务"
    echo ""
    echo -e "${GREEN}【第三阶段】HBase实时存储与查询${NC}"
    echo "  5. 创建HBase表"
    echo "  6. 导入清洗后的数据到HBase"
    echo "  7. 查询HBase数据"
    echo ""
    echo -e "${GREEN}【第四阶段】Hive数据分析${NC}"
    echo "  8. 创建Hive表并加载数据"
    echo "  9. 执行Hive数据分析查询"
    echo ""
    echo -e "${GREEN}【服务管理】${NC}"
    echo "  10. 停止所有服务"
    echo "  0.  退出程序"
    echo ""
    echo -e "${BLUE}========================================${NC}"
    echo -n "请选择操作 (0-10): "
}

# 执行选择的操作
execute_option() {
    case $1 in
        1)
            echo -e "${YELLOW}正在启动所有大数据服务...${NC}"
            ./start_all_services.sh
            ;;
        2)
            echo -e "${YELLOW}正在上传原始数据到HDFS...${NC}"
            ./hdfs_setup.sh
            ;;
        3)
            echo -e "${YELLOW}正在查询HDFS中的原始数据...${NC}"
            ./hdfs_query.sh
            ;;
        4)
            echo -e "${YELLOW}正在运行MapReduce数据清洗任务...${NC}"
            ./run_mapreduce.sh
            ;;
        5)
            echo -e "${YELLOW}正在创建HBase表...${NC}"
            ./hbase_setup.sh
            ;;
        6)
            echo -e "${YELLOW}正在导入数据到HBase...${NC}"
            ./hbase_import.sh
            ;;
        7)
            echo -e "${YELLOW}正在查询HBase数据...${NC}"
            ./hbase_query.sh
            ;;
        8)
            echo -e "${YELLOW}正在创建Hive表并加载数据...${NC}"
            hive -f hive_setup.sql
            ;;
        9)
            echo -e "${YELLOW}正在执行Hive数据分析查询...${NC}"
            hive -f hive_analysis.sql
            ;;
        10)
            echo -e "${YELLOW}正在停止所有服务...${NC}"
            ./stop_all_services.sh
            ;;
        0)
            echo -e "${GREEN}感谢使用，再见！${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}无效选择，请重新输入！${NC}"
            ;;
    esac
}

# 主循环
main() {
    while true; do
        show_menu
        read -r choice
        
        if [ -z "$choice" ]; then
            continue
        fi
        
        echo ""
        execute_option "$choice"
        
        echo ""
        echo -e "${GREEN}操作完成！${NC}"
        echo -n "按Enter键继续..."
        read -r
    done
}

# 启动程序
main

