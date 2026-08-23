# 项目结构文档

## 📁 项目目录结构

```
餐厅经营分析系统/
├── data/                           # 📊 测试数据目录
│   ├── dishes.csv                  # 菜品信息数据
│   ├── order_log_20231201.txt      # 2023-12-01 订单日志
│   ├── order_log_20231202.txt      # 2023-12-02 订单日志
│   ├── order_log_20231203.txt      # 2023-12-03 订单日志
│   └── user_profiles.csv           # 用户信息数据
│
├── mapreduce/                      # 🔧 MapReduce程序目录
│   ├── pom.xml                     # Maven项目配置
│   └── src/main/java/com/restaurant/
│       └── OrderDataCleaner.java   # 数据清洗程序
│
├── scripts/                        # 🛠️ 脚本文件目录
│   ├── demo_auto.sh                # 自动化演示脚本
│   ├── demo_menu.sh                # Bash菜单脚本
│   ├── demo_menu.py                # Python菜单脚本
│   ├── hbase_import.sh             # HBase数据导入
│   ├── hbase_query.sh              # HBase查询脚本
│   ├── hbase_setup.sh              # HBase表创建
│   ├── hdfs_query.sh               # HDFS查询脚本
│   ├── hdfs_setup.sh               # HDFS数据上传
│   ├── hive_analysis.sql           # Hive分析SQL
│   ├── hive_analysis_simple.sql    # 简化版Hive分析
│   ├── hive_setup.sql              # Hive表创建SQL
│   ├── run_hive.sh                 # 运行Hive脚本
│   ├── run_mapreduce.sh            # 运行MapReduce
│   ├── start_all_services.sh       # 启动所有服务
│   ├── stop_all_services.sh        # 停止所有服务
│   └── test_demo_menu.ps1          # PowerShell测试脚本
│
└── 📚 文档文件（根目录）            # 完整项目文档
    ├── README.md                   # 项目主说明
    ├── PROJECT_GUIDE.md            # 项目详细指南
    ├── DEMO_GUIDE.md               # 演示使用指南
    ├── DEMO_SUMMARY.md             # 演示总结
    ├── DEMO_WORKFLOW.md            # 工作流程说明
    ├── QUICK_REFERENCE.md          # 快速参考
    ├── CHECKLIST.md                # 检查清单
    ├── FINAL_SUMMARY.md            # 最终总结
    ├── EXPERIMENT_REPORT_SUMMARY.md # 实验报告总结
    ├── SCREENSHOT_GUIDE.md         # 截图指南
    ├── SCREENSHOT_LOCATIONS.md     # 截图位置说明
    ├── QUICK_SCREENSHOT_REFERENCE.md # 快速截图参考
    ├── WSL_RUN_RESULTS.md          # WSL运行结果
    └── run_in_wsl.sh               # WSL运行脚本
```

## 🗂️ 目录说明

### 📊 data/ - 测试数据
- **订单日志文件**: 包含3天的订单数据，每条记录包含订单ID、用户ID、门店ID、菜品列表、订单时间、金额
- **用户信息CSV**: 包含20个用户的详细信息（年龄、性别、口味偏好等）
- **菜品信息CSV**: 包含9个菜品的详细信息（菜品名称、分类、价格等）

### 🔧 mapreduce/ - MapReduce程序
- **Maven项目**: 包含完整的Java项目结构和依赖配置
- **OrderDataCleaner**: 数据清洗程序，负责过滤无效记录、解析字段、转换格式

### 🛠️ scripts/ - 脚本文件
- **演示脚本**: demo_menu.sh、demo_menu.py、demo_auto.sh
- **HDFS脚本**: 数据上传和查询脚本
- **HBase脚本**: 表创建、数据导入、查询脚本
- **Hive脚本**: 表创建、分析SQL、执行脚本
- **服务管理**: 启动/停止所有服务的脚本

### 📚 文档文件
- **核心文档**: README.md、PROJECT_GUIDE.md
- **演示文档**: DEMO_GUIDE.md、DEMO_SUMMARY.md、DEMO_WORKFLOW.md
- **参考文档**: QUICK_REFERENCE.md、CHECKLIST.md
- **实验文档**: EXPERIMENT_REPORT_SUMMARY.md、FINAL_SUMMARY.md
- **截图文档**: SCREENSHOT_GUIDE.md、SCREENSHOT_LOCATIONS.md
- **运行文档**: WSL_RUN_RESULTS.md、run_in_wsl.sh

## 🧹 整理说明

本次整理工作包括：

### ✅ 已删除的内容
- **backup/**: 删除了包含重复文档和脚本的备份文件夹
- **mapreduce/target/**: 删除了编译产物（.class文件和.jar包）
- **metastore_db/**: 删除了Derby临时数据库文件
- **scripts/__pycache__/**: 删除了Python缓存文件

### ✅ 保留的内容
- **源代码**: 保留原始Java源代码，可重新编译
- **配置文件**: 保留Maven pom.xml等配置文件
- **测试数据**: 保留所有原始测试数据
- **脚本文件**: 保留所有功能脚本
- **最终文档**: 保留最新的项目文档（避免重复）

## 🎯 使用建议

1. **首次使用**: 阅读README.md和PROJECT_GUIDE.md
2. **快速上手**: 查看QUICK_REFERENCE.md
3. **演示测试**: 运行scripts/demo_menu.sh
4. **详细分析**: 参考DEMO_GUIDE.md和DEMO_WORKFLOW.md
5. **问题排查**: 查看CHECKLIST.md和相关截图文档

## 📋 技术栈

- **存储**: HDFS (Hadoop Distributed File System)
- **计算**: MapReduce
- **NoSQL**: HBase
- **数据仓库**: Hive
- **开发**: Java + Maven
- **脚本**: Bash + Python + PowerShell