# 快速参考卡片 - 演示脚本使用

## 🎯 三种运行方式

### 方式1️⃣：交互式菜单 (Bash版本)
```bash
cd scripts
chmod +x demo_menu.sh
./demo_menu.sh
```
**最适合：** 实验报告演示和截图

### 方式2️⃣：交互式菜单 (Python版本)
```bash
cd scripts
python3 demo_menu.py
# 或在Windows上
python demo_menu.py
```
**最适合：** Windows系统用户

### 方式3️⃣：自动化演示
```bash
cd scripts
chmod +x demo_auto.sh
./demo_auto.sh
```
**最适合：** 一键运行完整流程

---

## 📋 菜单选项速查表

| 选项 | 功能 | 时间 | 截图价值 |
|------|------|------|---------|
| 1 | 启动所有服务 | 30-60秒 | ⭐⭐⭐ |
| 2 | 上传数据到HDFS | 10-20秒 | ⭐⭐ |
| 3 | 查询HDFS数据 | 5-10秒 | ⭐⭐⭐ |
| 4 | MapReduce清洗 | 1-2分钟 | ⭐⭐⭐⭐ |
| 5 | 创建HBase表 | 10-20秒 | ⭐⭐ |
| 6 | 导入HBase数据 | 30-60秒 | ⭐⭐⭐ |
| 7 | 查询HBase数据 | 10-20秒 | ⭐⭐⭐⭐ |
| 8 | 创建Hive表 | 20-30秒 | ⭐⭐ |
| 9 | Hive数据分析 | 1-2分钟 | ⭐⭐⭐⭐⭐ |
| 10 | 停止所有服务 | 30-60秒 | ⭐⭐ |

---

## 🎬 推荐演示流程

### 完整演示 (15-20分钟)
```
1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 10
```

### 快速演示 (5-10分钟)
```
1 → 2 → 4 → 9 → 10
```

### 重点演示 (10-15分钟)
```
1 → 3 → 4 → 7 → 9 → 10
```

---

## 📸 最佳截图时机

| 步骤 | 截图内容 | 说明 |
|------|---------|------|
| 1 | jps进程列表 | 显示所有服务已启动 |
| 3 | HDFS文件列表 | 显示原始数据已上传 |
| 4 | MapReduce输出 | 显示清洗后的数据 |
| 7 | HBase查询结果 | 显示实时查询能力 |
| 9 | Hive分析结果 | 显示数据分析成果 |

---

## 🔧 故障排除

### 问题：脚本找不到
```bash
# 确保在scripts目录下
cd scripts
ls -la demo_menu.sh
```

### 问题：权限不足
```bash
# 给脚本添加执行权限
chmod +x demo_menu.sh
chmod +x demo_auto.sh
```

### 问题：服务启动失败
```bash
# 检查Java环境
java -version

# 检查Hadoop环境
hadoop version

# 查看进程
jps
```

### 问题：HDFS操作失败
```bash
# 检查HDFS状态
hdfs dfs -ls /

# 检查NameNode
hdfs dfsadmin -report
```

---

## 💾 查看结果文件

### Hive分析结果
```bash
cat scripts/hive_analysis_results.txt
```

### HDFS清洗数据
```bash
hdfs dfs -cat /restaurant/cleaned_data/orders/part-*
```

### HBase数据
```bash
hbase shell
> scan 'customer_orders', {LIMIT => 10}
> exit
```

---

## ⏱️ 时间规划

| 场景 | 时间 | 脚本 |
|------|------|------|
| 快速验证 | 5分钟 | demo_auto.sh |
| 演示演讲 | 15分钟 | demo_menu.sh (选项1,3,4,7,9) |
| 完整演示 | 20分钟 | demo_menu.sh (全部) |
| 详细讲解 | 30分钟+ | demo_menu.sh + 手动查询 |

---

## 🎓 学习路径

1. **理解架构** → 阅读 PROJECT_GUIDE.md
2. **快速体验** → 运行 demo_auto.sh
3. **逐步学习** → 使用 demo_menu.sh 逐个运行
4. **深入研究** → 查看各脚本源代码
5. **自定义扩展** → 修改脚本和SQL语句

---

## 📞 获取帮助

- 详细说明：`DEMO_GUIDE.md`
- 项目指南：`PROJECT_GUIDE.md`
- 项目说明：`README.md`
- 脚本源码：`scripts/` 目录

---

**最后更新：** 2025年12月23日  
**版本：** 1.0


