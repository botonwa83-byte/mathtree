import Foundation

// MARK: - 统计与统计案例专题
// 目标: 覆盖方差/标准差、频率分布、分层抽样、线性回归、独立性检验、
//       正态分布、离散型分布列与期望方差, 新高考大题高频考点。

extension SampleData {
    static let statisticsProblems: [Problem] = [
        statProblem(
            id: "stat_001",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["variance"],
            content: "数据 1,2,3,4,5 的方差为？",
            contentLatex: #"\text{数据}1,2,3,4,5\ \text{的方差}S^2=?"#,
            answer: "2",
            difficulty: 0.40,
            averageTime: 80,
            hints: ["先求平均数", "方差=Σ(xᵢ-x̄)²/n", "对称数据"],
            standardSteps: [
                statStep(1, "平均数", #"\bar x=\frac{1+2+3+4+5}{5}=3"#),
                statStep(2, "方差", #"S^2=\frac{(-2)^2+(-1)^2+0+1^2+2^2}{5}=\frac{10}{5}=2"#)
            ],
            shortcutSteps: [
                statStep(1, "等差方差公式秒杀", #"\text{公差}d=1\text{的}n=5\text{项等差: }S^2=\frac{(n^2-1)d^2}{12}=\frac{24}{12}=2"#)
            ],
            keyInsight: "方差衡量数据离散程度，先求均值再算偏差平方均值。",
            shortcutInsight: "连续等差数列方差=(n²-1)d²/12，直接代。",
            weapon: "方差定义/等差方差公式",
            timeRatio: 2.0,
            tags: ["统计", "方差", "必考", "核心"]
        ),

        statProblem(
            id: "stat_002",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["variance", "linear_transform"],
            content: "已知数据 x₁,…,xₙ 的平均数为5，方差为2。则数据 2x₁+1,…,2xₙ+1 的平均数与方差分别为？",
            contentLatex: #"\bar x=5,S_x^2=2;\ y_i=2x_i+1,\ \bar y,S_y^2=?"#,
            answer: "平均数11，方差8",
            difficulty: 0.48,
            averageTime: 90,
            hints: ["E(ax+b)=aE(x)+b", "D(ax+b)=a²D(x)", "方差不受平移影响"],
            standardSteps: [
                statStep(1, "平均数变换", #"\bar y=2\bar x+1=2\cdot5+1=11"#),
                statStep(2, "方差变换", #"S_y^2=2^2\cdot S_x^2=4\cdot2=8"#)
            ],
            shortcutSteps: [
                statStep(1, "线性变换公式秒杀", #"\bar y=a\bar x+b,\ S_y^2=a^2 S_x^2"#)
            ],
            keyInsight: "线性变换y=ax+b下均值随a,b线性变，方差只随a²变(与b无关)。",
            shortcutInsight: "记住D(ax+b)=a²D(x)，平移不改变方差。",
            weapon: "方差的线性变换性质",
            timeRatio: 1.8,
            tags: ["统计", "方差", "线性变换", "必考"]
        ),

        statProblem(
            id: "stat_003",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["stratified_sampling"],
            content: "某校高一、高二、高三人数比为 4:3:3，用分层抽样抽取容量为50的样本，求各年级抽取人数。",
            contentLatex: #"\text{人数比}4:3:3,\ \text{样本容量}50"#,
            answer: "20,15,15",
            difficulty: 0.42,
            averageTime: 80,
            hints: ["按比例分配", "总份数4+3+3=10", "每份50/10=5"],
            standardSteps: [
                statStep(1, "总份数", #"4+3+3=10"#),
                statStep(2, "每份", #"50\div10=5\text{人}"#),
                statStep(3, "分配", #"4\times5=20,\ 3\times5=15,\ 3\times5=15"#)
            ],
            shortcutSteps: [
                statStep(1, "比例秒杀", #"50\times\frac{4}{10},\frac{3}{10},\frac{3}{10}=20,15,15"#)
            ],
            keyInsight: "分层抽样各层抽取比例与各层占总体比例相同。",
            shortcutInsight: "样本容量×各层占比直接给出各层人数。",
            weapon: "分层抽样比例",
            timeRatio: 1.6,
            tags: ["统计", "分层抽样", "必考"]
        ),

        statProblem(
            id: "stat_004",
            type: .calculation,
            tier: 4,
            formulaIds: ["frequency_histogram"],
            content: "频率分布直方图中,各小矩形面积分别为0.1,0.2,a,0.3,0.1,求a及中位数所在区间(组距均为10,起始20)。",
            contentLatex: #"\text{频率}0.1,0.2,a,0.3,0.1,\ a=?,\ \text{中位数区间}?"#,
            answer: "a=0.3，中位数在[40,50)",
            difficulty: 0.56,
            averageTime: 120,
            hints: ["所有频率和为1", "累计频率到0.5确定中位数区间"],
            standardSteps: [
                statStep(1, "频率和为1", #"0.1+0.2+a+0.3+0.1=1\Rightarrow a=0.3"#),
                statStep(2, "累计频率", #"[20,30):0.1,\ [30,40):0.3,\ [40,50):0.6"#),
                statStep(3, "中位数", #"\text{累计达}0.5\text{落在}[40,50)"#)
            ],
            shortcutSteps: [
                statStep(1, "补1法秒杀", #"a=1-0.7=0.3"#),
                statStep(2, "累计过半定区间", #"0.3<0.5<0.6\Rightarrow[40,50)"#)
            ],
            keyInsight: "直方图所有频率(面积)之和为1，中位数处累计频率=0.5。",
            shortcutInsight: "缺失频率=1-其余之和；累计频率首次≥0.5的区间含中位数。",
            weapon: "频率归一+累计频率",
            timeRatio: 2.0,
            tags: ["统计", "频率分布", "中位数", "必考"]
        ),

        statProblem(
            id: "stat_005",
            type: .calculation,
            tier: 4,
            formulaIds: ["linear_regression"],
            content: "已知5组数据(x,y),Σx=15,Σy=20,Σxy=70,Σx²=55,求线性回归方程ŷ=b̂x+â。",
            contentLatex: #"n=5,\sum x=15,\sum y=20,\sum xy=70,\sum x^2=55"#,
            answer: "ŷ=x+1",
            difficulty: 0.64,
            averageTime: 150,
            hints: ["x̄=3,ȳ=4", "b̂=(Σxy-nx̄ȳ)/(Σx²-nx̄²)", "â=ȳ-b̂x̄"],
            standardSteps: [
                statStep(1, "均值", #"\bar x=3,\ \bar y=4"#),
                statStep(2, "斜率", #"\hat b=\frac{\sum xy-n\bar x\bar y}{\sum x^2-n\bar x^2}=\frac{70-5\cdot12}{55-5\cdot9}=\frac{10}{10}=1"#),
                statStep(3, "截距", #"\hat a=\bar y-\hat b\bar x=4-1\cdot3=1"#),
                statStep(4, "方程", #"\hat y=x+1"#)
            ],
            shortcutSteps: [
                statStep(1, "公式直代秒杀", #"\hat b=\frac{70-60}{55-45}=1,\ \hat a=4-3=1\Rightarrow\hat y=x+1"#)
            ],
            keyInsight: "回归直线必过样本中心(x̄,ȳ)，斜率由最小二乘公式给出。",
            shortcutInsight: "先算x̄,ȳ，代入b̂公式，截距由过中心点反推。",
            weapon: "最小二乘回归公式",
            timeRatio: 2.2,
            tags: ["统计", "线性回归", "必考", "核心"]
        ),

        statProblem(
            id: "stat_006",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["regression", "center_point"],
            content: "回归直线 ŷ=2x+1 一定经过的点，已知 x̄=3，求该点坐标。",
            contentLatex: #"\hat y=2x+1,\ \bar x=3,\ \text{必过点}?"#,
            answer: "(3,7)",
            difficulty: 0.38,
            averageTime: 60,
            hints: ["回归直线过样本中心(x̄,ȳ)", "ȳ=2x̄+1"],
            standardSteps: [
                statStep(1, "样本中心", #"\text{回归直线必过}(\bar x,\bar y)"#),
                statStep(2, "求ȳ", #"\bar y=2\cdot3+1=7"#),
                statStep(3, "结论", #"(3,7)"#)
            ],
            shortcutSteps: [
                statStep(1, "中心点秒杀", #"(\bar x,\bar y)=(3,2\cdot3+1)=(3,7)"#)
            ],
            keyInsight: "回归方程的核心性质：直线恒过样本中心点。",
            shortcutInsight: "代x̄入方程即得ȳ，无需其他数据。",
            weapon: "回归直线过样本中心",
            timeRatio: 1.5,
            tags: ["统计", "回归", "样本中心", "必考"]
        ),

        statProblem(
            id: "stat_007",
            type: .calculation,
            tier: 5,
            formulaIds: ["independence_test"],
            content: "2×2列联表:a=40,b=10,c=20,d=30(n=100)。计算K²并判断在α=0.01(临界值6.635)下是否有关。",
            contentLatex: #"K^2=\frac{n(ad-bc)^2}{(a+b)(c+d)(a+c)(b+d)}"#,
            answer: "K²≈16.67>6.635，有关",
            difficulty: 0.72,
            averageTime: 180,
            hints: ["代入K²公式", "ad-bc=40·30-10·20", "比较临界值"],
            standardSteps: [
                statStep(1, "ad-bc", #"40\cdot30-10\cdot20=1200-200=1000"#),
                statStep(2, "分母", #"(a+b)(c+d)(a+c)(b+d)=50\cdot50\cdot60\cdot40"#),
                statStep(3, "代入", #"K^2=\frac{100\cdot1000^2}{50\cdot50\cdot60\cdot40}=\frac{10^8}{6\times10^6}\approx16.67"#),
                statStep(4, "判断", #"16.67>6.635\Rightarrow\text{有99%把握认为相关}"#)
            ],
            shortcutSteps: [
                statStep(1, "公式机械代入", #"K^2=\frac{100(1000)^2}{6000000}\approx16.7"#),
                statStep(2, "比临界值", #">6.635\Rightarrow\text{有关}"#)
            ],
            keyInsight: "独立性检验通过K²(χ²)统计量与临界值比较判断关联。",
            shortcutInsight: "记牢K²公式，先算ad-bc再套，最后比临界值。",
            weapon: "K²独立性检验",
            timeRatio: 2.0,
            tags: ["统计", "独立性检验", "压轴", "核心"]
        ),

        statProblem(
            id: "stat_008",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["normal_distribution"],
            content: "随机变量 X~N(2,σ²)，若 P(X<1)=0.2，求 P(1<X<3)。",
            contentLatex: #"X\sim N(2,\sigma^2),\ P(X<1)=0.2,\ P(1<X<3)=?"#,
            answer: "0.6",
            difficulty: 0.58,
            averageTime: 110,
            hints: ["正态对称轴x=2", "P(X>3)=P(X<1)=0.2", "中间=1-两尾"],
            standardSteps: [
                statStep(1, "对称性", #"\text{关于}x=2\text{对称},\ P(X>3)=P(X<1)=0.2"#),
                statStep(2, "中间概率", #"P(1<X<3)=1-0.2-0.2=0.6"#)
            ],
            shortcutSteps: [
                statStep(1, "对称秒杀", #"1-2\times0.2=0.6"#)
            ],
            keyInsight: "正态分布关于均值μ对称，对称区间概率相等。",
            shortcutInsight: "P(1<X<3)=1-2P(X<1)，利用关于μ=2的对称性。",
            weapon: "正态分布对称性",
            timeRatio: 2.0,
            tags: ["统计", "正态分布", "对称性", "必考"]
        ),

        statProblem(
            id: "stat_009",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["normal_distribution", "3sigma"],
            content: "X~N(100,100)，已知P(|X-μ|<σ)≈0.6827，求P(90<X<110)。",
            contentLatex: #"X\sim N(100,100),\ P(90<X<110)=?"#,
            answer: "0.6827",
            difficulty: 0.46,
            averageTime: 80,
            hints: ["σ=√100=10", "90=μ-σ,110=μ+σ", "即P(|X-μ|<σ)"],
            standardSteps: [
                statStep(1, "标准差", #"\sigma=\sqrt{100}=10"#),
                statStep(2, "区间识别", #"(90,110)=(\mu-\sigma,\mu+\sigma)"#),
                statStep(3, "结论", #"P=0.6827"#)
            ],
            shortcutSteps: [
                statStep(1, "3σ原则秒杀", #"(\mu-\sigma,\mu+\sigma)\Rightarrow0.6827"#)
            ],
            keyInsight: "正态分布的3σ原则给出μ±σ,μ±2σ,μ±3σ区间的固定概率。",
            shortcutInsight: "识别区间端点是μ±kσ，直接读取对应概率。",
            weapon: "正态3σ原则",
            timeRatio: 1.8,
            tags: ["统计", "正态分布", "3σ", "必考"]
        ),

        statProblem(
            id: "stat_010",
            type: .calculation,
            tier: 4,
            formulaIds: ["distribution_table", "expectation"],
            content: "袋中3红2白共5球,任取2球,设X为取到的红球数,求X的分布列与E(X)。",
            contentLatex: #"3\text{红}2\text{白取}2\text{球},\ X=\text{红球数},\ E(X)=?"#,
            answer: "E(X)=6/5",
            difficulty: 0.62,
            averageTime: 150,
            hints: ["超几何分布", "X取0,1,2", "用组合数算概率"],
            standardSteps: [
                statStep(1, "P(X=0)", #"\frac{C_2^2}{C_5^2}=\frac{1}{10}"#),
                statStep(2, "P(X=1)", #"\frac{C_3^1 C_2^1}{C_5^2}=\frac{6}{10}"#),
                statStep(3, "P(X=2)", #"\frac{C_3^2}{C_5^2}=\frac{3}{10}"#),
                statStep(4, "期望", #"E(X)=0\cdot\tfrac1{10}+1\cdot\tfrac6{10}+2\cdot\tfrac3{10}=\tfrac{12}{10}=\tfrac65"#)
            ],
            shortcutSteps: [
                statStep(1, "超几何期望公式秒杀", #"E(X)=n\cdot\frac{M}{N}=2\cdot\frac{3}{5}=\frac65"#)
            ],
            keyInsight: "不放回抽取的红球数服从超几何分布。",
            shortcutInsight: "超几何分布E(X)=n·M/N，免列分布列直接求期望。",
            weapon: "超几何分布",
            timeRatio: 2.4,
            tags: ["统计", "分布列", "期望", "超几何", "核心"]
        ),

        statProblem(
            id: "stat_011",
            type: .calculation,
            tier: 4,
            formulaIds: ["binomial_distribution", "expectation", "variance"],
            content: "X~B(10,0.4),求E(X)与D(X)。",
            contentLatex: #"X\sim B(10,0.4),\ E(X),D(X)=?"#,
            answer: "E(X)=4, D(X)=2.4",
            difficulty: 0.40,
            averageTime: 70,
            hints: ["E(X)=np", "D(X)=np(1-p)"],
            standardSteps: [
                statStep(1, "期望", #"E(X)=np=10\cdot0.4=4"#),
                statStep(2, "方差", #"D(X)=np(1-p)=10\cdot0.4\cdot0.6=2.4"#)
            ],
            shortcutSteps: [
                statStep(1, "二项公式秒杀", #"E=np=4,\ D=npq=2.4"#)
            ],
            keyInsight: "二项分布期望np、方差np(1-p)是必背结论。",
            shortcutInsight: "直接套E=np、D=npq两个公式。",
            weapon: "二项分布期望方差",
            timeRatio: 1.5,
            tags: ["统计", "二项分布", "期望", "方差", "必考"]
        ),

        statProblem(
            id: "stat_012",
            type: .calculation,
            tier: 5,
            formulaIds: ["expectation", "decision"],
            content: "某商品进价8元,售价10元,当天卖不出按6元处理。日需求X(件)的分布:P(X=10)=0.3,P(X=20)=0.5,P(X=30)=0.2。若进货20件,求当日利润Y的期望。",
            contentLatex: #"\text{进价}8,\text{售}10,\text{滞销}6,\ \text{进}20\text{件},\ E(Y)=?"#,
            answer: "E(Y)=28元",
            difficulty: 0.74,
            averageTime: 200,
            hints: ["分需求情形算Y", "X=10时有10件滞销", "X≥20时全部售出"],
            standardSteps: [
                statStep(1, "X=10", #"\text{售10件+滞销10件}:\ Y=10(10-8)+10(6-8)=20-20=0"#),
                statStep(2, "X=20", #"\text{全售}:\ Y=20\cdot2=40"#),
                statStep(3, "X=30", #"\text{只能售20}:\ Y=20\cdot2=40"#),
                statStep(4, "期望", #"E(Y)=0\cdot0.3+40\cdot0.5+40\cdot0.2=28\text{元}"#)
            ],
            shortcutSteps: [
                statStep(1, "分段利润秒杀", #"Y\in\{0,40,40\},\ E(Y)=40\cdot0.7=28"#)
            ],
            keyInsight: "决策类期望题需分需求区间表达利润再加权。",
            shortcutInsight: "需求≥进货时利润封顶,合并同值情形简化求和。",
            weapon: "分段期望决策",
            timeRatio: 1.8,
            tags: ["统计", "期望", "决策", "压轴"]
        ),

        statProblem(
            id: "stat_013",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["expectation_linear"],
            content: "已知E(X)=3,D(X)=2,设Y=2X-1,求E(Y)与D(Y)。",
            contentLatex: #"E(X)=3,D(X)=2,\ Y=2X-1,\ E(Y),D(Y)=?"#,
            answer: "E(Y)=5, D(Y)=8",
            difficulty: 0.42,
            averageTime: 70,
            hints: ["E(aX+b)=aE(X)+b", "D(aX+b)=a²D(X)"],
            standardSteps: [
                statStep(1, "期望", #"E(Y)=2E(X)-1=2\cdot3-1=5"#),
                statStep(2, "方差", #"D(Y)=2^2 D(X)=4\cdot2=8"#)
            ],
            shortcutSteps: [
                statStep(1, "线性公式秒杀", #"E(Y)=2\cdot3-1=5,\ D(Y)=4\cdot2=8"#)
            ],
            keyInsight: "随机变量线性变换的期望与方差性质同数据情形。",
            shortcutInsight: "E线性、D随系数平方变化、常数不影响方差。",
            weapon: "期望方差线性性质",
            timeRatio: 1.5,
            tags: ["统计", "期望", "方差", "线性", "必考"]
        ),

        statProblem(
            id: "stat_014",
            type: .calculation,
            tier: 5,
            formulaIds: ["conditional_probability", "total_probability"],
            content: "某工厂甲乙两线各产50%,次品率分别为2%,3%。任取一件,求它是次品的概率;若已知是次品,求它来自甲线的概率。",
            contentLatex: #"P(\text{甲})=P(\text{乙})=0.5,\ P(D|\text{甲})=0.02,P(D|\text{乙})=0.03"#,
            answer: "P(次品)=0.025; P(甲|次品)=0.4",
            difficulty: 0.72,
            averageTime: 180,
            hints: ["全概率公式", "贝叶斯公式", "P(甲|D)=P(D|甲)P(甲)/P(D)"],
            standardSteps: [
                statStep(1, "全概率", #"P(D)=0.5\cdot0.02+0.5\cdot0.03=0.025"#),
                statStep(2, "贝叶斯", #"P(\text{甲}|D)=\frac{0.5\cdot0.02}{0.025}=\frac{0.01}{0.025}=0.4"#)
            ],
            shortcutSteps: [
                statStep(1, "频率法秒杀", #"\text{设1万件}:\text{甲次}100,\text{乙次}150,\text{共}250"#),
                statStep(2, "比例直出", #"P(\text{甲}|D)=\frac{100}{250}=0.4"#)
            ],
            keyInsight: "全概率求边缘概率,贝叶斯做'由果溯因'。",
            shortcutInsight: "设具体总量把概率化为计数,贝叶斯变成比例,直观秒算。",
            weapon: "全概率+贝叶斯",
            timeRatio: 2.2,
            tags: ["统计", "贝叶斯", "条件概率", "压轴", "核心"]
        ),

        statProblem(
            id: "stat_015",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["median_mode_mean"],
            content: "一组数据:2,3,3,5,7,8,9。求其中位数、众数与平均数。",
            contentLatex: #"2,3,3,5,7,8,9:\ \text{中位数,众数,平均数}?"#,
            answer: "中位数5，众数3，平均数37/7",
            difficulty: 0.36,
            averageTime: 70,
            hints: ["排序后取中间", "出现最多的数", "总和/个数"],
            standardSteps: [
                statStep(1, "中位数", #"\text{7个数,第4个}=5"#),
                statStep(2, "众数", #"3\text{出现2次最多}"#),
                statStep(3, "平均数", #"\frac{2+3+3+5+7+8+9}{7}=\frac{37}{7}"#)
            ],
            shortcutSteps: [
                statStep(1, "三量直读", #"\text{中位}5,\text{众数}3,\bar x=\frac{37}{7}"#)
            ],
            keyInsight: "中位数(位置)、众数(频次)、平均数(总量)三种集中趋势量。",
            shortcutInsight: "已排序数据直接读中位数与众数。",
            weapon: "集中趋势三量",
            timeRatio: 1.5,
            tags: ["统计", "中位数", "众数", "平均数", "基础"]
        ),

        statProblem(
            id: "stat_016",
            type: .calculation,
            tier: 5,
            formulaIds: ["binomial_distribution", "distribution_table"],
            content: "投篮命中率0.8,独立投3次,设命中次数为X,求X的分布列及P(X≥2)。",
            contentLatex: #"p=0.8,\ n=3,\ X\sim B(3,0.8),\ P(X\ge2)=?"#,
            answer: "P(X≥2)=0.896",
            difficulty: 0.60,
            averageTime: 150,
            hints: ["X~B(3,0.8)", "P(X=k)=C₃ᵏ0.8ᵏ0.2³⁻ᵏ", "P(X≥2)=P(2)+P(3)"],
            standardSteps: [
                statStep(1, "分布列", #"P(X=k)=C_3^k 0.8^k 0.2^{3-k}"#),
                statStep(2, "各值", #"P(0)=0.008,P(1)=0.096,P(2)=0.384,P(3)=0.512"#),
                statStep(3, "P(X≥2)", #"0.384+0.512=0.896"#)
            ],
            shortcutSteps: [
                statStep(1, "对立面秒杀", #"P(X\ge2)=1-P(0)-P(1)=1-0.008-0.096=0.896"#)
            ],
            keyInsight: "独立重复试验的成功次数服从二项分布。",
            shortcutInsight: "用对立事件1-P(X≤1)避免多项相加更稳。",
            weapon: "二项分布+对立事件",
            timeRatio: 2.0,
            tags: ["统计", "二项分布", "分布列", "核心"]
        ),

        statProblem(
            id: "stat_017",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["correlation"],
            content: "若两变量相关系数 r=-0.95，描述其相关性的强弱与方向。",
            contentLatex: #"r=-0.95,\ \text{相关性}?"#,
            answer: "强负相关",
            difficulty: 0.34,
            averageTime: 50,
            hints: ["|r|越接近1相关性越强", "r<0为负相关"],
            standardSteps: [
                statStep(1, "看绝对值", #"|r|=0.95\text{接近}1\Rightarrow\text{强相关}"#),
                statStep(2, "看符号", #"r<0\Rightarrow\text{负相关}"#),
                statStep(3, "结论", #"\text{强负相关}"#)
            ],
            shortcutSteps: [
                statStep(1, "符号+大小秒判", #"r=-0.95\Rightarrow\text{强负相关}"#)
            ],
            keyInsight: "相关系数r∈[-1,1]，绝对值定强弱、符号定正负方向。",
            shortcutInsight: "|r|→1强、→0弱；符号即方向。",
            weapon: "相关系数解读",
            timeRatio: 1.4,
            tags: ["统计", "相关系数", "回归", "必考"]
        ),

        statProblem(
            id: "stat_018",
            type: .calculation,
            tier: 5,
            formulaIds: ["expectation", "variance", "comparison"],
            content: "两方案收益X,Y:E(X)=E(Y)=50,D(X)=20,D(Y)=8。从风险角度应选哪个？",
            contentLatex: #"E(X)=E(Y)=50,\ D(X)=20,D(Y)=8,\ \text{选?}"#,
            answer: "选Y(方差小,风险低)",
            difficulty: 0.44,
            averageTime: 70,
            hints: ["期望相同比方差", "方差小→稳定→风险低"],
            standardSteps: [
                statStep(1, "比期望", #"E(X)=E(Y)=50\text{(收益相同)}"#),
                statStep(2, "比方差", #"D(Y)=8<D(X)=20\Rightarrow Y\text{更稳定}"#),
                statStep(3, "结论", #"\text{风险角度选}Y"#)
            ],
            shortcutSteps: [
                statStep(1, "同期望比方差秒杀", #"D(Y)<D(X)\Rightarrow\text{选}Y"#)
            ],
            keyInsight: "期望相同时,方差越小代表波动越小、决策越稳健。",
            shortcutInsight: "决策口诀:期望比大小,平局比方差(求稳选小)。",
            weapon: "期望-方差决策",
            timeRatio: 1.6,
            tags: ["统计", "期望", "方差", "决策"]
        ),

        statProblem(
            id: "stat_019",
            type: .calculation,
            tier: 5,
            formulaIds: ["geometric_distribution", "expectation"],
            content: "射击命中率为p=1/3,直到命中为止。求恰好射击k次的概率及首次命中所需次数X的期望。",
            contentLatex: #"p=\tfrac13,\ P(X=k)=?,\ E(X)=?"#,
            answer: "P(X=k)=(2/3)^(k-1)·(1/3); E(X)=3",
            difficulty: 0.68,
            averageTime: 160,
            hints: ["前k-1次未中第k次中", "几何分布", "E(X)=1/p"],
            standardSteps: [
                statStep(1, "概率", #"P(X=k)=\left(\frac23\right)^{k-1}\cdot\frac13"#),
                statStep(2, "几何分布期望", #"E(X)=\frac1p=\frac{1}{1/3}=3"#)
            ],
            shortcutSteps: [
                statStep(1, "几何分布公式秒杀", #"E(X)=\frac1p=3"#)
            ],
            keyInsight: "重复独立试验中首次成功的次数服从几何分布。",
            shortcutInsight: "几何分布期望E(X)=1/p,直接给出平均所需次数。",
            weapon: "几何分布",
            timeRatio: 2.0,
            tags: ["统计", "几何分布", "期望", "压轴"]
        ),

        statProblem(
            id: "stat_020",
            type: .calculation,
            tier: 5,
            formulaIds: ["expectation", "variance", "fair_game"],
            content: "掷一枚骰子,点数为X。求E(X)与D(X)。",
            contentLatex: #"X=\text{骰子点数},\ E(X),D(X)=?"#,
            answer: "E(X)=3.5, D(X)=35/12",
            difficulty: 0.50,
            averageTime: 110,
            hints: ["均匀分布", "E=(1+…+6)/6", "D=E(X²)-E(X)²"],
            standardSteps: [
                statStep(1, "期望", #"E(X)=\frac{1+2+\cdots+6}{6}=\frac{21}{6}=3.5"#),
                statStep(2, "E(X²)", #"E(X^2)=\frac{1+4+9+16+25+36}{6}=\frac{91}{6}"#),
                statStep(3, "方差", #"D(X)=E(X^2)-[E(X)]^2=\frac{91}{6}-\frac{49}{4}=\frac{35}{12}"#)
            ],
            shortcutSteps: [
                statStep(1, "离散均匀公式秒杀", #"E=\frac{n+1}{2}=3.5,\ D=\frac{n^2-1}{12}=\frac{35}{12}"#)
            ],
            keyInsight: "骰子点数是1~6的离散均匀分布。",
            shortcutInsight: "均匀分布E=(n+1)/2,D=(n²-1)/12,直接代n=6。",
            weapon: "离散均匀分布公式",
            timeRatio: 2.3,
            tags: ["统计", "期望", "方差", "均匀分布", "核心"]
        )
    ]

    // MARK: - 工厂方法
    private static func statStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func statProblem(
        id: String,
        type: ProblemType,
        tier: Int,
        formulaIds: [String],
        content: String,
        contentLatex: String,
        options: [String]? = nil,
        answer: String,
        difficulty: Double,
        averageTime: TimeInterval,
        hints: [String],
        standardSteps: [SolutionStep],
        shortcutSteps: [SolutionStep],
        keyInsight: String,
        shortcutInsight: String,
        weapon: String,
        timeRatio: Double,
        tags: [String],
        gaokaoYear: Int? = nil,
        commonMistakes: [String] = ["方差忘记除以n", "K²公式分母配错", "正态对称区间算反", "超几何与二项混淆"]
    ) -> Problem {
        Problem(
            id: id,
            type: type,
            tier: tier,
            formulaIds: formulaIds,
            content: content,
            contentLatex: contentLatex,
            options: options,
            answer: answer,
            difficulty: difficulty,
            averageTime: averageTime,
            hints: hints,
            solution: SolutionPath(
                steps: standardSteps,
                keyInsight: keyInsight,
                commonMistakes: commonMistakes
            ),
            dualSolution: DualSolution(
                standardMethod: SolutionPath(
                    steps: standardSteps,
                    keyInsight: keyInsight,
                    commonMistakes: commonMistakes
                ),
                descentMethod: SolutionPath(
                    steps: shortcutSteps,
                    keyInsight: shortcutInsight,
                    commonMistakes: []
                ),
                weaponUsed: weapon,
                timeRatio: timeRatio,
                detailedExplanation: "秒杀关键：\(shortcutInsight)"
            ),
            gaokaoYear: gaokaoYear,
            tags: tags
        )
    }
}
