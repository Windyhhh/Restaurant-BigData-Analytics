# WSL环境运行结果

## 📊 环境检查结果

### 系统信息
```
操作系统: Linux Windy 6.6.87.2-microsoft-standard-WSL2
架构: x86_64
用户: windy
当前目录: /mnt/c/Users/32517/Desktop/150
```

### Java环境
```
openjdk version "1.8.0_472"
OpenJDK Runtime Environment (build 1.8.0_472-8u472-ga-1~24.04-b08)
OpenJDK 64-Bit Server VM (build 25.472-b08, mixed mode)
```

---

## 📁 数据文件检查

### 订单日志文件
```
-rwxrwxrwx 1 windy windy 3.2K Dec 20 17:17 data/order_log_20231201.txt
-rwxrwxrwx 1 windy windy 3.2K Dec 20 17:17 data/order_log_20231202.txt
-rwxrwxrwx 1 windy windy 3.2K Dec 20 17:18 data/order_log_20231203.txt
```

### 用户信息文件
```
-rwxrwxrwx 1 windy windy 830 Dec 20 17:18 data/user_profiles.csv
```

### 菜品信息文件
```
-rwxrwxrwx 1 windy windy 403 Dec 20 17:18 data/dishes.csv
```

---

## 📋 原始数据样本

### 订单日志数据 (order_log_20231201.txt)
```
O001|U001|S001|D001,D005|2023-12-01 08:15:23|58.50
O002|U002|S002|D003,D007|2023-12-01 08:23:45|72.00
O003|U003|S001|D002,D004,D006|2023-12-01 08:35:12|95.80
O004|U004|S003|D001|2023-12-01 09:05:33|28.00
O005|U005|S002|D008,D009|2023-12-01 09:18:47|115.50
```

**数据格式说明：**
- 字段1: order_id (订单ID)
- 字段2: user_id (用户ID)
- 字段3: store_id (门店ID)
- 字段4: dish_list (菜品列表，逗号分隔)
- 字段5: order_time (订单时间)
- 字段6: amount (订单金额)

### 用户信息数据 (user_profiles.csv)
```
user_id,age_group,gender,preference_taste,member_level,registration_date
U001,25-30,M,辣味,Gold,2022-05-15
U002,31-35,F,清淡,Silver,2022-06-20
```

### 菜品信息数据 (dishes.csv)
```
dish_id,dish_name,category,price,taste_type,is_recommended
D001,宫保鸡丁,川菜,28.00,辣味,1
D002,红烧肉,家常菜,38.00,咸鲜,1
```

---

## 💻 MapReduce代码片段

### OrderDataCleaner.java (前30行)
```java
package com.restaurant;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import java.io.IOException;

/**
 * MapReduce程序：清洗餐厅订单数据
 * 功能：
 * 1. 过滤无效记录（订单金额缺失或为负）
 * 2. 解析为结构化字段
 * 3. 输出清洗后的数据
 */
public class OrderDataCleaner {

    /**
     * Mapper类：读取原始订单日志，进行数据清洗和解析
     */
    public static class OrderCleanMapper extends Mapper<LongWritable, Text, Text, NullWritable> {

        private Text outputKey = new Text();
```

---

## 🔍 Hive分析SQL片段

### hive_analysis.sql (前30行)
```sql
-- ========================================
-- Hive数据分析脚本
-- 功能：实现各种业务分析查询
-- ========================================

USE restaurant_db;

-- ========================================
-- 分析1: 销量排行榜 - 统计销量最高的前10名菜品
-- ========================================
SELECT
    d.dish_id,
    d.dish_name,
    d.category,
    d.price,
    COUNT(*) AS sales_count,
    SUM(o.amount) AS total_revenue
FROM orders_cleaned o
JOIN dishes d ON o.dish_id = d.dish_id
GROUP BY d.dish_id, d.dish_name, d.category, d.price
ORDER BY sales_count DESC
LIMIT 10;

-- ========================================
-- 分析2: VIP客户发现 - 找出消费总金额最高的前100名顾客
-- ========================================
SELECT
    o.user_id,
    u.age_group,
    u.gender,
```

---

## 🔨 编译结果

### MapReduce程序编译
```
✓ MapReduce程序编译成功
-rwxrwxrwx 1 windy windy 6.7K Dec 23  2025 target/order-data-cleaner-1.0-SNAPSHOT.jar
```

**编译信息：**
- JAR文件大小: 6.7K
- 编译时间: 成功
- 输出位置: target/order-data-cleaner-1.0-SNAPSHOT.jar

---

## 📂 项目结构

### 可用的演示脚本
```
scripts/demo_auto.sh (3.3K)          - 自动演示脚本
scripts/demo_menu.sh (3.5K)          - 交互式菜单
scripts/hbase_import.sh (3.4K)       - HBase数据导入
scripts/hbase_query.sh (1.7K)        - HBase查询
scripts/hbase_setup.sh (1.9K)        - HBase表创建
scripts/hdfs_query.sh (1.1K)         - HDFS查询
scripts/hdfs_setup.sh (1.9K)         - HDFS数据上传
scripts/run_hive.sh (1.1K)           - Hive运行
scripts/run_mapreduce.sh (1.6K)      - MapReduce执行
scripts/start_all_services.sh (1.6K) - 启动所有服务
scripts/stop_all_services.sh (1.5K)  - 停止所有服务
```

### 可用的文档
```
DEMO_GUIDE.md (6.1K)           - 演示指南
DEMO_INDEX.md (5.1K)           - 快速索引
DEMO_SCRIPTS_README.md (5.7K)  - 脚本说明
DEMO_SUMMARY.md (6.3K)         - 演示总结
DEMO_WORKFLOW.md (12K)         - 工作流程
PROJECT_GUIDE.md (11K)         - 项目指南
QUICK_REFERENCE.md (3.3K)      - 快速参考
README.md (4.2K)               - 项目说明
SCREENSHOT_GUIDE.md (5.1K)     - 截图指南
```

---

## ✅ 验证清单

- [x] Java环境正常（OpenJDK 1.8.0_472）
- [x] 数据文件完整（订单日志、用户信息、菜品信息）
- [x] MapReduce程序编译成功
- [x] 项目结构完整
- [x] 所有演示脚本就绪
- [x] 文档齐全

---

## 🚀 后续步骤

### 方式1：使用交互式菜单
```bash
cd scripts
./demo_menu.sh
```

### 方式2：使用自动演示脚本
```bash
cd scripts
./demo_auto.sh
```

### 方式3：手动执行各步骤
```bash
# 1. 启动服务
cd scripts && ./start_all_services.sh

# 2. 上传数据
cd scripts && ./hdfs_setup.sh

# 3. 清洗数据
cd scripts && ./run_mapreduce.sh

# 4. 创建HBase表
cd scripts && ./hbase_setup.sh

# 5. 导入HBase
cd scripts && ./hbase_import.sh

# 6. 分析数据
cd scripts && hive -f hive_analysis.sql
```

---

**生成时间：** 2025年12月23日  
**环境：** WSL2 (Linux)  
**状态：** ✓ 就绪


