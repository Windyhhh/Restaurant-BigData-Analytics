# 🍽️ 餐厅经营大数据分析系统 | Restaurant Big Data Analytics System

> **基于大数据技术的餐厅经营智能分析系统——销售分析、客户画像、菜品推荐、供应链优化、可视化看板，用数据驱动餐饮经营决策。**
>
> *Restaurant business intelligent analytics system based on big data technology — sales analysis, customer profiling, dish recommendation, supply chain optimization, visualization dashboard, data-driven restaurant business decisions.*

---

## ⭐ 核心卖点 | Why Star This

| 卖点 | Feature | 一句话 |
|------|---------|--------|
| 📊 **全维度分析** | Full-Dimension Analytics | 销售、客户、菜品、供应链、员工五大维度全覆盖 |
| 🧠 **智能推荐** | Smart Recommendation | 基于协同过滤的菜品推荐和精准营销 |
| 📈 **销售预测** | Sales Forecasting | 时间序列预测，精准预估销量和备货 |
| 👥 **客户画像** | Customer Profiling | RFM 模型客户分层，精准识别高价值客户 |
| 📉 **成本优化** | Cost Optimization | 供应链分析，降低食材损耗和采购成本 |

---

## 🏆 技术栈 | Tech Stack

![Python](https://img.shields.io/badge/Python-3.8+-blue?logo=python)
![Spark](https://img.shields.io/badge/Spark-3.0+-orange?logo=apachespark)
![Hadoop](https://img.shields.io/badge/Hadoop-3.0+-yellow?logo=apachehadoop)
![Hive](https://img.shields.io/badge/Hive-3.0+-blue?logo=apachehive)
![MySQL](https://img.shields.io/badge/MySQL-8.0+-blue?logo=mysql)
![Redis](https://img.shields.io/badge/Redis-7.0+-red?logo=redis)
![Flask](https://img.shields.io/badge/Flask-2.0+-black?logo=flask)
![ECharts](https://img.shields.io/badge/ECharts-5.0+-orange?logo=apacheecharts)
![Docker](https://img.shields.io/badge/Docker-24.0+-blue?logo=docker)

---

## 📊 分析模块 | Analytics Modules

| 模块 | 功能 | 核心指标 |
|------|------|---------|
| 💰 销售分析 | 营收趋势、时段分析、对比分析 | 营业额、客单价、翻台率、同比环比 |
| 👥 客户分析 | RFM 分层、消费偏好、流失预警 | 客户价值、复购率、留存率、生命周期 |
| 🍜 菜品分析 | 销量排行、毛利分析、菜品关联 | 点击率、转化率、毛利率、ABC 分类 |
| 📦 供应链 | 采购分析、库存优化、损耗分析 | 采购成本、库存周转率、损耗率 |
| 👨‍🍳 员工分析 | 绩效分析、排班优化、服务质量 | 服务效率、客户满意度、人效 |
| 🎯 营销分析 | 促销效果、优惠券分析、会员分析 | ROI、转化率、客单价提升 |
| 📈 预测分析 | 销量预测、客流预测、需求预测 | MAPE、预测准确率 |
| 🤖 智能推荐 | 菜品推荐、个性化营销 | 推荐准确率、点击率 |

---

## 🚀 快速开始 | Quick Start

```bash
git clone https://github.com/Windyhhh/Restaurant-BigData-Analytics.git
cd Restaurant-BigData-Analytics

# 1. 启动大数据环境
docker-compose up -d hadoop hive spark mysql redis

# 2. 初始化数据库和数据表
bash scripts/init_db.sh

# 3. 导入示例数据
bash scripts/import_sample_data.sh

# 4. 运行 Spark 数据处理任务
spark-submit --master yarn jobs/sales_analysis.py
spark-submit --master yarn jobs/customer_analysis.py
spark-submit --master yarn jobs/dish_analysis.py

# 5. 训练推荐模型
python models/train_recommendation.py

# 6. 训练预测模型
python models/train_forecast.py

# 7. 启动后端 API
cd backend
pip install -r requirements.txt
python app.py --port 5000

# 8. 启动前端
cd ../frontend
npm install
npm run dev

# 9. 访问系统
# 前端看板: http://localhost:5173
# API 文档: http://localhost:5000/api/docs
```

---

## 📂 项目结构 | Project Structure

```
Restaurant-BigData-Analytics/
├── backend/                    # Flask 后端
│   ├── app.py                 # 应用入口
│   ├── config.py              # 配置
│   ├── api/                   # API 路由
│   │   ├── sales.py           # 销售分析
│   │   ├── customer.py        # 客户分析
│   │   ├── dish.py            # 菜品分析
│   │   ├── supply_chain.py    # 供应链
│   │   ├── employee.py        # 员工分析
│   │   ├── marketing.py       # 营销分析
│   │   ├── forecast.py        # 预测分析
│   │   └── recommendation.py  # 智能推荐
│   ├── services/              # 业务逻辑
│   │   ├── sales_service.py
│   │   ├── customer_service.py
│   │   ├── recommendation_service.py
│   │   └── forecast_service.py
│   ├── models/                # 数据模型
│   ├── db/                    # 数据库连接
│   └── requirements.txt
├── frontend/                   # Vue 3 前端
│   ├── src/
│   │   ├── views/              # 页面
│   │   │   ├── Dashboard.vue   # 经营总览
│   │   │   ├── Sales.vue       # 销售分析
│   │   │   ├── Customer.vue    # 客户分析
│   │   │   ├── Dish.vue        # 菜品分析
│   │   │   ├── SupplyChain.vue # 供应链
│   │   │   ├── Employee.vue    # 员工分析
│   │   │   ├── Marketing.vue   # 营销分析
│   │   │   ├── Forecast.vue    # 预测分析
│   │   │   └── Recommendation.vue # 智能推荐
│   │   ├── components/         # 组件
│   │   │   ├── charts/         # 图表组件
│   │   │   ├── KpiCard.vue
│   │   │   └── DataTable.vue
│   │   ├── api/                # API 调用
│   │   ├── store/              # Pinia
│   │   └── router/             # 路由
│   └── package.json
├── jobs/                       # Spark 数据处理任务
│   ├── sales_analysis.py       # 销售分析
│   ├── customer_analysis.py    # 客户分析 (RFM)
│   ├── dish_analysis.py        # 菜品分析
│   ├── supply_chain_analysis.py # 供应链分析
│   ├── employee_analysis.py    # 员工分析
│   ├── marketing_analysis.py   # 营销分析
│   └── etl/                    # ETL 任务
│       ├── data_cleaning.py    # 数据清洗
│       ├── data_integration.py # 数据集成
│       └── data_aggregation.py # 数据聚合
├── models/                     # 机器学习模型
│   ├── train_recommendation.py # 推荐模型训练
│   ├── train_forecast.py       # 预测模型训练
│   ├── recommendation/         # 推荐算法
│   │   ├── collaborative_filtering.py # 协同过滤
│   │   ├── content_based.py    # 基于内容
│   │   └── hybrid.py           # 混合推荐
│   ├── forecast/               # 预测算法
│   │   ├── arima.py            # ARIMA
│   │   ├── lstm.py             # LSTM
│   │   └── prophet.py          # Prophet
│   └── customer_segmentation/  # 客户分群
│       ├── rfm.py              # RFM 模型
│       └── kmeans.py           # K-Means 聚类
├── sql/                        # Hive/MySQL SQL 脚本
│   ├── ddl/                    # 建表语句
│   ├── dml/                    # 数据查询
│   └── analytics/              # 分析查询
├── data/                       # 示例数据
│   ├── orders.csv
│   ├── customers.csv
│   ├── dishes.csv
│   └── inventory.csv
├── scripts/                    # 运维脚本
│   ├── init_db.sh
│   ├── import_sample_data.sh
│   ├── run_all_jobs.sh
│   └── deploy.sh
├── docker-compose.yml          # Docker 编排
└── README.md
```

---

## 🔬 核心分析 | Core Analytics

### RFM 客户分层 | RFM Customer Segmentation

```python
# models/customer_segmentation/rfm.py - RFM 客户价值分析
import pandas as pd
import numpy as np
from datetime import datetime

class RFMAnalyzer:
    """RFM 客户价值分析模型"""
    
    def __init__(self, reference_date=None):
        self.reference_date = reference_date or datetime.now()
    
    def calculate_rfm(self, orders_df):
        """计算 RFM 指标
        
        R (Recency): 最近一次消费距今天数
        F (Frequency): 消费频率
        M (Monetary): 消费金额
        """
        # 确保日期格式
        orders_df['order_date'] = pd.to_datetime(orders_df['order_date'])
        
        # 按客户聚合
        rfm = orders_df.groupby('customer_id').agg({
            'order_date': lambda x: (self.reference_date - x.max()).days,  # R
            'order_id': 'count',  # F
            'total_amount': 'sum'  # M
        }).rename(columns={
            'order_date': 'recency',
            'order_id': 'frequency',
            'total_amount': 'monetary'
        })
        
        return rfm
    
    def score_rfm(self, rfm_df, quantiles=5):
        """RFM 打分 (1-5分)"""
        rfm_scored = rfm_df.copy()
        
        # R: 越小越好 (最近消费)，反向打分
        rfm_scored['R_score'] = pd.qcut(
            rfm_scored['recency'], q=quantiles, labels=range(quantiles, 0, -1)
        ).astype(int)
        
        # F: 越大越好
        rfm_scored['F_score'] = pd.qcut(
            rfm_scored['frequency'].rank(method='first'), q=quantiles, labels=range(1, quantiles+1)
        ).astype(int)
        
        # M: 越大越好
        rfm_scored['M_score'] = pd.qcut(
            rfm_scored['monetary'], q=quantiles, labels=range(1, quantiles+1)
        ).astype(int)
        
        # 综合得分
        rfm_scored['RFM_score'] = (
            rfm_scored['R_score'] * 100 + 
            rfm_scored['F_score'] * 10 + 
            rfm_scored['M_score']
        )
        
        return rfm_scored
    
    def segment_customers(self, rfm_scored):
        """客户分群"""
        def assign_segment(row):
            r, f, m = row['R_score'], row['F_score'], row['M_score']
            
            if r >= 4 and f >= 4 and m >= 4:
                return '重要价值客户'  # 高价值、高活跃、高消费
            elif r >= 4 and f <= 2 and m >= 4:
                return '重要发展客户'  # 高价值、低活跃、高消费
            elif r <= 2 and f >= 4 and m >= 4:
                return '重要保持客户'  # 低价值、高活跃、高消费 (需召回)
            elif r <= 2 and f <= 2 and m >= 4:
                return '重要挽留客户'  # 低价值、低活跃、高消费 (即将流失)
            elif r >= 4 and f >= 4 and m <= 2:
                return '一般价值客户'  # 高价值、高活跃、低消费
            elif r >= 4 and f <= 2 and m <= 2:
                return '一般发展客户'  # 新客户
            elif r <= 2 and f >= 4 and m <= 2:
                return '一般保持客户'  # 老客户但消费低
            else:
                return '一般挽留客户'  # 低价值客户
        
        rfm_scored['segment'] = rfm_scored.apply(assign_segment, axis=1)
        return rfm_scored
    
    def generate_strategy(self, segment):
        """针对不同客户群体的营销策略"""
        strategies = {
            '重要价值客户': {
                '策略': 'VIP 专属服务',
                '措施': ['专属客户经理', '优先预订权', '定制化菜品', '生日专属礼品'],
                '目标': '提升忠诚度，维持高消费'
            },
            '重要发展客户': {
                '策略': '提升消费频率',
                '措施': ['频次奖励', '套餐推荐', '会员日活动', '消费满赠'],
                '目标': '从低频转为高频'
            },
            '重要保持客户': {
                '策略': '流失预警与召回',
                '措施': ['专属优惠券', '新品试吃邀请', '电话回访', '个性化推荐'],
                '目标': '唤醒沉睡客户，恢复消费'
            },
            '重要挽留客户': {
                '策略': '紧急挽回',
                '措施': ['大额优惠券', '一对一关怀', '满意度调查', '特殊礼遇'],
                '目标': '防止高价值客户流失'
            },
            '一般价值客户': {
                '策略': '提升客单价',
                '措施': ['高毛利菜品推荐', '加购优惠', '套餐升级', '酒水推荐'],
                '目标': '从低消费转为高消费'
            },
            '一般发展客户': {
                '策略': '培养消费习惯',
                '措施': ['新人礼包', '首单优惠', '签到奖励', '消费引导'],
                '目标': '新客户转化为活跃客户'
            },
            '一般保持客户': {
                '策略': '提升消费金额',
                '措施': ['满减活动', '组合套餐', '会员积分加倍', '限时特惠'],
                '目标': '提升客单价'
            },
            '一般挽留客户': {
                '策略': '低成本维护',
                '措施': ['群发优惠券', '节日问候', '新品推送', '清理策略'],
                '目标': '筛选有价值客户，降低维护成本'
            }
        }
        return strategies.get(segment, {})
```

### 菜品关联分析 | Dish Association Analysis

```python
# jobs/dish_analysis.py - 菜品关联规则挖掘 (Apriori)
from pyspark.sql import SparkSession
from pyspark.ml.fpm import FPGrowth
from pyspark.sql.functions import col, collect_list, desc

class DishAssociationAnalyzer:
    """菜品关联分析 (购物篮分析)"""
    
    def __init__(self, spark):
        self.spark = spark
    
    def prepare_data(self, orders_df):
        """准备购物篮数据"""
        # 按订单聚合菜品
        baskets = orders_df.groupBy('order_id').agg(
            collect_list('dish_name').alias('items')
        )
        return baskets
    
    def mine_association_rules(self, baskets, min_support=0.05, min_confidence=0.3):
        """挖掘关联规则"""
        # FP-Growth 算法
        fp = FPGrowth(
            itemsCol='items',
            minSupport=min_support,
            minConfidence=min_confidence
        )
        model = fp.fit(baskets)
        
        # 频繁项集
        freq_itemsets = model.freqItemsets.orderBy(desc('freq'))
        
        # 关联规则
        association_rules = model.associationRules.orderBy(desc('confidence'))
        
        return freq_itemsets, association_rules
    
    def generate_recommendations(self, association_rules, top_n=10):
        """生成菜品推荐"""
        recommendations = []
        
        for rule in association_rules.collect():
            antecedent = rule['antecedent']  # 前项 (已点菜品)
            consequent = rule['consequent']    # 后项 (推荐菜品)
            confidence = rule['confidence']    # 置信度
            lift = rule['lift']                # 提升度
            
            # 只推荐高置信度、高提升度的规则
            if confidence >= 0.4 and lift >= 1.5:
                recommendations.append({
                    'if_order': antecedent,
                    'recommend': consequent,
                    'confidence': round(confidence, 3),
                    'lift': round(lift, 3),
                    'strategy': '套餐组合推荐' if len(antecedent) >= 2 else '加购推荐'
                })
        
        return sorted(recommendations, key=lambda x: x['confidence'], reverse=True)[:top_n]
    
    def optimize_menu(self, freq_itemsets, sales_data, profit_data):
        """菜单优化建议"""
        # 1. 明星菜品 (高销量 + 高利润)
        # 2. 问题菜品 (高销量 + 低利润)
        # 3. 潜力菜品 (低销量 + 高利润)
        # 4. 淘汰菜品 (低销量 + 低利润)
        
        menu_analysis = sales_data.join(profit_data, on='dish_name')
        
        # 计算销量和利润的百分位
        menu_analysis = menu_analysis.withColumn(
            'sales_percentile', 
            # 计算百分位...
        )
        
        return menu_analysis
```

### 销量预测 | Sales Forecasting

```python
# models/forecast/lstm.py - LSTM 销量预测
import torch
import torch.nn as nn
import numpy as np
from sklearn.preprocessing import MinMaxScaler

class LSTMForecaster(nn.Module):
    """基于 LSTM 的销量预测模型"""
    
    def __init__(self, input_dim=1, hidden_dim=64, num_layers=2, output_dim=1, dropout=0.2):
        super().__init__()
        
        self.hidden_dim = hidden_dim
        self.num_layers = num_layers
        
        # LSTM 层
        self.lstm = nn.LSTM(
            input_size=input_dim,
            hidden_size=hidden_dim,
            num_layers=num_layers,
            batch_first=True,
            dropout=dropout
        )
        
        # 注意力机制
        self.attention = nn.Sequential(
            nn.Linear(hidden_dim, hidden_dim),
            nn.Tanh(),
            nn.Linear(hidden_dim, 1)
        )
        
        # 全连接输出层
        self.fc = nn.Sequential(
            nn.Linear(hidden_dim, hidden_dim // 2),
            nn.ReLU(),
            nn.Dropout(dropout),
            nn.Linear(hidden_dim // 2, output_dim)
        )
    
    def forward(self, x):
        """
        Args:
            x: [batch_size, seq_len, input_dim]
        Returns:
            prediction: [batch_size, output_dim]
        """
        # LSTM 前向传播
        lstm_out, (h_n, c_n) = self.lstm(x)
        
        # 注意力加权
        attention_weights = torch.softmax(self.attention(lstm_out), dim=1)
        context = torch.sum(attention_weights * lstm_out, dim=1)
        
        # 全连接预测
        prediction = self.fc(context)
        
        return prediction
    
    def predict(self, data, seq_len=30, days=7):
        """预测未来销量"""
        self.eval()
        predictions = []
        current_seq = data[-seq_len:].copy()
        
        with torch.no_grad():
            for _ in range(days):
                x = torch.FloatTensor(current_seq).unsqueeze(0).unsqueeze(-1)
                pred = self.forward(x).item()
                predictions.append(pred)
                # 更新序列
                current_seq = np.append(current_seq[1:], pred)
        
        return predictions
```

---

## 📊 经营看板示例 | Dashboard Example

```
┌─────────────────────────────────────────────────────────────────────┐
│  🍽️ 餐厅经营大数据分析系统                          📅 2024-01-15    │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐              │
│  │ 今日营业额 │ │ 客单价   │ │ 翻台率   │ │ 会员占比  │              │
│  │ ¥28,560  │ │ ¥85.2    │ │ 3.2 次   │ │ 42.5%    │              │
│  │ ↑12.3%   │ │ ↑5.1%    │ │ ↑0.3     │ │ ↑3.2%    │              │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘              │
│                                                                     │
│  ┌─────────────────────────────┐ ┌─────────────────────────────┐  │
│  │ 📈 营业额趋势 (近30天)       │ │ 👥 客户价值分布 (RFM)        │  │
│  │                             │ │                             │  │
│  │  ████████████████████░░░░   │ │  重要价值客户  15% (高价值)  │  │
│  │  ██████████████████████░░   │ │  重要发展客户  12%           │  │
│  │  ████████████████████████   │ │  重要保持客户  10% (需召回)  │  │
│  │                             │ │  重要挽留客户   8% (高风险)   │  │
│  │  周一  周三  周五  周日      │ │  一般价值客户  20%           │  │
│  │                             │ │  一般发展客户  15%           │  │
│  └─────────────────────────────┘ │  一般保持客户  12%           │  │
│                                    │  一般挽留客户   8%           │  │
│  ┌─────────────────────────────┐ └─────────────────────────────┘  │
│  │ 🍜 菜品销量 Top 10           │                                    │
│  │                             │ ┌─────────────────────────────┐  │
│  │  1. 招牌红烧肉  ████████ 856│ │ 📦 库存预警                  │  │
│  │  2. 宫保鸡丁    ██████  723 │ │                             │  │
│  │  3. 水煮鱼      █████   654 │ │  ⚠️ 牛肉库存低于安全线       │  │
│  │  4. 麻婆豆腐    ████    512 │ │     当前: 15kg / 安全: 50kg │  │
│  │  5. 糖醋里脊    ████    489 │ │     预计可用: 2天            │  │
│  │  ...                         │ │                             │  │
│  │                             │ │  ⚠️ 青菜库存偏低              │  │
│  └─────────────────────────────┘ │     当前: 20kg / 安全: 80kg │  │
│                                    └─────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 🎯 应用场景 | Use Cases

- 🍽️ **连锁餐饮**：多门店经营数据分析和统一管理
- 🏪 **单体餐厅**：单店经营优化和客户运营
- 🍕 **快餐品牌**：标准化运营和供应链优化
- ☕ **咖啡茶饮**：新品研发和客户偏好分析
- 🏨 **酒店餐饮**：宴会厅和餐厅营收分析
- 🛒 **生鲜零售**：需求预测和库存管理
- 📊 **餐饮SaaS**：为餐饮企业提供数据分析服务
- 🎓 **教学项目**：大数据分析、推荐系统、机器学习教学

---

## 📚 参考文献 | References

- Han, J., et al. "Mining Frequent Patterns without Candidate Generation." SIGMOD 2000.
- "RFM Analysis: A Complete Guide." 2023.
- Hochreiter, S., Schmidhuber, J. "Long Short-Term Memory." Neural Computation 1997.
- "Restaurant Analytics: Using Data to Improve Operations." 2022.
- Sarwar, B., et al. "Item-Based Collaborative Filtering Recommendation Algorithms." WWW 2001.

---

## 📄 License

MIT License — 自由使用、修改和分发。

---

> 💡 **大数据 + 机器学习的餐厅经营智能分析系统，Star ⭐ 用数据驱动餐饮增长！**
