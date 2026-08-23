# 实验报告截图指南

## 📸 关键代码截图位置

### 1️⃣ MapReduce数据清洗代码
**文件路径：** `mapreduce/src/main/java/com/restaurant/OrderDataCleaner.java`

**截图范围：** 第1-80行
- **内容：** Mapper类定义、数据解析、字段验证、金额验证
- **说明：** 展示数据清洗的核心逻辑
- **截图建议：** 
  ```
  第1-30行：包名、导入、类定义
  第28-80行：Mapper类、map方法、数据验证逻辑
  ```

### 2️⃣ Hive数据分析SQL
**文件路径：** `scripts/hive_analysis.sql`

**截图范围：** 第1-50行（销量排行）
- **内容：** 销量排行榜分析查询
- **说明：** 展示Hive SQL分析能力
- **截图建议：**
  ```
  第1-22行：销量排行榜查询
  第24-41行：VIP客户发现查询
  第43-61行：菜品关联分析
  ```

### 3️⃣ 原始数据格式
**文件路径：** `data/order_log_20231201.txt`

**截图内容：** 原始订单日志数据
- **格式：** `order_id|user_id|store_id|dish_list|order_time|amount`
- **示例：**
  ```
  O001|U001|S001|D001,D005|2023-12-01 08:15:23|58.50
  O002|U002|S002|D002,D003|2023-12-01 09:30:45|45.00
  ```

### 4️⃣ 用户信息数据
**文件路径：** `data/user_profiles.csv`

**截图内容：** CSV格式的用户信息
- **字段：** user_id, age_group, gender, preference_taste, member_level, registration_date

### 5️⃣ 菜品信息数据
**文件路径：** `data/dishes.csv`

**截图内容：** CSV格式的菜品信息
- **字段：** dish_id, dish_name, category, price, taste_type, is_recommended

---

## 🎬 运行结果截图位置

### 运行步骤1：启动服务
**命令：** `./start_all_services.sh`
**截图内容：**
- jps进程列表（显示NameNode, DataNode, ResourceManager等）
- Web UI访问地址

### 运行步骤2：上传数据
**命令：** `./hdfs_setup.sh`
**截图内容：**
- HDFS目录创建成功
- 数据文件上传成功

### 运行步骤3：查询原始数据
**命令：** `./hdfs_query.sh`
**截图内容：**
- HDFS中的原始数据内容
- 订单日志、用户信息、菜品信息

### 运行步骤4：MapReduce清洗
**命令：** `./run_mapreduce.sh`
**截图内容：**
- MapReduce任务执行过程
- 清洗后的数据输出
- 数据统计信息（总记录数等）

### 运行步骤5：创建HBase表
**命令：** `./hbase_setup.sh`
**截图内容：**
- HBase表创建成功
- 表结构信息（列族定义）

### 运行步骤6：导入HBase
**命令：** `./hbase_import.sh`
**截图内容：**
- 数据导入过程
- 导入统计信息

### 运行步骤7：查询HBase
**命令：** `./hbase_query.sh`
**截图内容：**
- HBase查询结果
- 按用户ID查询的订单数据

### 运行步骤8：Hive分析
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

## 📋 推荐截图清单

### 代码部分（3张）
- [ ] MapReduce Mapper类代码
- [ ] Hive SQL分析查询
- [ ] 原始数据格式示例

### 运行结果部分（8张）
- [ ] 服务启动成功（jps输出）
- [ ] 数据上传成功（HDFS文件列表）
- [ ] 原始数据内容（HDFS查询结果）
- [ ] MapReduce清洗结果（清洗后的数据）
- [ ] HBase表创建（表结构）
- [ ] HBase数据导入（导入统计）
- [ ] HBase查询结果（查询输出）
- [ ] Hive分析结果（分析查询输出）

**总计：11张关键截图**

---

## 🎯 截图技巧

### 技巧1：代码截图
- 使用IDE的截图功能（VS Code、IntelliJ等）
- 确保代码清晰可读
- 包含行号便于引用

### 技巧2：命令行输出截图
- 使用Windows截图工具或Snagit
- 确保输出完整
- 包含命令和结果

### 技巧3：表格数据截图
- 确保表头清晰
- 包含足够的数据行（至少5-10行）
- 可以使用表格工具美化

### 技巧4：流程图截图
- 使用Visio或在线工具绘制
- 清晰标注各个阶段
- 显示数据流向

---

## 📝 截图说明文字建议

### 代码部分
```
图X：MapReduce数据清洗程序
说明：Mapper类负责读取原始订单日志，进行数据验证和清洗。
主要功能包括：
1. 解析订单数据（6个字段）
2. 验证必填字段
3. 验证金额有效性
4. 过滤无效记录
```

### 运行结果部分
```
图X：MapReduce清洗结果
说明：清洗后的订单数据已保存到HDFS的/restaurant/cleaned_data/orders/目录。
数据格式为：order_id|user_id|store_id|dish_id|order_time|amount
总共清洗了XXX条有效订单记录。
```

---

## 🔗 文件快速导航

| 文件 | 用途 | 截图范围 |
|------|------|---------|
| `mapreduce/src/main/java/com/restaurant/OrderDataCleaner.java` | MapReduce代码 | 第1-80行 |
| `scripts/hive_analysis.sql` | Hive分析SQL | 第1-50行 |
| `data/order_log_20231201.txt` | 原始数据 | 前10行 |
| `data/user_profiles.csv` | 用户信息 | 前5行 |
| `data/dishes.csv` | 菜品信息 | 前5行 |

---

**版本：** 1.0  
**更新日期：** 2025年12月23日


