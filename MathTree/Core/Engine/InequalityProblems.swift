import Foundation

// MARK: - 不等式综合压轴专题
// 目标: 用高阶武器(柯西、权方和、切线法、琴生、三角换元)秒杀高中均值不等式题。
// 核心理念: 高阶不等式统一处理低阶最值与恒成立问题。

extension SampleData {
    static let inequalityProblems: [Problem] = [
        ineqProblem(
            id: "ineq_001",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["am_gm", "cauchy_schwarz"],
            content: "已知a>0，b>0，且a+b=1，求1/a+4/b的最小值。",
            contentLatex: #"a>0,\ b>0,\ a+b=1,\quad \frac1a+\frac4b=?_{\min}"#,
            answer: "9",
            difficulty: 0.62,
            averageTime: 120,
            hints: ["1的代换", "(1/a+4/b)(a+b)展开", "权方和不等式"],
            standardSteps: [
                ineqStep(1, "1的代换", #"\frac1a+\frac4b=\left(\frac1a+\frac4b\right)(a+b)"#),
                ineqStep(2, "展开", #"=1+4+\frac{b}{a}+\frac{4a}{b}=5+\frac{b}{a}+\frac{4a}{b}"#),
                ineqStep(3, "均值不等式", #"\frac{b}{a}+\frac{4a}{b}\ge 2\sqrt{4}=4"#),
                ineqStep(4, "取最小值", #"\frac1a+\frac4b\ge 9,\ \text{当}b=2a\text{即}a=\tfrac13,b=\tfrac23\text{时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "权方和秒杀", #"\frac1a+\frac4b=\frac{1^2}{a}+\frac{2^2}{b}\ge\frac{(1+2)^2}{a+b}"#),
                ineqStep(2, "直接出结果", #"=\frac{9}{1}=9"#)
            ],
            keyInsight: "约束a+b=1提示用1的代换把分式凑成均值结构。",
            shortcutInsight: "权方和不等式 Σaᵢ²/bᵢ ≥ (Σaᵢ)²/Σbᵢ 一步出结果，无需展开。",
            weapon: "权方和不等式",
            timeRatio: 3.0,
            tags: ["不等式", "权方和", "最值", "代表题"]
        ),

        ineqProblem(
            id: "ineq_002",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["cauchy_schwarz", "am_gm"],
            content: "已知2x+y=1，x>0，y>0，求2/x+1/y的最小值。",
            contentLatex: #"2x+y=1,\ x>0,\ y>0,\quad \frac2x+\frac1y=?_{\min}"#,
            answer: "9",
            difficulty: 0.64,
            averageTime: 130,
            hints: ["1的代换", "(2/x+1/y)(2x+y)", "权方和形式"],
            standardSteps: [
                ineqStep(1, "1的代换", #"\frac2x+\frac1y=\left(\frac2x+\frac1y\right)(2x+y)"#),
                ineqStep(2, "展开", #"=4+1+\frac{2y}{x}+\frac{2x}{y}=5+\frac{2y}{x}+\frac{2x}{y}"#),
                ineqStep(3, "均值不等式", #"\frac{2y}{x}+\frac{2x}{y}\ge 2\sqrt{4}=4"#),
                ineqStep(4, "结论", #"\frac2x+\frac1y\ge 9,\ x=y=\tfrac13\text{时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "权方和秒杀", #"\frac2x+\frac1y=\frac{2^2}{2x}+\frac{1^2}{y}\ge\frac{(2+1)^2}{2x+y}=9"#)
            ],
            keyInsight: "线性约束下分式最值首选1的代换。",
            shortcutInsight: "把2/x写成2²/(2x)即可直接套权方和。",
            weapon: "权方和不等式",
            timeRatio: 3.2,
            tags: ["不等式", "权方和", "最值", "综合"]
        ),

        ineqProblem(
            id: "ineq_003",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["am_gm"],
            content: "已知x>1，求x+4/(x-1)的最小值。",
            contentLatex: #"x>1,\quad x+\frac{4}{x-1}=?_{\min}"#,
            answer: "5",
            difficulty: 0.50,
            averageTime: 100,
            hints: ["凑配x-1", "x=(x-1)+1", "均值不等式"],
            standardSteps: [
                ineqStep(1, "凑配", #"x+\frac{4}{x-1}=(x-1)+\frac{4}{x-1}+1"#),
                ineqStep(2, "均值不等式", #"(x-1)+\frac{4}{x-1}\ge 2\sqrt{4}=4"#),
                ineqStep(3, "结论", #"\ge 4+1=5,\ x-1=2\text{即}x=3\text{时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "对勾函数秒杀", #"t=x-1>0,\ f=t+\frac4t+1"#),
                ineqStep(2, "对勾极小点", #"t=\sqrt4=2\Rightarrow f_{\min}=4+1=5"#)
            ],
            keyInsight: "出现x-1时必须把x拆成(x-1)+1才能凑均值。",
            shortcutInsight: "对勾函数t+a/t在t=√a处取极小2√a，跳过取等讨论。",
            weapon: "对勾函数模型",
            timeRatio: 2.0,
            tags: ["不等式", "均值", "凑配", "对勾函数"]
        ),

        ineqProblem(
            id: "ineq_004",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["cauchy_schwarz"],
            content: "已知a+b+c=6，a,b,c>0，求a²+b²+c²的最小值。",
            contentLatex: #"a+b+c=6,\ a,b,c>0,\quad a^2+b^2+c^2=?_{\min}"#,
            answer: "12",
            difficulty: 0.55,
            averageTime: 100,
            hints: ["柯西不等式", "(a²+b²+c²)(1+1+1)≥(a+b+c)²"],
            standardSteps: [
                ineqStep(1, "柯西不等式", #"(a^2+b^2+c^2)(1^2+1^2+1^2)\ge(a+b+c)^2"#),
                ineqStep(2, "代入", #"3(a^2+b^2+c^2)\ge 36"#),
                ineqStep(3, "结论", #"a^2+b^2+c^2\ge 12,\ a=b=c=2\text{时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "二次方差秒杀", #"a^2+b^2+c^2\ge\frac{(a+b+c)^2}{3}=\frac{36}{3}=12"#)
            ],
            keyInsight: "平方和的下界由柯西不等式给出。",
            shortcutInsight: "Σxᵢ²≥(Σxᵢ)²/n 是柯西的直接推论，可背成公式。",
            weapon: "柯西不等式",
            timeRatio: 2.5,
            tags: ["不等式", "柯西", "平方和", "代表题"]
        ),

        ineqProblem(
            id: "ineq_005",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["cauchy_schwarz"],
            content: "已知x,y,z>0且x+2y+3z=6，求1/x+2/y+3/z的最小值。",
            contentLatex: #"x+2y+3z=6,\ x,y,z>0,\quad \frac1x+\frac2y+\frac3z=?_{\min}"#,
            answer: "6",
            difficulty: 0.70,
            averageTime: 160,
            hints: ["柯西不等式", "(Σaᵢ/bᵢ)(Σaᵢbᵢ)≥(Σaᵢ)²", "凑成对应项"],
            standardSteps: [
                ineqStep(1, "构造柯西", #"\left(\frac1x+\frac2y+\frac3z\right)(x+2y+3z)\ge(1+2+3)^2"#),
                ineqStep(2, "说明", #"\text{由}\left(\sum\frac{a_i^2}{b_i}\right)\left(\sum b_i\right)\ge\left(\sum a_i\right)^2,\ a_i=1,\sqrt2,\sqrt3"#),
                ineqStep(3, "代入", #"6\cdot\left(\frac1x+\frac2y+\frac3z\right)\ge 36"#),
                ineqStep(4, "结论", #"\frac1x+\frac2y+\frac3z\ge 6,\ x=y=z=1\text{时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "权方和秒杀", #"\frac1x+\frac2y+\frac3z=\frac{1^2}{x}+\frac{(\sqrt2)^2}{y}+\frac{(\sqrt3)^2}{z}"#),
                ineqStep(2, "凑分母权重", #"=\frac{1^2}{x}+\frac{2^2}{2y}+\frac{3^2}{3z}\ge\frac{(1+2+3)^2}{x+2y+3z}=\frac{36}{6}=6"#)
            ],
            keyInsight: "约束与目标的系数交叉对应，正是柯西配对结构。",
            shortcutInsight: "把每项aᵢ/bᵢ写成aᵢ²/(aᵢbᵢ)使分母凑成约束式，权方和直接给出。",
            weapon: "权方和+柯西",
            timeRatio: 2.8,
            tags: ["不等式", "柯西", "权方和", "压轴"]
        ),

        ineqProblem(
            id: "ineq_006",
            type: .proof,
            tier: 4,
            formulaIds: ["cauchy_schwarz"],
            content: "设a,b,c>0，证明：a²/(b+c)+b²/(c+a)+c²/(a+b)≥(a+b+c)/2。",
            contentLatex: #"\frac{a^2}{b+c}+\frac{b^2}{c+a}+\frac{c^2}{a+b}\ge\frac{a+b+c}{2}"#,
            answer: "不等式成立，当a=b=c时取等",
            difficulty: 0.78,
            averageTime: 200,
            hints: ["权方和(Engel形式)", "Σaᵢ²/bᵢ≥(Σaᵢ)²/Σbᵢ", "分母求和"],
            standardSteps: [
                ineqStep(1, "权方和不等式", #"\sum\frac{a^2}{b+c}\ge\frac{(a+b+c)^2}{(b+c)+(c+a)+(a+b)}"#),
                ineqStep(2, "化简分母", #"(b+c)+(c+a)+(a+b)=2(a+b+c)"#),
                ineqStep(3, "代入", #"\ge\frac{(a+b+c)^2}{2(a+b+c)}=\frac{a+b+c}{2}"#),
                ineqStep(4, "取等", #"a=b=c\text{时取等},\ \text{证毕}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "Engel形式一击", #"\sum\frac{a^2}{b+c}\ge\frac{(\sum a)^2}{2\sum a}=\frac{\sum a}{2}"#)
            ],
            keyInsight: "这是Nesbitt不等式的加权变体，分子为平方时首选Engel(权方和)。",
            shortcutInsight: "权方和Engel形式对'平方比分母'结构是降维打击。",
            weapon: "权方和(Engel形式)",
            timeRatio: 2.6,
            tags: ["不等式", "权方和", "证明", "Nesbitt"]
        ),

        ineqProblem(
            id: "ineq_007",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["am_gm"],
            content: "已知x>0，求f(x)=x²+2/x的最小值。",
            contentLatex: #"x>0,\quad f(x)=x^2+\frac2x=?_{\min}"#,
            answer: "3",
            difficulty: 0.52,
            averageTime: 110,
            hints: ["三元均值", "拆成x²+1/x+1/x", "三项相等取等"],
            standardSteps: [
                ineqStep(1, "三元拆项", #"f(x)=x^2+\frac1x+\frac1x"#),
                ineqStep(2, "三元均值不等式", #"\ge 3\sqrt[3]{x^2\cdot\frac1x\cdot\frac1x}=3\sqrt[3]{1}=3"#),
                ineqStep(3, "取等", #"x^2=\frac1x\Rightarrow x=1\text{时取最小值}3"#)
            ],
            shortcutSteps: [
                ineqStep(1, "导数定极值", #"f'(x)=2x-\frac{2}{x^2}=0\Rightarrow x^3=1\Rightarrow x=1"#),
                ineqStep(2, "代回", #"f(1)=1+2=3"#)
            ],
            keyInsight: "二次加分式且次数不匹配时，拆成等次数三项用三元均值。",
            shortcutInsight: "导数令一阶为零直接定唯一极小点，避开拆项凑配技巧。",
            weapon: "导数法/三元均值",
            timeRatio: 1.8,
            tags: ["不等式", "三元均值", "导数", "最值"]
        ),

        ineqProblem(
            id: "ineq_008",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["abs_inequality"],
            content: "求函数f(x)=|x-1|+|x+3|的最小值。",
            contentLatex: #"f(x)=|x-1|+|x+3|=?_{\min}"#,
            answer: "4",
            difficulty: 0.42,
            averageTime: 80,
            hints: ["绝对值几何意义", "数轴上到两点距离之和", "三角不等式"],
            standardSteps: [
                ineqStep(1, "三角不等式", #"|x-1|+|x+3|\ge|(x-1)-(x+3)|=|-4|=4"#),
                ineqStep(2, "取等条件", #"-3\le x\le 1\text{时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "几何意义秒杀", #"\text{到点}1\text{与}-3\text{的距离和},\ \text{最小为两点间距}|1-(-3)|=4"#)
            ],
            keyInsight: "和式|x-a|+|x-b|的最小值就是|a-b|。",
            shortcutInsight: "把绝对值读成数轴距离，最小值=两定点间距，无需分段。",
            weapon: "绝对值三角不等式",
            timeRatio: 2.0,
            tags: ["不等式", "绝对值", "几何意义", "最值"]
        ),

        ineqProblem(
            id: "ineq_009",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["am_gm"],
            content: "若对任意x>0，不等式x²-ax+4≥0恒成立，求a的最大值。",
            contentLatex: #"\forall x>0,\ x^2-ax+4\ge0,\quad a_{\max}=?"#,
            answer: "4",
            difficulty: 0.60,
            averageTime: 130,
            hints: ["分离参数", "a≤x+4/x", "求右边最小值"],
            standardSteps: [
                ineqStep(1, "分离参数", #"x^2+4\ge ax\Rightarrow a\le x+\frac4x\ (x>0)"#),
                ineqStep(2, "求右边最小", #"x+\frac4x\ge 2\sqrt4=4,\ x=2\text{时取等}"#),
                ineqStep(3, "结论", #"a\le 4,\ \text{故}a_{\max}=4"#)
            ],
            shortcutSteps: [
                ineqStep(1, "判别式秒杀", #"\Delta=a^2-16\le0\Rightarrow -4\le a\le4"#),
                ineqStep(2, "取最大", #"a_{\max}=4"#)
            ],
            keyInsight: "恒成立问题分离参数后转化为求最值。",
            shortcutInsight: "二次恒非负直接用判别式Δ≤0，比分离参数更快。",
            weapon: "判别式法",
            timeRatio: 2.2,
            tags: ["不等式", "恒成立", "判别式", "参数"]
        ),

        ineqProblem(
            id: "ineq_010",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["trig_substitution", "cauchy_schwarz"],
            content: "已知x²+y²=1，求x+2y的最大值。",
            contentLatex: #"x^2+y^2=1,\quad x+2y=?_{\max}"#,
            answer: "√5",
            difficulty: 0.55,
            averageTime: 110,
            hints: ["三角换元", "x=cosθ,y=sinθ", "辅助角公式"],
            standardSteps: [
                ineqStep(1, "三角换元", #"x=\cos\theta,\ y=\sin\theta"#),
                ineqStep(2, "辅助角", #"x+2y=\cos\theta+2\sin\theta=\sqrt5\sin(\theta+\varphi)"#),
                ineqStep(3, "结论", #"\text{最大值}=\sqrt5"#)
            ],
            shortcutSteps: [
                ineqStep(1, "柯西秒杀", #"(x+2y)^2\le(1^2+2^2)(x^2+y^2)=5"#),
                ineqStep(2, "开方", #"x+2y\le\sqrt5"#)
            ],
            keyInsight: "圆上线性函数最值用三角换元化为辅助角。",
            shortcutInsight: "柯西不等式(ax+by)²≤(a²+b²)(x²+y²)直接秒最值。",
            weapon: "柯西不等式",
            timeRatio: 2.4,
            tags: ["不等式", "柯西", "三角换元", "最值"]
        ),

        ineqProblem(
            id: "ineq_011",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["am_gm"],
            content: "已知a,b,c>0且a+b+c=3，求abc的最大值。",
            contentLatex: #"a+b+c=3,\ a,b,c>0,\quad abc=?_{\max}"#,
            answer: "1",
            difficulty: 0.50,
            averageTime: 90,
            hints: ["三元均值不等式", "AM≥GM", "等号成立时三数相等"],
            standardSteps: [
                ineqStep(1, "三元均值", #"\frac{a+b+c}{3}\ge\sqrt[3]{abc}"#),
                ineqStep(2, "代入", #"1\ge\sqrt[3]{abc}\Rightarrow abc\le1"#),
                ineqStep(3, "取等", #"a=b=c=1\text{时}abc_{\max}=1"#)
            ],
            shortcutSteps: [
                ineqStep(1, "对称取等秒杀", #"\text{对称约束}\Rightarrow a=b=c=1,\ abc=1"#)
            ],
            keyInsight: "和定积最大，AM-GM在三数相等时取最大乘积。",
            shortcutInsight: "对称问题极值在对称点取得，直接令变量相等。",
            weapon: "三元均值不等式",
            timeRatio: 2.0,
            tags: ["不等式", "三元均值", "对称", "最值"]
        ),

        ineqProblem(
            id: "ineq_012",
            type: .proof,
            tier: 5,
            formulaIds: ["jensen", "convexity"],
            content: "设A,B,C为三角形内角，证明：sinA+sinB+sinC≤3√3/2。",
            contentLatex: #"A+B+C=\pi,\quad \sin A+\sin B+\sin C\le\frac{3\sqrt3}{2}"#,
            answer: "不等式成立，当A=B=C=π/3(正三角形)时取等",
            difficulty: 0.85,
            averageTime: 220,
            hints: ["sin在(0,π)上凹", "琴生不等式", "上凸函数取等于均分"],
            standardSteps: [
                ineqStep(1, "凹性判断", #"f(x)=\sin x,\ f''(x)=-\sin x<0\ (0<x<\pi),\ \text{上凸}"#),
                ineqStep(2, "琴生不等式", #"\frac{f(A)+f(B)+f(C)}{3}\le f\!\left(\frac{A+B+C}{3}\right)=f\!\left(\frac{\pi}{3}\right)"#),
                ineqStep(3, "代入", #"\sin A+\sin B+\sin C\le 3\sin\frac{\pi}{3}=\frac{3\sqrt3}{2}"#),
                ineqStep(4, "取等", #"A=B=C=\frac{\pi}{3}\text{(正三角形)时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "琴生一击", #"\text{sin上凸}\Rightarrow\sum\sin A\le3\sin\frac{\pi}{3}=\frac{3\sqrt3}{2}"#)
            ],
            keyInsight: "三角形角约束下的对称三角和，用琴生不等式最快。",
            shortcutInsight: "上凸函数的和≤n·f(均值)，正三角形取等是直觉结论。",
            weapon: "琴生不等式",
            timeRatio: 3.5,
            tags: ["不等式", "琴生", "凸性", "证明", "压轴"]
        ),

        ineqProblem(
            id: "ineq_013",
            type: .proof,
            tier: 5,
            formulaIds: ["tangent_line", "convexity"],
            content: "证明：对任意实数x，e^x≥x+1，并由此说明lnx≤x-1（x>0）。",
            contentLatex: #"e^x\ge x+1\ (\forall x\in\mathbb R),\quad \ln x\le x-1\ (x>0)"#,
            answer: "两不等式均成立，等号均在x=1(对数式在x=1)处取得",
            difficulty: 0.72,
            averageTime: 180,
            hints: ["构造g(x)=e^x-x-1", "求导找最小值", "对数取对偶"],
            standardSteps: [
                ineqStep(1, "构造函数", #"g(x)=e^x-x-1,\ g'(x)=e^x-1"#),
                ineqStep(2, "单调性", #"g'(x)<0\,(x<0),\ g'(x)>0\,(x>0),\ x=0\text{为极小}"#),
                ineqStep(3, "最小值", #"g(0)=0\Rightarrow g(x)\ge0\Rightarrow e^x\ge x+1"#),
                ineqStep(4, "对数推论", #"\text{令}x\to\ln t:\ t\ge\ln t+1\Rightarrow\ln t\le t-1"#)
            ],
            shortcutSteps: [
                ineqStep(1, "切线法秒杀", #"y=x+1\text{是}e^x\text{在}(0,1)\text{处切线}"#),
                ineqStep(2, "凸性保证", #"e^x\text{下凸}\Rightarrow\text{图像恒在切线上方},\ e^x\ge x+1"#)
            ],
            keyInsight: "e^x≥x+1与lnx≤x-1是同一切线不等式的对偶。",
            shortcutInsight: "切线法：下凸函数恒在任意切线之上，背下这条切线即得不等式。",
            weapon: "切线放缩法",
            timeRatio: 2.5,
            tags: ["不等式", "切线法", "指对数", "证明", "凸性"]
        ),

        ineqProblem(
            id: "ineq_014",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["am_gm"],
            content: "已知x>0，y>0，且x+y+xy=8，求x+y的最小值。",
            contentLatex: #"x>0,\ y>0,\ x+y+xy=8,\quad x+y=?_{\min}"#,
            answer: "4",
            difficulty: 0.66,
            averageTime: 150,
            hints: ["设s=x+y", "xy≤(s/2)²", "代入约束解不等式"],
            standardSteps: [
                ineqStep(1, "设和", #"\text{令}s=x+y,\ \text{则}xy\le\left(\frac{s}{2}\right)^2"#),
                ineqStep(2, "代入约束", #"8=s+xy\le s+\frac{s^2}{4}"#),
                ineqStep(3, "解不等式", #"s^2+4s-32\ge0\Rightarrow(s+8)(s-4)\ge0\Rightarrow s\ge4"#),
                ineqStep(4, "结论", #"x+y\ge4,\ x=y=2\text{时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "整体代换秒杀", #"s+\frac{s^2}{4}\ge8\Rightarrow s\ge4"#)
            ],
            keyInsight: "含xy的约束用xy≤(s/2)²把双变量降为单变量s。",
            shortcutInsight: "直接对s列二次不等式求根，跳过逐步代入。",
            weapon: "整体代换+均值",
            timeRatio: 2.3,
            tags: ["不等式", "均值", "整体代换", "最值"]
        ),

        ineqProblem(
            id: "ineq_015",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["am_gm", "cauchy_schwarz"],
            content: "已知a>0，b>0，a+2b=1，求a²+4b²+1/(ab)的最小值。",
            contentLatex: #"a+2b=1,\ a,b>0,\quad a^2+4b^2+\frac1{ab}=?_{\min}"#,
            answer: "17/2",
            difficulty: 0.80,
            averageTime: 210,
            hints: ["a²+4b²用配方", "(a+2b)²=a²+4b²+4ab", "再处理1/(ab)"],
            standardSteps: [
                ineqStep(1, "处理平方和", #"a^2+4b^2=(a+2b)^2-4ab=1-4ab"#),
                ineqStep(2, "设t=ab", #"\text{原式}=1-4t+\frac1t,\ \text{其中}t=ab"#),
                ineqStep(3, "约束ab上界", #"2ab\le\left(\frac{a+2b}{2}\right)^2=\frac14\Rightarrow t=ab\le\frac18"#),
                ineqStep(4, "单调性", #"g(t)=1-4t+\frac1t,\ g'(t)=-4-\frac1{t^2}<0,\ \text{在}(0,\tfrac18]\text{递减}"#),
                ineqStep(5, "取右端点", #"\text{最小在}t=\frac18\text{处}"#),
                ineqStep(6, "代入", #"g\!\left(\tfrac18\right)=1-4\cdot\tfrac18+8=1-\tfrac12+8=\frac{17}{2}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "关键: ab最大", #"a=2b\text{与}a+2b=1\Rightarrow a=\tfrac12,b=\tfrac14,\ ab=\tfrac18"#),
                ineqStep(2, "g单调减取最大ab", #"a^2+4b^2+\frac1{ab}=\left(\tfrac14+\tfrac14\right)+8=\frac12+8=\frac{17}{2}"#),
                ineqStep(3, "最小值", #"\min=\frac{17}{2}"#)
            ],
            keyInsight: "平方和借(a+2b)²降维成ab的单变量函数，再用ab的范围定最值。",
            shortcutInsight: "g(t)关于t单调减，故ab取最大值1/8时整体最小，直接代点。",
            weapon: "配方降元+单调性",
            timeRatio: 2.4,
            tags: ["不等式", "配方", "单调性", "压轴"]
        ),

        ineqProblem(
            id: "ineq_016",
            type: .fillInBlank,
            tier: 3,
            formulaIds: ["am_gm"],
            content: "已知正数a,b满足ab=a+b+3，求ab的最小值。",
            contentLatex: #"ab=a+b+3,\ a,b>0,\quad ab=?_{\min}"#,
            answer: "9",
            difficulty: 0.58,
            averageTime: 120,
            hints: ["a+b≥2√(ab)", "设t=√(ab)", "代入解二次不等式"],
            standardSteps: [
                ineqStep(1, "均值放缩", #"ab=a+b+3\ge2\sqrt{ab}+3"#),
                ineqStep(2, "换元", #"\text{令}t=\sqrt{ab}>0:\ t^2-2t-3\ge0"#),
                ineqStep(3, "因式分解", #"(t-3)(t+1)\ge0\Rightarrow t\ge3"#),
                ineqStep(4, "结论", #"ab=t^2\ge9,\ a=b=3\text{时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "换元秒杀", #"t=\sqrt{ab}:\ t^2\ge2t+3\Rightarrow t\ge3\Rightarrow ab\ge9"#)
            ],
            keyInsight: "a+b与ab互相约束时，用a+b≥2√(ab)统一为√(ab)的不等式。",
            shortcutInsight: "令t=√(ab)直接列二次不等式，一步求根。",
            weapon: "均值不等式换元",
            timeRatio: 1.9,
            tags: ["不等式", "均值", "换元", "最值"]
        ),

        ineqProblem(
            id: "ineq_017",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["am_gm"],
            content: "已知x>0，求(x²+x+1)/x的最小值。",
            contentLatex: #"x>0,\quad \frac{x^2+x+1}{x}=?_{\min}"#,
            answer: "3",
            difficulty: 0.45,
            averageTime: 80,
            hints: ["拆项", "x+1/x+1", "均值不等式"],
            standardSteps: [
                ineqStep(1, "分项", #"\frac{x^2+x+1}{x}=x+1+\frac1x"#),
                ineqStep(2, "均值不等式", #"x+\frac1x\ge2,\ x=1\text{时取等}"#),
                ineqStep(3, "结论", #"\ge2+1=3"#)
            ],
            shortcutSteps: [
                ineqStep(1, "拆项秒杀", #"x+\frac1x+1\ge2+1=3"#)
            ],
            keyInsight: "分式分子高于分母一次时，逐项除化为x+c/x型。",
            shortcutInsight: "直接拆成x+1/x+1，常数1单独处理。",
            weapon: "均值不等式",
            timeRatio: 1.6,
            tags: ["不等式", "均值", "分式", "最值"]
        ),

        ineqProblem(
            id: "ineq_018",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["cauchy_schwarz"],
            content: "已知a²+b²+c²=1，求a+2b+2c的最大值。",
            contentLatex: #"a^2+b^2+c^2=1,\quad a+2b+2c=?_{\max}"#,
            answer: "3",
            difficulty: 0.60,
            averageTime: 100,
            hints: ["柯西不等式", "(a+2b+2c)²≤(1+4+4)(a²+b²+c²)"],
            standardSteps: [
                ineqStep(1, "柯西不等式", #"(a+2b+2c)^2\le(1^2+2^2+2^2)(a^2+b^2+c^2)"#),
                ineqStep(2, "代入", #"\le 9\cdot1=9"#),
                ineqStep(3, "结论", #"a+2b+2c\le3,\ (a,b,c)=\left(\tfrac13,\tfrac23,\tfrac23\right)\text{时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "柯西秒杀", #"\max=\sqrt{(1+4+4)\cdot1}=3"#)
            ],
            keyInsight: "球面上线性函数最值=系数模长×半径。",
            shortcutInsight: "max(Σaᵢxᵢ)=√(Σaᵢ²)·√(Σxᵢ²)，直接套。",
            weapon: "柯西不等式",
            timeRatio: 2.5,
            tags: ["不等式", "柯西", "线性最值", "代表题"]
        ),

        ineqProblem(
            id: "ineq_019",
            type: .calculation,
            tier: 4,
            formulaIds: ["am_gm"],
            content: "已知函数f(x)=(x²+2x+a)/x在[1,+∞)上f(x)>0恒成立，求a的取值范围。",
            contentLatex: #"f(x)=\frac{x^2+2x+a}{x}>0,\ \forall x\ge1,\quad a=?"#,
            answer: "a>-3",
            difficulty: 0.65,
            averageTime: 150,
            hints: ["x>0时等价于x²+2x+a>0", "分离参数a>-(x²+2x)", "求右边最大值"],
            standardSteps: [
                ineqStep(1, "去分母", #"x\ge1>0\Rightarrow f(x)>0\iff x^2+2x+a>0"#),
                ineqStep(2, "分离参数", #"a>-(x^2+2x),\ \forall x\ge1"#),
                ineqStep(3, "求右端最大", #"g(x)=-(x^2+2x)\text{在}[1,\infty)\text{递减},\ g(1)=-3\text{为最大}"#),
                ineqStep(4, "结论", #"a>-3"#)
            ],
            shortcutSteps: [
                ineqStep(1, "端点秒杀", #"x^2+2x\text{在}x=1\text{取最小}3\Rightarrow a>-3"#)
            ],
            keyInsight: "恒成立分离参数后，求被比函数在定义域上的最值即可。",
            shortcutInsight: "x²+2x在[1,∞)单调增，最小在左端点，直接代x=1。",
            weapon: "分离参数+单调性",
            timeRatio: 2.0,
            tags: ["不等式", "恒成立", "分离参数", "参数范围"]
        ),

        ineqProblem(
            id: "ineq_020",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["am_gm"],
            content: "已知a>0，b>0，且1/a+1/b=1，求a+4b的最小值。",
            contentLatex: #"\frac1a+\frac1b=1,\ a,b>0,\quad a+4b=?_{\min}"#,
            answer: "9",
            difficulty: 0.62,
            averageTime: 130,
            hints: ["1的代换", "(a+4b)(1/a+1/b)", "展开取均值"],
            standardSteps: [
                ineqStep(1, "1的代换", #"a+4b=(a+4b)\left(\frac1a+\frac1b\right)"#),
                ineqStep(2, "展开", #"=1+\frac{a}{b}+\frac{4b}{a}+4=5+\frac{a}{b}+\frac{4b}{a}"#),
                ineqStep(3, "均值不等式", #"\frac{a}{b}+\frac{4b}{a}\ge2\sqrt4=4"#),
                ineqStep(4, "结论", #"a+4b\ge9,\ a=3,b=\tfrac32\text{时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "1的代换秒杀", #"a+4b=5+\left(\frac{a}{b}+\frac{4b}{a}\right)\ge5+4=9"#)
            ],
            keyInsight: "倒数和为定值时，乘1做代换是标准套路。",
            shortcutInsight: "展开后常数项5+交叉项均值4，心算即得9。",
            weapon: "1的代换",
            timeRatio: 2.0,
            tags: ["不等式", "1的代换", "均值", "最值"]
        ),

        ineqProblem(
            id: "ineq_021",
            type: .proof,
            tier: 5,
            formulaIds: ["cauchy_schwarz", "am_gm"],
            content: "设a,b,c>0且a+b+c=1，证明：1/a+1/b+1/c≥9。",
            contentLatex: #"a+b+c=1,\ a,b,c>0,\quad \frac1a+\frac1b+\frac1c\ge9"#,
            answer: "不等式成立，当a=b=c=1/3时取等",
            difficulty: 0.62,
            averageTime: 120,
            hints: ["柯西不等式", "(Σ1/aᵢ)(Σaᵢ)≥n²", "或调和-算术均值"],
            standardSteps: [
                ineqStep(1, "柯西不等式", #"\left(\frac1a+\frac1b+\frac1c\right)(a+b+c)\ge(1+1+1)^2=9"#),
                ineqStep(2, "代入约束", #"\left(\frac1a+\frac1b+\frac1c\right)\cdot1\ge9"#),
                ineqStep(3, "结论", #"\frac1a+\frac1b+\frac1c\ge9,\ a=b=c=\tfrac13\text{时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "权方和秒杀", #"\sum\frac1a=\sum\frac{1^2}{a}\ge\frac{(1+1+1)^2}{a+b+c}=\frac{9}{1}=9"#)
            ],
            keyInsight: "倒数和的下界由柯西/权方和与约束相乘得到。",
            shortcutInsight: "权方和Σ1/aᵢ≥n²/Σaᵢ一步出，是调和≤算术均值的直接形式。",
            weapon: "权方和/柯西",
            timeRatio: 2.4,
            tags: ["不等式", "柯西", "权方和", "证明"]
        ),

        ineqProblem(
            id: "ineq_022",
            type: .fillInBlank,
            tier: 5,
            formulaIds: ["am_gm", "cauchy_schwarz"],
            content: "已知正数x,y,z满足x+y+z=1，求(1/x-1)(1/y-1)(1/z-1)的最小值。",
            contentLatex: #"x+y+z=1,\ x,y,z>0,\quad \left(\frac1x-1\right)\!\left(\frac1y-1\right)\!\left(\frac1z-1\right)=?_{\min}"#,
            answer: "8",
            difficulty: 0.82,
            averageTime: 200,
            hints: ["1/x-1=(y+z)/x", "三因子相乘", "AM-GM两两放缩"],
            standardSteps: [
                ineqStep(1, "替换", #"\frac1x-1=\frac{1-x}{x}=\frac{y+z}{x},\ \text{同理另两项}"#),
                ineqStep(2, "乘积", #"\prod=\frac{(y+z)(z+x)(x+y)}{xyz}"#),
                ineqStep(3, "分子放缩", #"y+z\ge2\sqrt{yz},\ z+x\ge2\sqrt{zx},\ x+y\ge2\sqrt{xy}"#),
                ineqStep(4, "相乘", #"(y+z)(z+x)(x+y)\ge8\sqrt{x^2y^2z^2}=8xyz"#),
                ineqStep(5, "结论", #"\prod\ge\frac{8xyz}{xyz}=8,\ x=y=z=\tfrac13\text{时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "对称代点秒杀", #"\text{对称}\Rightarrow x=y=z=\tfrac13"#),
                ineqStep(2, "代入", #"\left(\tfrac{1}{1/3}-1\right)^3=(3-1)^3=2^3=8"#)
            ],
            keyInsight: "把1/x-1变形为(y+z)/x后，AM-GM两两放缩消去xyz。",
            shortcutInsight: "完全对称结构极值必在x=y=z处，直接代点验证。",
            weapon: "对称放缩+AM-GM",
            timeRatio: 3.0,
            tags: ["不等式", "对称", "AM-GM", "压轴"]
        ),

        ineqProblem(
            id: "ineq_023",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["am_gm"],
            content: "已知a>b>0，求a+1/(b(a-b))的最小值。",
            contentLatex: #"a>b>0,\quad a+\frac{1}{b(a-b)}=?_{\min}"#,
            answer: "3",
            difficulty: 0.72,
            averageTime: 170,
            hints: ["b(a-b)≤(a/2)²", "先对b用均值", "再对a用均值"],
            standardSteps: [
                ineqStep(1, "对b用均值", #"b(a-b)\le\left(\frac{b+(a-b)}{2}\right)^2=\frac{a^2}{4}"#),
                ineqStep(2, "放缩", #"a+\frac{1}{b(a-b)}\ge a+\frac{4}{a^2}"#),
                ineqStep(3, "对a用三元均值", #"a+\frac{4}{a^2}=\frac a2+\frac a2+\frac4{a^2}\ge3\sqrt[3]{\frac a2\cdot\frac a2\cdot\frac4{a^2}}=3"#),
                ineqStep(4, "取等", #"a=2,b=1\text{时取得最小值}3"#)
            ],
            shortcutSteps: [
                ineqStep(1, "两次均值秒杀", #"b(a-b)\le\frac{a^2}{4}\Rightarrow a+\frac4{a^2}\ge3"#)
            ],
            keyInsight: "多变量分式先固定a对b放缩，再对a用三元均值。",
            shortcutInsight: "嵌套均值：内层凑(a/2)²，外层拆三项凑积为常数。",
            weapon: "嵌套均值不等式",
            timeRatio: 2.6,
            tags: ["不等式", "嵌套均值", "三元均值", "压轴"]
        ),

        ineqProblem(
            id: "ineq_024",
            type: .fillInBlank,
            tier: 4,
            formulaIds: ["am_gm"],
            content: "已知x>0，y>0，2x+y=2，求xy的最大值。",
            contentLatex: #"2x+y=2,\ x>0,\ y>0,\quad xy=?_{\max}"#,
            answer: "1/2",
            difficulty: 0.48,
            averageTime: 90,
            hints: ["xy=(1/2)(2x)y", "2x·y≤((2x+y)/2)²", "和定积大"],
            standardSteps: [
                ineqStep(1, "凑积", #"xy=\frac12(2x)\cdot y"#),
                ineqStep(2, "均值不等式", #"2x\cdot y\le\left(\frac{2x+y}{2}\right)^2=1"#),
                ineqStep(3, "结论", #"xy\le\frac12,\ x=\tfrac12,y=1\text{时取等}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "和定积大秒杀", #"2x\cdot y\le1\Rightarrow xy\le\frac12"#)
            ],
            keyInsight: "求xy最大值要把约束凑成(2x)·y的和定积大形式。",
            shortcutInsight: "和为定值时积最大=(和/2)²，注意系数配平。",
            weapon: "均值不等式",
            timeRatio: 1.8,
            tags: ["不等式", "均值", "和定积大", "最值"]
        ),

        ineqProblem(
            id: "ineq_025",
            type: .proof,
            tier: 5,
            formulaIds: ["cauchy_schwarz", "power_mean"],
            content: "设a,b,c>0，证明：(a+b+c)(1/a+1/b+1/c)≥9，并指出该不等式与权方和的关系。",
            contentLatex: #"(a+b+c)\left(\frac1a+\frac1b+\frac1c\right)\ge9"#,
            answer: "不等式成立，当a=b=c时取等",
            difficulty: 0.60,
            averageTime: 110,
            hints: ["柯西不等式", "或六项两两均值", "等号a=b=c"],
            standardSteps: [
                ineqStep(1, "柯西不等式", #"(a+b+c)\left(\frac1a+\frac1b+\frac1c\right)\ge\left(\sqrt{a\cdot\tfrac1a}+\sqrt{b\cdot\tfrac1b}+\sqrt{c\cdot\tfrac1c}\right)^2"#),
                ineqStep(2, "化简", #"=(1+1+1)^2=9"#),
                ineqStep(3, "取等", #"a=b=c\text{时取等},\ \text{证毕}"#)
            ],
            shortcutSteps: [
                ineqStep(1, "展开两两均值", #"\sum\left(\frac{a}{b}+\frac{b}{a}\right)\ge3\cdot2=6"#),
                ineqStep(2, "加常数项", #"\text{原式}=3+\sum_{\text{对}}\left(\frac ab+\frac ba\right)\ge3+6=9"#)
            ],
            keyInsight: "算术均值与调和均值之积≥n²，是均值不等式链AH≤的等价形式。",
            shortcutInsight: "展开成3个常数+3对互倒项，每对≥2，立得≥9。",
            weapon: "柯西不等式/均值链",
            timeRatio: 2.2,
            tags: ["不等式", "柯西", "均值链", "证明", "代表题"]
        )
    ]

    // MARK: - 工厂方法
    private static func ineqStep(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func ineqProblem(
        id: String,
        type: ProblemType,
        tier: Int,
        formulaIds: [String],
        content: String,
        contentLatex: String,
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
        commonMistakes: [String] = ["均值不等式取等条件未验证", "忘记变量为正的前提", "1的代换后漏掉交叉项"]
    ) -> Problem {
        Problem(
            id: id,
            type: type,
            tier: tier,
            formulaIds: formulaIds,
            content: content,
            contentLatex: contentLatex,
            options: nil,
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
