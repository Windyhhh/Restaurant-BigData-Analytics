# 餐厅经营分析系统 - 完整项目指南

## 📋 项目概述

本项目是一个**基于大数据技术的餐厅经营分析系统**，使用Hadoop生态系统实现数据采集、存储、清洗、分析和查询的完整流程。

**技术栈**: HDFS + MapReduce + HBase + Hive

---

## 📁 项目文件结构说明

### 根目录文件

| 文件名 | 说明 |
|-------|------|
| **README.md** | 项目主说明文件，包含快速开始指南 |
| **PROJECT_GUIDE.md** | 本文件，详细的项目结构和文件说明 |

### 📂 data/ 目录 - 测试数据

| 文件名 | 说明 | 大小 | 用途 |
|-------|------|------|------|
| **order_log_20231201.txt** | 2023年12月1日订单日志 | 测试数据 | 包含订单ID、用户ID、门店ID、菜品列表、订单时间、金额 |
| **order_log_20231202.txt** | 2023年12月2日订单日志 | 测试数据 | 同上 |
| **order_log_20231203.txt** | 2023年12月3日订单日志 | 测试数据 | 同上 |
| **user_profiles.csv** | 用户信息数据 | CSV格式 | 包含user_id、age_group、gender、preference_taste、member_level、registration_date |
| **dishes.csv** | 菜品信息数据 | CSV格式 | 包含dish_id、dish_name、category、price、taste_type、is_recommended |

**数据格式说明：**
```
订单日志: O001|U001|S001|D001,D005|2023-12-01 08:15:23|58.50
用户信息: user_id,age_group,gender,preference_taste,member_level,registration_date
菜品信息: dish_id,dish_name,category,price,taste_type,is_recommended
```

### 📂 mapreduce/ 目录 - MapReduce数据清洗程序

| 文件/目录 | 说明 | 用途 |
|---------|------|------|
| **pom.xml** | Maven项目配置文件 | 管理项目依赖和构建配置 |
| **src/main/java/com/restaurant/OrderDataCleaner.java** | 数据清洗程序 | 使用MapReduce过滤无效记录，解析字段，转换格式 |
| **target/** | 编译输出目录 | 包含编译的class文件和生成的JAR包 |
| **target/order-data-cleaner-1.0-SNAPSHOT.jar** | 可执行JAR包 | 用于提交到Hadoop集群运行 |

**功能：**
- 过滤订单数据中的无效记录
- 解析和验证各字段
- 输出清洗后的数据到HDFS

### 📂 scripts/ 目录 - 操作脚本

#### HDFS操作脚本

| 脚本名 | 说明 | 执行步骤 |
|-------|------|---------|
| **hdfs_setup.sh** | HDFS数据上传 | 上传data/目录中的数据文件到HDFS的/restaurant/data目录 |
| **hdfs_query.sh** | HDFS数据查询 | 查询HDFS中存储的原始数据 |

#### MapReduce脚本

| 脚本名 | 说明 | 执行步骤 |
|-------|------|---------|
| **run_mapreduce.sh** | 运行数据清洗 | 提交OrderDataCleaner.jar到Hadoop，进行数据清洗 |

#### HBase操作脚本

| 脚本名 | 说明 | 执行步骤 |
|-------|------|---------|
| **hbase_setup.sh** | 创建HBase表 | 创建customer_orders表，定义列族(order_info, dish_info, user_info) |
| **hbase_import.sh** | 导入数据到HBase | 将清洗后的数据从HDFS导入到HBase |
| **hbase_query.sh** | 查询HBase数据 | 进行HBase查询演示，按用户ID和时间范围查询订单 |

#### Hive分析脚本

| 脚本名 | 说明 | 执行步骤 |
|-------|------|---------|
| **hive_setup.sql** | 创建Hive表 | 创建restaurant_db数据库和相关表结构 |
| **hive_analysis.sql** | 完整数据分析 | 包含5个分析查询：销量排行、VIP客户、菜品关联、门店对比、销售趋势 |
| **hive_analysis_simple.sql** | 简化数据分析 | 简单版本的分析查询，用于快速测试 |
| **run_hive.sh** | 运行Hive分析 | 执行hive_analysis.sql进行数据分析 |

#### 服务管理脚本

| 脚本名 | 说明 | 执行步骤 |
|-------|------|---------|
| **start_all_services.sh** | 启动所有服务 | 一键启动Hadoop、HBase、Hive相关服务 |
| **stop_all_services.sh** | 停止所有服务 | 停止所有运行中的服务 |

### 📂 metastore_db/ 目录 - Hive元数据库

| 文件/目录 | 说明 |
|---------|------|
| **metastore_db/** | Derby数据库目录，存储Hive的表结构和元数据信息 |
| **db.lck** | 数据库锁文件 |
| **service.properties** | Derby服务配置 |
| **seg0/** | Derby数据文件夹 |
| **log/** | Derby日志文件夹 |

---

## 🔄 完整执行流程

### 1️⃣ 初始化服务（第一次运行）
```bash
cd scripts
chmod +x start_all_services.sh
./start_all_services.sh
```

### 2️⃣ 上传原始数据到HDFS
```bash
chmod +x hdfs_setup.sh
./hdfs_setup.sh
```

### 3️⃣ 运行MapReduce清洗数据
```bash
chmod +x run_mapreduce.sh
./run_mapreduce.sh
```

### 4️⃣ 创建和配置HBase
```bash
chmod +x hbase_setup.sh
./hbase_setup.sh

chmod +x hbase_import.sh
./hbase_import.sh
```

### 5️⃣ HBase数据查询演示
```bash
chmod +x hbase_query.sh
./hbase_query.sh
```

### 6️⃣ 创建Hive表和分析
```bash
chmod +x hive_setup.sql
chmod +x hive_analysis.sql
chmod +x run_hive.sh
./run_hive.sh
```

### 7️⃣ 停止服务
```bash
chmod +x stop_all_services.sh
./stop_all_services.sh
```

---

## 📊 数据流向

```
原始数据（data/）
    ↓
上传到HDFS（hdfs_setup.sh）
    ↓
HDFS存储（/restaurant/data）
    ↓
MapReduce清洗（run_mapreduce.sh）
    ↓
清洗后的数据（HDFS /restaurant/output）
    ├─→ HBase导入（hbase_import.sh）→ HBase实时查询
    └─→ Hive分析（run_hive.sh）→ Hive数据分析报告
```

---

## 💾 备份文件夹说明

### backup/ 目录 - 项目备份

该目录包含所有整理出的**不必要的说明文档、辅助脚本和日志文件**：

#### 说明文档（原项目交付文件）
- 环境安装指南.md
- 设计报告.md
- 实验报告.md
- 完整执行指南.md
- 项目交付清单.md、项目提交清单.md、项目完成报告.md
- 项目总结.md、需求完成对应表.md
- 运行指南.md、最终检查清单.md
- 最终交付清单.md、最终验收报告.md、最终验收清单.md
- Docker安装方案.md、SETUP_COMPLETE.md、README_FINAL.md

#### 辅助脚本（环境配置相关）
- add_sudoers_root.sh、add_sudoers.sh
- configure_hadoop.sh、configure_sudoers.sh
- fix_java_version.sh、fix_mapred_config.sh、fix_yarn_config.sh
- install_bigdata_stack.sh、install_hadoop_env.sh、install_with_mirror.sh
- quick_install.sh、recreate_dirs.sh
- setup_env.sh、setup_hadoop_users.sh、setup_hdfs_user*.sh
- setup_windy_hdfs.sh、start_all_hadoop.sh
- complete_project_run.sh、run_complete_project.sh

#### 其他辅助文件
- hbase_commands.txt - HBase命令参考
- hive_analysis.sql、hive_simple.sql - SQL脚本备份
- create_hbase_table.py、create_table.rb、CreateHBaseTable.java - 表创建工具
- derby.log - 日志文件

**说明：** 这些文件是在项目开发过程中用于环境配置和交付的临时文件，已清理到backup文件夹以保持主项目目录的整洁。

---

## 🔧 HBase表设计

### 表名
`customer_orders`

### RowKey设计
`userId_timestamp` 例如：`U001_20231201081523`

**优点：**
- 支持按用户查询所有订单
- 支持按时间范围查询
- 数据分散均匀

### 列族设计

| 列族 | 说明 | 包含列 |
|-----|------|--------|
| **order_info** | 订单基本信息 | order_id, total_amount, order_time |
| **dish_info** | 菜品信息 | dish_ids, dish_names, prices |
| **user_info** | 用户信息 | user_id, user_name, user_level |

---

## 📊 Hive数据库设计

### 数据库
`restaurant_db`

### 表结构

| 表名 | 说明 | 主要字段 |
|-----|------|---------|
| **orders_cleaned** | 清洗后的订单数据 | order_id, user_id, store_id, dishes, order_time, amount |
| **user_profiles** | 用户信息 | user_id, age_group, gender, preference_taste, member_level |
| **dishes** | 菜品信息 | dish_id, dish_name, category, price, taste_type |

### 分析查询

1. **销量排行榜** - 统计各菜品销量和销售额
2. **VIP客户发现** - 识别高价值客户（金卡会员且高消费）
3. **菜品关联分析** - 找出经常搭配的菜品组合
4. **门店营业额对比** - 比较不同门店的收入
5. **销售趋势分析** - 分析按日期的销售趋势

---

## 🚀 快速开始

### 最小化运行步骤

```bash
# 1. 启动服务
cd scripts && ./start_all_services.sh

# 2. 上传数据
./hdfs_setup.sh

# 3. 清洗数据
./run_mapreduce.sh

# 4. 分析数据
./run_hive.sh

# 5. 停止服务
./stop_all_services.sh
```

---

## ⚠️ 常见问题

### Q1: 某个脚本执行失败怎么办？
**A:** 
- 检查Hadoop、HBase、Hive是否正确启动
- 查看脚本中的日志输出
- 确认必要的文件权限（chmod +x）

### Q2: HDFS上传数据失败？
**A:** 
- 确认Hadoop NameNode正常运行
- 检查HDFS存储空间是否充足
- 确认目标目录权限

### Q3: MapReduce任务失败？
**A:** 
- 检查输入路径是否存在
- 确认输出路径不存在（需要先删除）
- 查看TaskTracker日志

### Q4: HBase连接失败？
**A:** 
- 确认HBase Master启动
- 检查ZooKeeper服务
- 验证HBase配置文件

### Q5: Hive查询返回结果为空？
**A:** 
- 确认hive_setup.sql已执行
- 检查hbase_import.sh是否成功导入数据
- 验证表名和字段名

---

## 📝 项目交付清单

- ✅ 源代码（mapreduce/）
- ✅ 测试数据（data/）
- ✅ 操作脚本（scripts/）
- ✅ 项目说明（README.md、PROJECT_GUIDE.md）
- ✅ 备份文件（backup/）
- ✅ 元数据库（metastore_db/）

---

## 🎯 项目总结

该项目展示了如何使用Hadoop大数据技术栈处理和分析真实业务数据。通过完整的ETL流程（提取、转换、加载），实现了：

- **数据存储**：用HDFS存储大规模数据
- **数据清洗**：用MapReduce进行分布式数据处理
- **实时查询**：用HBase提供毫秒级查询
- **数据分析**：用Hive进行复杂的数据分析

这是一个完整的大数据处理示例项目。

---

**更新日期：** 2025年12月22日  
**项目状态：** ✅ 整理完成，可直接使用
