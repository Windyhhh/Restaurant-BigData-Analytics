# 🍜 Restaurant BigData Analytics | 基于大数据技术的餐厅经营分析系统

> **Big data analytics system for restaurant business operations. Sales trend analysis, customer behavior insights, menu optimization, peak hour detection, and revenue forecasting. Hadoop/Spark-based processing with visualization dashboard.**
>
> 面向餐厅经营的大数据分析系统。销售趋势分析、顾客行为洞察、菜单优化、高峰时段检测和营收预测。基于 Hadoop/Spark 处理，带可视化仪表盘。

---

## 🌟 Features | 核心特性

- **Sales Analytics** — Daily/weekly/monthly sales trends
- **Customer Insights** — Customer segmentation, repeat rate
- **Menu Optimization** — Dish popularity, profitability analysis
- **Peak Hour Detection** — Busy time slot identification
- **Revenue Forecasting** — Time series prediction
- **Big Data Stack** — Hadoop HDFS + Spark + Hive
- **Visualization** — Interactive dashboard (ECharts/D3)

---

## 🚀 Quick Start | 快速开始

```bash
# Process data with Spark
spark-submit analyze_sales.py --input hdfs:///restaurant/data

# Generate reports
python generate_report.py --month 2024-01

# Start dashboard
python app.py
# http://localhost:5000
```

---

## 📊 Analysis Dimensions | 分析维度

| Dimension | Metrics |
|-----------|---------|
| **Sales** | Revenue, orders, avg ticket, growth rate |
| **Menu** | Dish rank, margin, popularity, combo analysis |
| **Customer** | New vs returning, frequency, LTV |
| **Time** | Peak hours, day-of-week, seasonal trends |
| **Location** | Table utilization, area performance |

---

## 📄 License | 许可证

MIT License.

[GitHub](https://github.com/Windyhhh/Restaurant-BigData-Analytics)
