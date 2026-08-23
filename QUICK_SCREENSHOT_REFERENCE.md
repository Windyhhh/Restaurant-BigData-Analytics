# 快速截图参考卡

## 🎯 11张关键截图位置速查表

| # | 截图名称 | 文件位置 | 范围/内容 | 说明 |
|---|---------|--------|---------|------|
| 1️⃣ | MapReduce代码 | `mapreduce/src/main/java/com/restaurant/OrderDataCleaner.java` | 第1-30行 | Mapper类定义、数据解析 |
| 2️⃣ | Hive SQL | `scripts/hive_analysis.sql` | 第1-30行 | 销量排行、VIP客户分析 |
| 3️⃣ | 原始数据 | `data/order_log_20231201.txt` | 前5-10行 | 订单日志格式示例 |
| 4️⃣ | Java环境 | WSL终端 | `java -version` | Java版本信息 |
| 5️⃣ | 编译结果 | WSL终端 | `mvn clean package` | JAR文件编译成功 |
| 6️⃣ | 服务启动 | WSL终端 | `./start_all_services.sh` | jps进程列表 |
| 7️⃣ | 数据上传 | WSL终端 | `./hdfs_setup.sh` | HDFS文件列表 |
| 8️⃣ | 数据清洗 | WSL终端 | `./run_mapreduce.sh` | 清洗后的数据 |
| 9️⃣ | HBase表 | WSL终端 | `./hbase_setup.sh` | 表结构信息 |
| 🔟 | HBase查询 | WSL终端 | `./hbase_query.sh` | 查询结果 |
| 1️⃣1️⃣ | Hive分析 | WSL终端 | `hive -f hive_analysis.sql` | 分析查询结果 |

---

## 📍 代码截图位置详解

### 截图1️⃣：MapReduce代码
```
文件：mapreduce/src/main/java/com/restaurant/OrderDataCleaner.java
范围：第1-30行
内容：
  - 包名和导入
  - 类定义
  - Mapper类声明
  - map方法开始

关键代码：
  String[] fields = line.split("\\|");
  if (fields.length != 6) { ... }
  double amount = Double.parseDouble(amountStr);
  if (amount <= 0) { ... }
```

### 截图2️⃣：Hive SQL
```
文件：scripts/hive_analysis.sql
范围：第1-30行
内容：
  - 数据库选择
  - 销量排行榜查询
  - VIP客户分析开始

关键SQL：
  SELECT d.dish_id, d.dish_name, COUNT(*) AS sales_count
  FROM orders_cleaned o
  JOIN dishes d ON o.dish_id = d.dish_id
  GROUP BY d.dish_id, d.dish_name
  ORDER BY sales_count DESC
  LIMIT 10;
```

### 截图3️⃣：原始数据
```
文件：data/order_log_20231201.txt
内容：前5-10行
格式：order_id|user_id|store_id|dish_list|order_time|amount

示例：
O001|U001|S001|D001,D005|2023-12-01 08:15:23|58.50
O002|U002|S002|D003,D007|2023-12-01 08:23:45|72.00
O003|U003|S001|D002,D004,D006|2023-12-01 08:35:12|95.80
O004|U004|S003|D001|2023-12-01 09:05:33|28.00
O005|U005|S002|D008,D009|2023-12-01 09:18:47|115.50
```

---

## 🖥️ 运行结果截图位置详解

### 截图4️⃣：Java环境
```
命令：java -version
输出：
openjdk version "1.8.0_472"
OpenJDK Runtime Environment (build 1.8.0_472-8u472-ga-1~24.04-b08)
OpenJDK 64-Bit Server VM (build 25.472-b08, mixed mode)
```

### 截图5️⃣：编译结果
```
命令：cd mapreduce && mvn clean package
输出：
✓ MapReduce程序编译成功
-rwxrwxrwx 1 windy windy 6.7K Dec 23  2025 target/order-data-cleaner-1.0-SNAPSHOT.jar
```

### 截图6️⃣：服务启动
```
命令：./start_all_services.sh
输出：
jps输出（显示以下进程）：
  - NameNode
  - DataNode
  - ResourceManager
  - NodeManager
  - HMaster
  - HRegionServer
```

### 截图7️⃣：数据上传
```
命令：./hdfs_setup.sh
输出：
HDFS文件列表：
  /restaurant/raw_data/orders/
  /restaurant/raw_data/users/
  /restaurant/raw_data/dishes/
```

### 截图8️⃣：数据清洗
```
命令：./run_mapreduce.sh
输出：
清洗后的数据：
  /restaurant/cleaned_data/orders/
  
数据统计：
  总记录数：XXX
  有效记录：XXX
  无效记录：XXX
```

### 截图9️⃣：HBase表
```
命令：./hbase_setup.sh
输出：
表结构：
  Table: orders
  Column Families: order_info, dish_info, user_info
```

### 截图🔟：HBase查询
```
命令：./hbase_query.sh
输出：
查询结果（按user_id查询）：
  user_id | order_id | amount | order_time
  U001    | O001     | 58.50  | 2023-12-01 08:15:23
  ...
```

### 截图1️⃣1️⃣：Hive分析
```
命令：hive -f hive_analysis.sql
输出：
分析结果包括：
  1. 销量排行榜（前10菜品）
  2. VIP客户列表（消费最高的100名）
  3. 菜品关联分析（常见组合）
  4. 门店营业额对比
  5. 销售趋势分析
```

---

## ⚡ 快速截图步骤

### 步骤1：打开IDE查看代码
```
1. 打开VS Code或IntelliJ
2. 打开文件：mapreduce/src/main/java/com/restaurant/OrderDataCleaner.java
3. 选择第1-30行
4. 使用Snagit或Win+Shift+S截图
```

### 步骤2：在WSL中运行命令
```
1. 打开PowerShell或CMD
2. 运行：wsl bash
3. 进入项目目录：cd /mnt/c/Users/32517/Desktop/150
4. 运行各个脚本并截图
```

### 步骤3：整理截图
```
1. 将11张截图保存为PNG格式
2. 按顺序命名：screenshot_01.png ~ screenshot_11.png
3. 在实验报告中插入并添加说明文字
```

---

## 📋 截图说明文字模板

### 代码部分说明
```
【图X】MapReduce数据清洗程序

本图展示了MapReduce程序的Mapper类实现。该类负责：
1. 读取原始订单日志文件
2. 解析每行数据为6个字段
3. 验证必填字段的完整性
4. 验证订单金额的有效性（必须大于0）
5. 过滤无效记录并输出清洗后的数据

通过这个Mapper，系统可以处理大规模的原始数据，
确保后续分析的数据质量。
```

### 运行结果说明
```
【图X】MapReduce数据清洗结果

本图展示了MapReduce任务的执行结果。清洗后的数据：
- 保存位置：/restaurant/cleaned_data/orders/
- 数据格式：order_id|user_id|store_id|dish_id|order_time|amount
- 总记录数：XXX条
- 有效记录：XXX条
- 无效记录：XXX条

清洗后的数据已准备好导入HBase进行实时查询。
```

---

## ✅ 截图检查清单

- [ ] 代码截图清晰可读（字体大小合适）
- [ ] 包含行号便于引用
- [ ] 运行结果完整（包含命令和输出）
- [ ] 所有11张截图已收集
- [ ] 每张截图都有说明文字
- [ ] 截图按顺序编号
- [ ] 文件格式为PNG或JPG
- [ ] 分辨率足够高（至少1024x768）

---

**版本：** 1.0  
**更新日期：** 2025年12月23日  
**用途：** 快速查找截图位置


