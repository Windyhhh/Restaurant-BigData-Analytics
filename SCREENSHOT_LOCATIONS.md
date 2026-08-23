# 实验报告截图位置总结

## 🎯 关键代码截图位置

### 1️⃣ MapReduce数据清洗代码
**文件：** `mapreduce/src/main/java/com/restaurant/OrderDataCleaner.java`

**截图范围：**
- **第1-30行**：包名、导入、类定义、Mapper类声明
- **第28-80行**：Mapper的map方法、数据解析、字段验证、金额验证

**关键内容：**
```java
// 解析订单数据
String[] fields = line.split("\\|");

// 验证字段数量
if (fields.length != 6) {
    context.getCounter("DataCleaner", "INVALID_FIELD_COUNT").increment(1);
    return;
}

// 验证金额
double amount = Double.parseDouble(amountStr);
if (amount <= 0) {
    context.getCounter("DataCleaner", "NEGATIVE_OR_ZERO_AMOUNT").increment(1);
    return;
}
```

**说明：** 展示MapReduce如何清洗数据，包括字段验证、金额验证等

---

### 2️⃣ Hive数据分析SQL
**文件：** `scripts/hive_analysis.sql`

**截图范围：**
- **第1-22行**：销量排行榜查询
- **第24-41行**：VIP客户发现查询
- **第43-61行**：菜品关联分析

**关键内容：**
```sql
-- 分析1: 销量排行榜
SELECT 
    d.dish_id,
    d.dish_name,
    COUNT(*) AS sales_count,
    SUM(o.amount) AS total_revenue
FROM orders_cleaned o
JOIN dishes d ON o.dish_id = d.dish_id
GROUP BY d.dish_id, d.dish_name, d.category, d.price
ORDER BY sales_count DESC
LIMIT 10;
```

**说明：** 展示Hive SQL分析能力，包括聚合、连接、排序等

---

### 3️⃣ 原始数据格式
**文件：** `data/order_log_20231201.txt`

**截图内容：** 前5-10行原始订单日志

**数据示例：**
```
O001|U001|S001|D001,D005|2023-12-01 08:15:23|58.50
O002|U002|S002|D003,D007|2023-12-01 08:23:45|72.00
O003|U003|S001|D002,D004,D006|2023-12-01 08:35:12|95.80
O004|U004|S003|D001|2023-12-01 09:05:33|28.00
O005|U005|S002|D008,D009|2023-12-01 09:18:47|115.50
```

**说明：** 展示原始数据的格式和内容

---

### 4️⃣ 用户信息数据
**文件：** `data/user_profiles.csv`

**截图内容：** 前3-5行用户信息

**数据示例：**
```
user_id,age_group,gender,preference_taste,member_level,registration_date
U001,25-30,M,辣味,Gold,2022-05-15
U002,31-35,F,清淡,Silver,2022-06-20
U003,20-25,M,咸鲜,Bronze,2023-01-10
```

**说明：** 展示用户信息的结构

---

### 5️⃣ 菜品信息数据
**文件：** `data/dishes.csv`

**截图内容：** 前3-5行菜品信息

**数据示例：**
```
dish_id,dish_name,category,price,taste_type,is_recommended
D001,宫保鸡丁,川菜,28.00,辣味,1
D002,红烧肉,家常菜,38.00,咸鲜,1
D003,清汤面,面食,18.00,清淡,0
```

**说明：** 展示菜品信息的结构

---

## 📊 运行结果截图位置

### 步骤1：环境检查
**命令：** `bash run_in_wsl.sh`

**截图内容：**
- Java版本信息
- 数据文件列表
- 项目结构

**关键输出：**
```
openjdk version "1.8.0_472"
OpenJDK Runtime Environment (build 1.8.0_472-8u472-ga-1~24.04-b08)
```

---

### 步骤2：MapReduce编译
**命令：** `cd mapreduce && mvn clean package`

**截图内容：**
- 编译成功信息
- JAR文件大小

**关键输出：**
```
✓ MapReduce程序编译成功
-rwxrwxrwx 1 windy windy 6.7K Dec 23  2025 target/order-data-cleaner-1.0-SNAPSHOT.jar
```

---

### 步骤3：启动服务
**命令：** `./start_all_services.sh`

**截图内容：**
- 服务启动成功
- jps进程列表（NameNode, DataNode, ResourceManager等）

---

### 步骤4：上传数据
**命令：** `./hdfs_setup.sh`

**截图内容：**
- HDFS目录创建
- 数据文件上传成功

---

### 步骤5：查询原始数据
**命令：** `./hdfs_query.sh`

**截图内容：**
- HDFS中的原始数据内容
- 订单日志、用户信息、菜品信息

---

### 步骤6：MapReduce清洗
**命令：** `./run_mapreduce.sh`

**截图内容：**
- MapReduce任务执行过程
- 清洗后的数据输出
- 数据统计信息

---

### 步骤7：创建HBase表
**命令：** `./hbase_setup.sh`

**截图内容：**
- HBase表创建成功
- 表结构信息（列族定义）

---

### 步骤8：导入HBase
**命令：** `./hbase_import.sh`

**截图内容：**
- 数据导入过程
- 导入统计信息

---

### 步骤9：查询HBase
**命令：** `./hbase_query.sh`

**截图内容：**
- HBase查询结果
- 按用户ID查询的订单数据

---

### 步骤10：Hive分析
**命令：** `hive -f hive_analysis.sql`

**截图内容：**
- Hive表创建成功
- 各种分析查询结果：
  - 销量排行榜
  - VIP客户列表
  - 菜品关联分析
  - 门店营业额对比
  - 销售趋势分析

---

## 📋 推荐截图清单（共11张）

### 代码部分（3张）
- [ ] **图1**：MapReduce Mapper类代码（第1-30行）
- [ ] **图2**：Hive SQL分析查询（第1-30行）
- [ ] **图3**：原始数据格式示例（前5行）

### 运行结果部分（8张）
- [ ] **图4**：Java环境检查（版本信息）
- [ ] **图5**：MapReduce编译成功（JAR文件）
- [ ] **图6**：服务启动成功（jps输出）
- [ ] **图7**：数据上传成功（HDFS文件列表）
- [ ] **图8**：MapReduce清洗结果（清洗后的数据）
- [ ] **图9**：HBase表创建（表结构）
- [ ] **图10**：HBase查询结果（查询输出）
- [ ] **图11**：Hive分析结果（分析查询输出）

---

## 🎬 快速截图指南

### 如何在IDE中截图代码
1. 打开文件：`mapreduce/src/main/java/com/restaurant/OrderDataCleaner.java`
2. 选择第1-30行
3. 使用IDE的截图功能或Snagit
4. 确保代码清晰可读

### 如何在终端中截图
1. 在WSL中运行命令
2. 使用Windows截图工具（Win+Shift+S）
3. 或使用Snagit等专业截图工具
4. 确保输出完整

### 如何美化截图
1. 使用等宽字体（Courier New, Consolas）
2. 调整终端窗口大小，确保内容完整
3. 使用深色主题提高对比度
4. 可选：使用Snagit添加注释和箭头

---

## 📝 截图说明文字模板

### 代码截图说明
```
图X：MapReduce数据清洗程序（OrderDataCleaner.java）

说明：
Mapper类负责读取原始订单日志，进行数据验证和清洗。
主要功能包括：
1. 解析订单数据（6个字段）
2. 验证必填字段
3. 验证金额有效性（必须大于0）
4. 过滤无效记录
5. 输出清洗后的数据

代码中使用了Hadoop的Counter机制来统计各类错误记录数。
```

### 运行结果说明
```
图X：MapReduce清洗结果

说明：
清洗后的订单数据已保存到HDFS的/restaurant/cleaned_data/orders/目录。
数据格式为：order_id|user_id|store_id|dish_id|order_time|amount
总共清洗了XXX条有效订单记录。
```

---

**版本：** 1.0  
**更新日期：** 2025年12月23日  
**状态：** ✓ 完成


