# 演示脚本系统 - 快速索引

## 🎯 我需要...

### 📸 做实验报告截图
👉 **推荐：** 使用 `demo_menu.sh`
```bash
cd scripts && chmod +x demo_menu.sh && ./demo_menu.sh
# 选择: 1 → 3 → 4 → 7 → 9 → 10
```
📖 **参考文档：** `DEMO_GUIDE.md` → "实验报告截图建议"

---

### ⚡ 快速验证系统是否正常
👉 **推荐：** 使用 `demo_auto.sh`
```bash
cd scripts && chmod +x demo_auto.sh && ./demo_auto.sh
```
⏱️ **耗时：** 5-10分钟

---

### 🎤 做演讲演示
👉 **推荐：** 使用 `demo_menu.sh`
```bash
cd scripts && chmod +x demo_menu.sh && ./demo_menu.sh
# 逐步演示，在关键步骤讲解
```
📖 **参考文档：** `DEMO_WORKFLOW.md` → "推荐演示流程"

---

### 💻 在Windows上运行
👉 **推荐：** 使用 `demo_menu.py`
```bash
cd scripts && python3 demo_menu.py
# 或
cd scripts && python demo_menu.py
```

---

### 📚 学习项目架构
👉 **推荐：** 阅读以下文档（按顺序）
1. `PROJECT_GUIDE.md` - 项目结构和文件说明
2. `DEMO_WORKFLOW.md` - 数据流向和执行流程
3. `DEMO_GUIDE.md` - 详细的功能说明

---

### 🔍 快速查阅菜单选项
👉 **推荐：** 查看 `QUICK_REFERENCE.md`
- 菜单选项速查表
- 推荐演示流程
- 最佳截图时机

---

### 📖 了解新增的演示脚本
👉 **推荐：** 阅读 `DEMO_SCRIPTS_README.md`
- 新增文件清单
- 使用场景说明
- 最佳实践

---

## 📂 文件导航

### 🎬 演示脚本
```
scripts/
├── demo_menu.sh      ← 交互式菜单 (Bash版本)
├── demo_menu.py      ← 交互式菜单 (Python版本)
└── demo_auto.sh      ← 自动化演示
```

### 📚 文档文件
```
根目录/
├── DEMO_SUMMARY.md           ← 完整总结 (推荐首先阅读)
├── QUICK_REFERENCE.md        ← 快速参考卡片
├── DEMO_GUIDE.md             ← 详细使用指南
├── DEMO_WORKFLOW.md          ← 工作流程图
├── DEMO_SCRIPTS_README.md    ← 脚本说明
├── DEMO_INDEX.md             ← 本文件
├── PROJECT_GUIDE.md          ← 项目指南
└── README.md                 ← 项目说明
```

---

## ⏱️ 时间规划

| 需求 | 脚本 | 时间 | 文档 |
|------|------|------|------|
| 快速验证 | demo_auto.sh | 5分钟 | - |
| 快速演示 | demo_menu.sh | 10分钟 | QUICK_REFERENCE.md |
| 重点演示 | demo_menu.sh | 15分钟 | DEMO_WORKFLOW.md |
| 完整演示 | demo_menu.sh | 25分钟 | DEMO_GUIDE.md |
| 学习研究 | demo_menu.sh | 30分钟+ | PROJECT_GUIDE.md |

---

## 🎬 菜单选项速查

| 选项 | 功能 | 时间 | 截图 |
|------|------|------|------|
| 1 | 启动服务 | 30-60秒 | ⭐⭐⭐ |
| 2 | 上传数据 | 10-20秒 | ⭐⭐ |
| 3 | 查询原始数据 | 5-10秒 | ⭐⭐⭐ |
| 4 | MapReduce清洗 | 1-2分钟 | ⭐⭐⭐⭐ |
| 5 | 创建HBase表 | 10-20秒 | ⭐⭐ |
| 6 | 导入HBase | 30-60秒 | ⭐⭐⭐ |
| 7 | 查询HBase | 10-20秒 | ⭐⭐⭐⭐ |
| 8 | 创建Hive表 | 20-30秒 | ⭐⭐ |
| 9 | Hive分析 | 1-2分钟 | ⭐⭐⭐⭐⭐ |
| 10 | 停止服务 | 30-60秒 | ⭐⭐ |

---

## 🚀 快速开始命令

### 交互式菜单 (Bash)
```bash
cd scripts
chmod +x demo_menu.sh
./demo_menu.sh
```

### 交互式菜单 (Python)
```bash
cd scripts
python3 demo_menu.py
```

### 自动化演示
```bash
cd scripts
chmod +x demo_auto.sh
./demo_auto.sh
```

---

## 📋 推荐演示流程

### 最小化流程 (5分钟)
```
1 → 4 → 9 → 10
```

### 快速流程 (10分钟)
```
1 → 2 → 4 → 9 → 10
```

### 重点流程 (15分钟)
```
1 → 3 → 4 → 7 → 9 → 10
```

### 完整流程 (25分钟)
```
1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 10
```

---

## 💡 常见问题

### Q: 脚本在哪里？
A: 在 `scripts/` 目录下
- `demo_menu.sh` - Bash版本
- `demo_menu.py` - Python版本
- `demo_auto.sh` - 自动化版本

### Q: 如何选择脚本？
A: 根据你的需求：
- **演示和截图** → `demo_menu.sh`
- **Windows用户** → `demo_menu.py`
- **快速验证** → `demo_auto.sh`

### Q: 需要多长时间？
A: 取决于选择的流程：
- 快速验证：5分钟
- 快速演示：10分钟
- 重点演示：15分钟
- 完整演示：25分钟

### Q: 如何查看结果？
A: 
```bash
# Hive分析结果
cat scripts/hive_analysis_results.txt

# HDFS数据
hdfs dfs -cat /restaurant/cleaned_data/orders/part-*

# HBase数据
hbase shell
> scan 'customer_orders', {LIMIT => 10}
```

---

## 📖 文档阅读顺序

1. **本文件** (DEMO_INDEX.md) - 快速导航
2. **DEMO_SUMMARY.md** - 完整总结
3. **QUICK_REFERENCE.md** - 快速参考
4. **DEMO_GUIDE.md** - 详细指南
5. **DEMO_WORKFLOW.md** - 流程图
6. **PROJECT_GUIDE.md** - 项目指南

---

## ✅ 开始前检查清单

- [ ] 已阅读本文件 (DEMO_INDEX.md)
- [ ] 已选择合适的脚本
- [ ] 已准备好截图工具
- [ ] 已规划好演示流程
- [ ] 已测试过脚本

---

## 🎉 现在就开始吧！

选择你的场景，按照上面的推荐运行脚本即可。

**祝演示顺利！** 🎬

---

**版本：** 1.0  
**更新日期：** 2025年12月23日


