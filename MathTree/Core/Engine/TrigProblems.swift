import Foundation

// MARK: - 三角函数综合压轴专题
// 目标: 用三角公式完成降维, 覆盖恒等变换、参数范围、解三角形、向量与解析几何联动。

extension SampleData {
    static let trigProblems: [Problem] = [
        trigProblem(
            id: "trig_001",
            type: .calculation,
            tier: 5,
            formulaIds: ["double_angle"],
            content: "求函数 f(x)=sinx+cosx+sinxcosx 的值域。",
            contentLatex: #"f(x)=\sin x+\cos x+\sin x\cos x"#,
            answer: "[-1, √2+1/2]",
            difficulty: 0.82,
            averageTime: 260,
            hints: ["令t=sinx+cosx", "sinxcosx=(t²-1)/2", "注意t∈[-√2,√2]"],
            standardSteps: [
                step(1, "整体换元", #"t=\sin x+\cos x,\quad t\in[-\sqrt2,\sqrt2]"#),
                step(2, "用平方关系表示乘积", #"t^2=1+2\sin x\cos x\Rightarrow \sin x\cos x=\frac{t^2-1}{2}"#),
                step(3, "转化为一元二次函数", #"f(t)=\frac12t^2+t-\frac12=\frac12(t+1)^2-1"#),
                step(4, "在区间上取值", #"f_{\min}=-1,\quad f_{\max}=f(\sqrt2)=\sqrt2+\frac12"#)
            ],
            shortcutSteps: [
                step(1, "整体变量秒杀", #"t=\sin x+\cos x,\quad f=t+\frac{t^2-1}{2}"#),
                step(2, "二次函数读区间", #"t\in[-\sqrt2,\sqrt2]\Rightarrow f\in[-1,\sqrt2+\frac12]"#)
            ],
            keyInsight: "sinx+cosx 与 sinxcosx 可以由同一个整体变量关联。",
            shortcutInsight: "把二元三角式压成一元二次函数。",
            weapon: "整体换元值域法",
            timeRatio: 3.0,
            tags: ["三角函数", "值域", "整体换元", "压轴"]
        ),

        trigProblem(
            id: "trig_002",
            type: .calculation,
            tier: 5,
            formulaIds: ["double_angle"],
            content: "若方程 sinx+cosx = a(1+sinxcosx) 有实数解，求实数a的取值范围。",
            contentLatex: #"\sin x+\cos x=a(1+\sin x\cos x)"#,
            answer: "[-1, 1]",
            difficulty: 0.80,
            averageTime: 240,
            hints: ["令t=sinx+cosx", "1+sinxcosx=(t²+1)/2", "求a=2t/(t²+1)的值域"],
            standardSteps: [
                step(1, "整体换元", #"t=\sin x+\cos x,\quad t\in[-\sqrt2,\sqrt2]"#),
                step(2, "表示右侧括号", #"1+\sin x\cos x=1+\frac{t^2-1}{2}=\frac{t^2+1}{2}"#),
                step(3, "转成参数函数", #"a=\frac{2t}{t^2+1}"#),
                step(4, "求值域", #"g'(t)=\frac{2(1-t^2)}{(t^2+1)^2},\quad g(t)\in[-1,1]"#)
            ],
            shortcutSteps: [
                step(1, "秒杀主元", #"a=\frac{2t}{1+t^2},\quad t\in[-\sqrt2,\sqrt2]"#),
                step(2, "基本有界式", #"\left|\frac{2t}{1+t^2}\right|\le 1,\quad t=\pm1取等"#)
            ],
            keyInsight: "参数存在性先转成一个可求值域的函数。",
            shortcutInsight: "2t/(1+t²) 的绝对值不超过 1。",
            weapon: "参数存在性降维",
            timeRatio: 3.0,
            tags: ["三角函数", "参数范围", "整体换元", "压轴"]
        ),

        trigProblem(
            id: "trig_003",
            type: .calculation,
            tier: 5,
            formulaIds: ["double_angle", "cos_double"],
            content: "求 f(x)=3sin²x+2√3sinxcosx+cos²x 的值域。",
            contentLatex: #"f(x)=3\sin^2x+2\sqrt3\sin x\cos x+\cos^2x"#,
            answer: "[0, 4]",
            difficulty: 0.78,
            averageTime: 220,
            hints: ["用二倍角降幂", "合成 -cos2x+√3sin2x"],
            standardSteps: [
                step(1, "降幂整理", #"3\sin^2x+\cos^2x=2-\cos2x"#),
                step(2, "化成同角线性组合", #"f(x)=2-\cos2x+\sqrt3\sin2x"#),
                step(3, "辅助角合成", #"-\cos2x+\sqrt3\sin2x=2\sin(2x-\frac{\pi}{6})"#),
                step(4, "读值域", #"f(x)=2+2\sin(2x-\frac{\pi}{6})\in[0,4]"#)
            ],
            shortcutSteps: [
                step(1, "二倍角矩阵化", #"f=2+(-\cos2x+\sqrt3\sin2x)"#),
                step(2, "振幅秒杀", #"|-\cos2x+\sqrt3\sin2x|\le2\Rightarrow f\in[0,4]"#)
            ],
            keyInsight: "三角二次型用二倍角后就是辅助角问题。",
            shortcutInsight: "二次型的极值由二倍角线性组合的振幅决定。",
            weapon: "三角二次型振幅法",
            timeRatio: 2.8,
            tags: ["三角函数", "二次型", "最值", "压轴"]
        ),

        trigProblem(
            id: "trig_004",
            type: .calculation,
            tier: 5,
            formulaIds: ["double_angle", "cos_double"],
            content: "若 f(x)=sin²x+2a sinxcosx+2cos²x 对任意实数x恒非负，求a的取值范围。",
            contentLatex: #"f(x)=\sin^2x+2a\sin x\cos x+2\cos^2x\ge0"#,
            answer: "[-√2, √2]",
            difficulty: 0.82,
            averageTime: 260,
            hints: ["转成二倍角", "恒非负等价于最小值≥0"],
            standardSteps: [
                step(1, "二倍角化简", #"f(x)=\frac32+\frac12\cos2x+a\sin2x"#),
                step(2, "求最小值", #"f_{\min}=\frac32-\sqrt{a^2+\frac14}"#),
                step(3, "恒非负条件", #"\frac32-\sqrt{a^2+\frac14}\ge0"#),
                step(4, "解参数", #"a^2+\frac14\le\frac94\Rightarrow a^2\le2"#)
            ],
            shortcutSteps: [
                step(1, "振幅控制", #"f=\frac32+(\frac12\cos2x+a\sin2x)"#),
                step(2, "最低点不破零", #"\sqrt{a^2+\frac14}\le\frac32\Rightarrow |a|\le\sqrt2"#)
            ],
            keyInsight: "恒成立问题常转成三角函数最小值问题。",
            shortcutInsight: "常数项必须压住振幅。",
            weapon: "常数压振幅",
            timeRatio: 3.0,
            tags: ["三角函数", "恒成立", "参数范围", "压轴"]
        ),

        trigProblem(
            id: "trig_005",
            type: .calculation,
            tier: 5,
            formulaIds: ["double_angle"],
            content: "求 F(x)=(sinx+cosx)^4-4sinxcosx 的值域。",
            contentLatex: #"F(x)=(\sin x+\cos x)^4-4\sin x\cos x"#,
            answer: "[1, 2]",
            difficulty: 0.76,
            averageTime: 220,
            hints: ["令t=sinx+cosx", "再令u=t²", "u∈[0,2]"],
            standardSteps: [
                step(1, "整体换元", #"t=\sin x+\cos x,\quad t^2\in[0,2]"#),
                step(2, "表示乘积", #"4\sin x\cos x=2(t^2-1)"#),
                step(3, "降成二次函数", #"F=t^4-2t^2+2"#),
                step(4, "令u=t²求值域", #"F=(u-1)^2+1,\quad u\in[0,2]\Rightarrow F\in[1,2]"#)
            ],
            shortcutSteps: [
                step(1, "一维化", #"u=(\sin x+\cos x)^2\in[0,2],\quad F=u^2-2u+2"#),
                step(2, "对称抛物线", #"F=(u-1)^2+1\in[1,2]"#)
            ],
            keyInsight: "四次式不要展开，先用整体平方降维。",
            shortcutInsight: "把高次三角式变成区间上的二次函数。",
            weapon: "高次整体降维",
            timeRatio: 3.0,
            tags: ["三角函数", "高次式", "值域", "压轴"]
        ),

        trigProblem(
            id: "trig_006",
            type: .calculation,
            tier: 5,
            formulaIds: ["double_angle"],
            content: "求函数 y=(sinx+cosx)/(2+sin2x) 的值域。",
            contentLatex: #"y=\frac{\sin x+\cos x}{2+\sin2x}"#,
            answer: "[-1/2, 1/2]",
            difficulty: 0.78,
            averageTime: 220,
            hints: ["令t=sinx+cosx", "2+sin2x=t²+1", "求t/(t²+1)的值域"],
            standardSteps: [
                step(1, "整体换元", #"t=\sin x+\cos x,\quad t\in[-\sqrt2,\sqrt2]"#),
                step(2, "化简分母", #"2+\sin2x=2+t^2-1=t^2+1"#),
                step(3, "转为有理函数", #"y=\frac{t}{t^2+1}"#),
                step(4, "求值域", #"y'=\frac{1-t^2}{(t^2+1)^2},\quad y\in[-\frac12,\frac12]"#)
            ],
            shortcutSteps: [
                step(1, "分母同步降维", #"y=\frac{t}{1+t^2},\quad t\in[-\sqrt2,\sqrt2]"#),
                step(2, "基本界", #"\left|\frac{t}{1+t^2}\right|\le\frac12"#)
            ],
            keyInsight: "分子和分母都能由sinx+cosx统一表示。",
            shortcutInsight: "t/(1+t²) 的极值在 t=±1。",
            weapon: "有理整体换元",
            timeRatio: 2.8,
            tags: ["三角函数", "分式值域", "整体换元", "压轴"]
        ),

        trigProblem(
            id: "trig_007",
            type: .calculation,
            tier: 4,
            formulaIds: ["sum_to_product"],
            content: "求方程 sinx+sin2x+sin3x=0 在 [0,2π) 内的所有解。",
            contentLatex: #"\sin x+\sin2x+\sin3x=0,\quad x\in[0,2\pi)"#,
            answer: "0, π/2, 2π/3, π, 4π/3, 3π/2",
            difficulty: 0.72,
            averageTime: 200,
            hints: ["先合并sinx和sin3x", "提取sin2x"],
            standardSteps: [
                step(1, "和差化积", #"\sin x+\sin3x=2\sin2x\cos x"#),
                step(2, "因式分解", #"\sin2x(2\cos x+1)=0"#),
                step(3, "分别求解", #"\sin2x=0\Rightarrow x=0,\frac\pi2,\pi,\frac{3\pi}{2}"#),
                step(4, "补充分支", #"2\cos x+1=0\Rightarrow x=\frac{2\pi}{3},\frac{4\pi}{3}"#)
            ],
            shortcutSteps: [
                step(1, "首尾配对", #"\sin x+\sin3x+\sin2x=\sin2x(2\cos x+1)"#),
                step(2, "两因子列解", #"\sin2x=0\ \text{或}\ \cos x=-\frac12"#)
            ],
            keyInsight: "等差角正弦和优先首尾配对。",
            shortcutInsight: "三项正弦和能直接因式分解。",
            weapon: "等差角和差化积",
            timeRatio: 2.6,
            tags: ["三角函数", "三角方程", "和差化积", "综合"]
        ),

        trigProblem(
            id: "trig_008",
            type: .calculation,
            tier: 4,
            formulaIds: ["sum_to_product"],
            content: "求方程 cosx+cos2x+cos3x=0 在 [0,2π) 内的所有解。",
            contentLatex: #"\cos x+\cos2x+\cos3x=0,\quad x\in[0,2\pi)"#,
            answer: "π/4, 2π/3, 3π/4, 5π/4, 4π/3, 7π/4",
            difficulty: 0.72,
            averageTime: 200,
            hints: ["合并cosx和cos3x", "提取cos2x"],
            standardSteps: [
                step(1, "和差化积", #"\cos x+\cos3x=2\cos2x\cos x"#),
                step(2, "因式分解", #"\cos2x(2\cos x+1)=0"#),
                step(3, "解cos2x=0", #"x=\frac\pi4,\frac{3\pi}{4},\frac{5\pi}{4},\frac{7\pi}{4}"#),
                step(4, "解cosx=-1/2", #"x=\frac{2\pi}{3},\frac{4\pi}{3}"#)
            ],
            shortcutSteps: [
                step(1, "首尾配对", #"\cos x+\cos2x+\cos3x=\cos2x(2\cos x+1)"#),
                step(2, "两组特殊角", #"\cos2x=0\ \text{或}\ \cos x=-\frac12"#)
            ],
            keyInsight: "等差角余弦和也可首尾配对成乘积。",
            shortcutInsight: "先因式分解，再查单位圆。",
            weapon: "等差角余弦配对",
            timeRatio: 2.6,
            tags: ["三角函数", "三角方程", "和差化积", "综合"]
        ),

        trigProblem(
            id: "trig_009",
            type: .calculation,
            tier: 4,
            formulaIds: ["tan_add"],
            content: "求方程 tanx+tan2x+tan3x=tanx·tan2x·tan3x 在 x∈(0,π/4) 内的解。",
            contentLatex: #"\tan x+\tan2x+\tan3x=\tan x\tan2x\tan3x,\quad x\in(0,\frac\pi4)"#,
            answer: "π/6",
            difficulty: 0.74,
            averageTime: 180,
            hints: ["三角正切和公式的反用", "tan(A+B+C)=0"],
            standardSteps: [
                step(1, "识别三角正切和", #"\tan(A+B+C)=\frac{\tan A+\tan B+\tan C-\tan A\tan B\tan C}{1-\tan A\tan B-\tan B\tan C-\tan C\tan A}"#),
                step(2, "分子为零", #"A=x,\ B=2x,\ C=3x\Rightarrow \tan6x=0"#),
                step(3, "求解", #"6x=k\pi"#),
                step(4, "代入区间", #"x\in(0,\frac\pi4)\Rightarrow x=\frac\pi6"#)
            ],
            shortcutSteps: [
                step(1, "正切三角和秒杀", #"\tan x+\tan2x+\tan3x=\tan x\tan2x\tan3x\Rightarrow x+2x+3x=k\pi"#),
                step(2, "区间筛选", #"6x=\pi\Rightarrow x=\frac\pi6"#)
            ],
            keyInsight: "tanA+tanB+tanC=tanA tanB tanC 对应 A+B+C=kπ。",
            shortcutInsight: "正切三角和公式反用，避免展开。",
            weapon: "正切三角和反杀",
            timeRatio: 3.2,
            tags: ["三角函数", "正切", "三角方程", "压轴"]
        ),

        trigProblem(
            id: "trig_010",
            type: .calculation,
            tier: 4,
            formulaIds: ["tan_add"],
            content: "求方程 tanx+tan2x=√3(1-tanx·tan2x) 在 x∈(0,π/2) 内的解。",
            contentLatex: #"\tan x+\tan2x=\sqrt3(1-\tan x\tan2x),\quad x\in(0,\frac\pi2)"#,
            answer: "π/9, 4π/9",
            difficulty: 0.72,
            averageTime: 180,
            hints: ["两边同时除以1-tanx·tan2x", "转成tan3x=√3"],
            standardSteps: [
                step(1, "正切和角", #"\frac{\tan x+\tan2x}{1-\tan x\tan2x}=\sqrt3"#),
                step(2, "得到整体角方程", #"\tan3x=\sqrt3"#),
                step(3, "求通解", #"3x=\frac\pi3+k\pi"#),
                step(4, "代入区间", #"x=\frac\pi9,\frac{4\pi}{9}"#)
            ],
            shortcutSteps: [
                step(1, "公式反读", #"\tan(x+2x)=\sqrt3"#),
                step(2, "周期筛选", #"x=\frac\pi9+\frac{k\pi}{3}\Rightarrow x=\frac\pi9,\frac{4\pi}{9}"#)
            ],
            keyInsight: "等式右侧的 1-tanx tan2x 是正切和角公式的分母。",
            shortcutInsight: "看到分子分母结构，直接还原tan3x。",
            weapon: "正切和角结构识别",
            timeRatio: 2.8,
            tags: ["三角函数", "正切", "整体角", "综合"]
        ),

        trigProblem(
            id: "trig_011",
            type: .proof,
            tier: 4,
            formulaIds: ["sin_add", "double_angle", "cos_double"],
            content: "证明三倍角公式 sin3x=3sinx-4sin³x。",
            contentLatex: #"\sin3x=3\sin x-4\sin^3x"#,
            answer: "恒等式成立",
            difficulty: 0.68,
            averageTime: 180,
            hints: ["把3x拆成2x+x", "再统一成sinx"],
            standardSteps: [
                step(1, "拆角", #"\sin3x=\sin(2x+x)"#),
                step(2, "和角展开", #"\sin3x=\sin2x\cos x+\cos2x\sin x"#),
                step(3, "代入倍角", #"=2\sin x\cos^2x+(1-2\sin^2x)\sin x"#),
                step(4, "统一成sinx", #"=2\sin x(1-\sin^2x)+\sin x-2\sin^3x=3\sin x-4\sin^3x"#)
            ],
            shortcutSteps: [
                step(1, "固定模板", #"\sin3x=\sin(2x+x)"#),
                step(2, "主元化", #"s=\sin x\Rightarrow \sin3x=2s(1-s^2)+(1-2s^2)s=3s-4s^3"#)
            ],
            keyInsight: "三倍角来自和角公式和倍角公式的连续使用。",
            shortcutInsight: "拆成 2x+x 后统一主元。",
            weapon: "三倍角推导模板",
            timeRatio: 2.2,
            tags: ["三角函数", "三倍角", "恒等证明", "代表题"]
        ),

        trigProblem(
            id: "trig_012",
            type: .proof,
            tier: 4,
            formulaIds: ["double_angle"],
            content: "证明并求值：cos20°·cos40°·cos80°=1/8。",
            contentLatex: #"\cos20^\circ\cos40^\circ\cos80^\circ=\frac18"#,
            answer: "1/8",
            difficulty: 0.72,
            averageTime: 180,
            hints: ["乘上sin20°", "连续使用2sinθcosθ=sin2θ"],
            standardSteps: [
                step(1, "设乘积", #"P=\cos20^\circ\cos40^\circ\cos80^\circ"#),
                step(2, "补sin20°", #"2\sin20^\circ P=\sin40^\circ\cos40^\circ\cos80^\circ"#),
                step(3, "连续倍角", #"=\frac12\sin80^\circ\cos80^\circ=\frac14\sin160^\circ"#),
                step(4, "回到sin20°", #"\sin160^\circ=\sin20^\circ\Rightarrow P=\frac18"#)
            ],
            shortcutSteps: [
                step(1, "倍角乘积公式", #"\cos\theta\cos2\theta\cos4\theta=\frac{\sin8\theta}{8\sin\theta}"#),
                step(2, "代入θ=20°", #"\frac{\sin160^\circ}{8\sin20^\circ}=\frac18"#)
            ],
            keyInsight: "连续倍角乘积用补sinθ形成望远镜。",
            shortcutInsight: "cosθcos2θcos4θ 是固定模板。",
            weapon: "倍角乘积望远镜",
            timeRatio: 3.0,
            tags: ["三角函数", "特殊角", "倍角公式", "代表题"]
        ),

        trigProblem(
            id: "trig_013",
            type: .calculation,
            tier: 4,
            formulaIds: ["sum_to_product"],
            content: "求 sin20°+sin40°+sin80° 的值。",
            contentLatex: #"\sin20^\circ+\sin40^\circ+\sin80^\circ"#,
            answer: "√3",
            difficulty: 0.70,
            averageTime: 170,
            hints: ["利用上一类特殊角组", "乘以2sin20°或和差化积"],
            standardSteps: [
                step(1, "记三倍角结构", #"\sin60^\circ=3\sin20^\circ-4\sin^320^\circ"#),
                step(2, "用倍角乘积关联", #"\cos20^\circ\cos40^\circ\cos80^\circ=\frac18"#),
                step(3, "特殊角组化简", #"\sin20^\circ+\sin40^\circ+\sin80^\circ=\sqrt3"#)
            ],
            shortcutSteps: [
                step(1, "20-40-80模板", #"\sin20^\circ+\sin40^\circ+\sin80^\circ=\sqrt3"#),
                step(2, "代表性记忆", #"该角组与三倍角、倍角乘积同时闭合"#)
            ],
            keyInsight: "20°、40°、80°是高考三角恒等变换的经典角组。",
            shortcutInsight: "特殊角组可以作为公式链模板记忆。",
            weapon: "20-40-80角组模板",
            timeRatio: 3.0,
            tags: ["三角函数", "特殊角", "和差化积", "代表题"]
        ),

        trigProblem(
            id: "trig_014",
            type: .calculation,
            tier: 4,
            formulaIds: ["sum_to_product"],
            content: "求方程 sinx+sin3x+sin5x=0 在 [0,π] 内的所有解。",
            contentLatex: #"\sin x+\sin3x+\sin5x=0,\quad x\in[0,\pi]"#,
            answer: "0, π/3, 2π/3, π",
            difficulty: 0.74,
            averageTime: 200,
            hints: ["合并sinx和sin5x", "提取sin3x"],
            standardSteps: [
                step(1, "和差化积", #"\sin x+\sin5x=2\sin3x\cos2x"#),
                step(2, "因式分解", #"\sin3x(2\cos2x+1)=0"#),
                step(3, "解第一支", #"\sin3x=0\Rightarrow x=0,\frac\pi3,\frac{2\pi}{3},\pi"#),
                step(4, "第二支无新增", #"2\cos2x+1=0给x=\frac\pi3,\frac{2\pi}{3},已包含"#)
            ],
            shortcutSteps: [
                step(1, "等差三项秒分解", #"\sin x+\sin3x+\sin5x=\sin3x(2\cos2x+1)"#),
                step(2, "去重列解", #"x=0,\frac\pi3,\frac{2\pi}{3},\pi"#)
            ],
            keyInsight: "五倍角跨度的三项和仍然以中间角为核心。",
            shortcutInsight: "首尾配对后再去重。",
            weapon: "等差角因式分解",
            timeRatio: 2.6,
            tags: ["三角函数", "三角方程", "和差化积", "综合"]
        ),

        trigProblem(
            id: "trig_015",
            type: .calculation,
            tier: 4,
            formulaIds: ["cos_double", "sum_to_product"],
            content: "求方程 cos4x=cos2x 在 [0,π] 内的所有解。",
            contentLatex: #"\cos4x=\cos2x,\quad x\in[0,\pi]"#,
            answer: "0, π/3, 2π/3, π",
            difficulty: 0.70,
            averageTime: 160,
            hints: ["移项后用cosA-cosB", "或令2x为整体"],
            standardSteps: [
                step(1, "移项", #"\cos4x-\cos2x=0"#),
                step(2, "和差化积", #"-2\sin3x\sin x=0"#),
                step(3, "分别求解", #"\sin x=0\Rightarrow x=0,\pi;\quad \sin3x=0\Rightarrow x=0,\frac\pi3,\frac{2\pi}{3},\pi"#),
                step(4, "合并", #"x=0,\frac\pi3,\frac{2\pi}{3},\pi"#)
            ],
            shortcutSteps: [
                step(1, "余弦相等公式", #"\cos A=\cos B\Rightarrow A=\pm B+2k\pi"#),
                step(2, "代入筛选", #"4x=\pm2x+2k\pi\Rightarrow x=0,\frac\pi3,\frac{2\pi}{3},\pi"#)
            ],
            keyInsight: "余弦方程既可和差化积，也可用角相等通解。",
            shortcutInsight: "cosA=cosB 的通解比展开更快。",
            weapon: "余弦方程通解",
            timeRatio: 2.4,
            tags: ["三角函数", "三角方程", "和差化积", "综合"]
        ),

        trigProblem(
            id: "trig_016",
            type: .calculation,
            tier: 5,
            formulaIds: ["cosine_rule", "tri_area_base"],
            content: "△ABC中，A=60°，b+c=10，面积S=6√3，求a。",
            contentLatex: #"A=60^\circ,\quad b+c=10,\quad S=6\sqrt3"#,
            answer: "2√7",
            difficulty: 0.78,
            averageTime: 220,
            hints: ["由面积求bc", "A=60°时a²=b²+c²-bc"],
            standardSteps: [
                step(1, "面积求积", #"S=\frac12bc\sin60^\circ=\frac{\sqrt3}{4}bc=6\sqrt3\Rightarrow bc=24"#),
                step(2, "余弦定理", #"a^2=b^2+c^2-bc"#),
                step(3, "和积转化", #"b^2+c^2=(b+c)^2-2bc=100-48=52"#),
                step(4, "求边", #"a^2=52-24=28\Rightarrow a=2\sqrt7"#)
            ],
            shortcutSteps: [
                step(1, "60度夹角合式", #"a^2=(b+c)^2-3bc"#),
                step(2, "面积定积", #"bc=24\Rightarrow a^2=100-72=28"#)
            ],
            keyInsight: "解三角形综合题常先由面积定bc，再用余弦定理。",
            shortcutInsight: "A=60°时 a²=(b+c)²-3bc。",
            weapon: "和积转边长",
            timeRatio: 2.8,
            tags: ["解三角形", "余弦定理", "面积", "压轴"]
        ),

        trigProblem(
            id: "trig_017",
            type: .calculation,
            tier: 5,
            formulaIds: ["cosine_rule", "tri_area_base"],
            content: "△ABC中，a=4，b=5，面积S=5√3，求第三边c的所有可能值。",
            contentLatex: #"a=4,\quad b=5,\quad S=5\sqrt3"#,
            answer: "√21 或 √61",
            difficulty: 0.80,
            averageTime: 240,
            hints: ["面积先求sinC", "C可能是60°或120°"],
            standardSteps: [
                step(1, "面积求正弦", #"S=\frac12ab\sin C=10\sin C=5\sqrt3\Rightarrow \sin C=\frac{\sqrt3}{2}"#),
                step(2, "保留二义性", #"C=60^\circ\ \text{或}\ 120^\circ"#),
                step(3, "余弦定理", #"c^2=a^2+b^2-2ab\cos C"#),
                step(4, "分别计算", #"C=60^\circ:c^2=21;\quad C=120^\circ:c^2=61"#)
            ],
            shortcutSteps: [
                step(1, "面积读角", #"\sin C=\frac{\sqrt3}{2}\Rightarrow C=60^\circ或120^\circ"#),
                step(2, "60/120模板", #"c^2=16+25\mp20=21或61"#)
            ],
            keyInsight: "由面积得到的是sinC，锐角和钝角两支都要检查。",
            shortcutInsight: "面积给正弦，余弦定理要分支。",
            weapon: "解三角形二义性",
            timeRatio: 2.8,
            tags: ["解三角形", "二义性", "面积", "压轴"]
        ),

        trigProblem(
            id: "trig_018",
            type: .calculation,
            tier: 5,
            formulaIds: ["sine_rule", "tri_area_base"],
            content: "△ABC中，sinA:sinB:sinC=5:6:7，周长为36，求面积S。",
            contentLatex: #"\sin A:\sin B:\sin C=5:6:7,\quad a+b+c=36"#,
            answer: "24√6",
            difficulty: 0.78,
            averageTime: 220,
            hints: ["正弦比等于边比", "边长为10,12,14", "用海伦或余弦面积法"],
            standardSteps: [
                step(1, "正弦定理转边比", #"a:b:c=5:6:7"#),
                step(2, "由周长定边", #"a=10,\quad b=12,\quad c=14"#),
                step(3, "海伦公式", #"s=18,\quad S=\sqrt{18\cdot8\cdot6\cdot4}"#),
                step(4, "化简", #"S=24\sqrt6"#)
            ],
            shortcutSteps: [
                step(1, "边比秒定", #"\sin比=边比,\quad 5:6:7\Rightarrow 10:12:14"#),
                step(2, "海伦模板", #"S=\sqrt{18\cdot8\cdot6\cdot4}=24\sqrt6"#)
            ],
            keyInsight: "正弦定理能把角信息直接转换成边信息。",
            shortcutInsight: "先转边比，问题立刻从三角函数变成几何面积。",
            weapon: "正弦比转边比",
            timeRatio: 2.5,
            tags: ["解三角形", "正弦定理", "面积", "综合"]
        ),

        trigProblem(
            id: "trig_019",
            type: .calculation,
            tier: 5,
            formulaIds: ["sine_rule", "tri_area_base"],
            content: "△ABC中，sinA:sinB:sinC=3:5:7，周长为30，求面积S。",
            contentLatex: #"\sin A:\sin B:\sin C=3:5:7,\quad a+b+c=30"#,
            answer: "15√3",
            difficulty: 0.80,
            averageTime: 240,
            hints: ["先转为边比", "边长为6,10,14", "海伦公式"],
            standardSteps: [
                step(1, "正弦定理转边比", #"a:b:c=3:5:7"#),
                step(2, "周长定边", #"a=6,\quad b=10,\quad c=14"#),
                step(3, "半周长", #"s=15"#),
                step(4, "海伦公式", #"S=\sqrt{15\cdot9\cdot5\cdot1}=15\sqrt3"#)
            ],
            shortcutSteps: [
                step(1, "从角比降到边比", #"3:5:7,\ p=30\Rightarrow 6,10,14"#),
                step(2, "一行海伦", #"S=\sqrt{15\cdot9\cdot5}=15\sqrt3"#)
            ],
            keyInsight: "正弦比题的本质是边比题。",
            shortcutInsight: "边比一旦确定，面积不必求角。",
            weapon: "正弦定理降维",
            timeRatio: 2.5,
            tags: ["解三角形", "正弦定理", "海伦公式", "综合"]
        ),

        trigProblem(
            id: "trig_020",
            type: .calculation,
            tier: 5,
            formulaIds: ["sine_rule"],
            content: "△ABC的外接圆半径R=5，a=5√3，b=5，求角C的所有可能值。",
            contentLatex: #"R=5,\quad a=5\sqrt3,\quad b=5"#,
            answer: "30° 或 90°",
            difficulty: 0.80,
            averageTime: 220,
            hints: ["a=2RsinA", "b=2RsinB", "保留二义性后用角和筛选"],
            standardSteps: [
                step(1, "正弦定理", #"2R=10,\quad \sin A=\frac{a}{2R}=\frac{\sqrt3}{2},\quad \sin B=\frac12"#),
                step(2, "列可能角", #"A=60^\circ或120^\circ,\quad B=30^\circ或150^\circ"#),
                step(3, "角和筛选", #"(A,B)=(60^\circ,30^\circ)\Rightarrow C=90^\circ;\quad (120^\circ,30^\circ)\Rightarrow C=30^\circ"#),
                step(4, "排除不合法组合", #"B=150^\circ时角和超过180^\circ"#)
            ],
            shortcutSteps: [
                step(1, "由边读正弦", #"\sin A=\frac{\sqrt3}{2},\quad \sin B=\frac12"#),
                step(2, "二义性筛选", #"C=90^\circ或30^\circ"#)
            ],
            keyInsight: "正弦定理给角时必须保留二义性。",
            shortcutInsight: "先列可能角，再用内角和秒筛。",
            weapon: "正弦定理二义性筛选",
            timeRatio: 2.7,
            tags: ["解三角形", "正弦定理", "外接圆", "压轴"]
        ),

        trigProblem(
            id: "trig_021",
            type: .calculation,
            tier: 4,
            formulaIds: ["cosine_rule", "tri_area_base"],
            content: "△ABC中，a²=b²+c²+bc，且面积S=16√3，求bc与角A。",
            contentLatex: #"a^2=b^2+c^2+bc,\quad S=16\sqrt3"#,
            answer: "bc=64, A=120°",
            difficulty: 0.74,
            averageTime: 180,
            hints: ["对比余弦定理", "a²=b²+c²-2bc cosA"],
            standardSteps: [
                step(1, "对比余弦定理", #"b^2+c^2-2bc\cos A=b^2+c^2+bc"#),
                step(2, "求角", #"-2\cos A=1\Rightarrow \cos A=-\frac12\Rightarrow A=120^\circ"#),
                step(3, "面积公式", #"S=\frac12bc\sin120^\circ=\frac{\sqrt3}{4}bc=16\sqrt3"#),
                step(4, "求积", #"bc=64"#)
            ],
            shortcutSteps: [
                step(1, "余弦定理反读", #"a^2=b^2+c^2+bc\Rightarrow A=120^\circ"#),
                step(2, "面积定积", #"\frac{\sqrt3}{4}bc=16\sqrt3\Rightarrow bc=64"#)
            ],
            keyInsight: "边的二次关系可以直接反推出夹角。",
            shortcutInsight: "+bc 对应 120°，-bc 对应 60°。",
            weapon: "余弦定理反读角",
            timeRatio: 2.4,
            tags: ["解三角形", "余弦定理", "面积", "综合"]
        ),

        trigProblem(
            id: "trig_022",
            type: .calculation,
            tier: 5,
            formulaIds: ["cosine_rule"],
            content: "△ABC中，A=60°，b+c=10，求边a的取值范围。",
            contentLatex: #"A=60^\circ,\quad b+c=10,\quad a的取值范围"#,
            answer: "[5, 10)",
            difficulty: 0.78,
            averageTime: 220,
            hints: ["a²=(b+c)²-3bc", "bc≤25且bc>0"],
            standardSteps: [
                step(1, "60度余弦定理", #"a^2=b^2+c^2-bc=(b+c)^2-3bc"#),
                step(2, "代入和", #"a^2=100-3bc"#),
                step(3, "利用积的范围", #"0<bc\le25"#),
                step(4, "得到边长范围", #"25\le a^2<100\Rightarrow a\in[5,10)"#)
            ],
            shortcutSteps: [
                step(1, "固定和控积", #"a^2=100-3bc,\quad bc\in(0,25]"#),
                step(2, "反向读范围", #"a_{\min}=5,\quad a<10"#)
            ],
            keyInsight: "固定两边和与夹角时，第三边由bc控制。",
            shortcutInsight: "A=60°下 a²=(b+c)²-3bc。",
            weapon: "定和定角控边",
            timeRatio: 2.6,
            tags: ["解三角形", "余弦定理", "范围", "压轴"]
        ),

        trigProblem(
            id: "trig_023",
            type: .calculation,
            tier: 4,
            formulaIds: ["cosine_rule", "tri_area_base"],
            content: "△ABC中，b=7，c=8，A=60°，求a和面积S。",
            contentLatex: #"b=7,\quad c=8,\quad A=60^\circ"#,
            answer: "a=√57, S=14√3",
            difficulty: 0.68,
            averageTime: 160,
            hints: ["A是b,c的夹角", "60°模板"],
            standardSteps: [
                step(1, "余弦定理", #"a^2=7^2+8^2-2\cdot7\cdot8\cos60^\circ=57"#),
                step(2, "求边", #"a=\sqrt{57}"#),
                step(3, "面积", #"S=\frac12\cdot7\cdot8\cdot\sin60^\circ=14\sqrt3"#)
            ],
            shortcutSteps: [
                step(1, "60度模板", #"a^2=b^2+c^2-bc=49+64-56=57"#),
                step(2, "面积模板", #"S=\frac{\sqrt3}{4}bc=14\sqrt3"#)
            ],
            keyInsight: "两边夹角模型是余弦定理和面积公式的组合。",
            shortcutInsight: "60度时公式可以直接模板化。",
            weapon: "60度夹角模板",
            timeRatio: 2.0,
            tags: ["解三角形", "余弦定理", "面积", "代表题"]
        ),

        trigProblem(
            id: "trig_024",
            type: .proof,
            tier: 4,
            formulaIds: ["cosine_rule"],
            content: "△ABC中，若a²=b²+c²-bc，证明A=60°。",
            contentLatex: #"a^2=b^2+c^2-bc\Rightarrow A=60^\circ"#,
            answer: "A=60°",
            difficulty: 0.66,
            averageTime: 140,
            hints: ["与余弦定理对比", "b,c为正"],
            standardSteps: [
                step(1, "写出余弦定理", #"a^2=b^2+c^2-2bc\cos A"#),
                step(2, "与条件比较", #"-2bc\cos A=-bc"#),
                step(3, "消去bc", #"\cos A=\frac12"#),
                step(4, "内角范围", #"A\in(0,\pi)\Rightarrow A=60^\circ"#)
            ],
            shortcutSteps: [
                step(1, "公式反读", #"a^2=b^2+c^2-bc\quad \text{就是}\quad \cos A=\frac12"#),
                step(2, "直接得角", #"A=60^\circ"#)
            ],
            keyInsight: "余弦定理可以正用求边，也可以反用读角。",
            shortcutInsight: "-bc 就是 60° 的指纹。",
            weapon: "余弦定理指纹识别",
            timeRatio: 2.2,
            tags: ["解三角形", "余弦定理", "证明", "代表题"]
        ),

        trigProblem(
            id: "trig_025",
            type: .calculation,
            tier: 5,
            formulaIds: ["circle_eq", "dist_formula"],
            content: "动点P(cosθ,sinθ)在单位圆上，求P到直线x+y=1的距离d的取值范围。",
            contentLatex: #"P(\cos\theta,\sin\theta),\quad d=\frac{|\cos\theta+\sin\theta-1|}{\sqrt2}"#,
            answer: "[0, (√2+1)/√2]",
            difficulty: 0.76,
            averageTime: 200,
            hints: ["令t=cosθ+sinθ", "t∈[-√2,√2]", "距离是|t-1|/√2"],
            standardSteps: [
                step(1, "点线距离", #"d=\frac{|\cos\theta+\sin\theta-1|}{\sqrt2}"#),
                step(2, "整体范围", #"t=\cos\theta+\sin\theta\in[-\sqrt2,\sqrt2]"#),
                step(3, "绝对值范围", #"|t-1|_{\min}=0,\quad |t-1|_{\max}=1+\sqrt2"#),
                step(4, "除以√2", #"d\in[0,\frac{\sqrt2+1}{\sqrt2}]"#)
            ],
            shortcutSteps: [
                step(1, "距离整体化", #"d=\frac{|t-1|}{\sqrt2},\quad t\in[-\sqrt2,\sqrt2]"#),
                step(2, "端点秒读", #"d_{\min}=0,\quad d_{\max}=\frac{\sqrt2+1}{\sqrt2}"#)
            ],
            keyInsight: "单位圆上的线性表达式仍然是辅助角值域。",
            shortcutInsight: "解析几何距离问题可降成三角整体值域。",
            weapon: "单位圆线性化",
            timeRatio: 2.6,
            tags: ["三角函数", "解析几何", "距离", "综合"]
        ),

        trigProblem(
            id: "trig_026",
            type: .calculation,
            tier: 4,
            formulaIds: ["vector_dot", "double_angle"],
            content: "向量u=(sinx,cosx)，v=(cosx,sinx)。若|u+v|=√3，求sin2x。",
            contentLatex: #"u=(\sin x,\cos x),\quad v=(\cos x,\sin x),\quad |u+v|=\sqrt3"#,
            answer: "1/2",
            difficulty: 0.68,
            averageTime: 140,
            hints: ["平方向量模", "u·v=sin2x"],
            standardSteps: [
                step(1, "平方模长", #"|u+v|^2=|u|^2+|v|^2+2u\cdot v"#),
                step(2, "计算点积", #"|u|=|v|=1,\quad u\cdot v=2\sin x\cos x=\sin2x"#),
                step(3, "代入条件", #"3=2+2\sin2x"#),
                step(4, "求值", #"\sin2x=\frac12"#)
            ],
            shortcutSteps: [
                step(1, "向量夹角秒杀", #"|u+v|^2=2+2\sin2x=3"#),
                step(2, "直接得", #"\sin2x=\frac12"#)
            ],
            keyInsight: "向量模长条件常把三角问题变成点积问题。",
            shortcutInsight: "先平方模长，sin2x自然出现。",
            weapon: "向量点积转三角",
            timeRatio: 2.3,
            tags: ["三角函数", "向量", "点积", "综合"]
        ),

        trigProblem(
            id: "trig_027",
            type: .calculation,
            tier: 5,
            formulaIds: ["sin_add"],
            content: "若方程 (sinx+cosx)²=a 在 [0,2π) 内有四个不同解，求a的取值范围。",
            contentLatex: #"(\sin x+\cos x)^2=a,\quad x\in[0,2\pi)"#,
            answer: "(0, 2)",
            difficulty: 0.76,
            averageTime: 190,
            hints: ["sinx+cosx=√2sin(x+π/4)", "端点和0会减少解数"],
            standardSteps: [
                step(1, "辅助角", #"(\sin x+\cos x)^2=2\sin^2(x+\frac\pi4)"#),
                step(2, "基本范围", #"0\le a\le2"#),
                step(3, "分析解数", #"a=0时只有2解,\quad a=2时只有2解"#),
                step(4, "四解条件", #"0<a<2"#)
            ],
            shortcutSteps: [
                step(1, "平方后看振幅", #"(\sin x+\cos x)^2\in[0,2]"#),
                step(2, "排除极值", #"四个不同解要求不取最大和最小\Rightarrow a\in(0,2)"#)
            ],
            keyInsight: "完整周期内，非极值水平线通常给四个平方解。",
            shortcutInsight: "解数题先看端点是否退化。",
            weapon: "三角方程解数判别",
            timeRatio: 2.5,
            tags: ["三角函数", "参数范围", "解数", "压轴"]
        ),

        trigProblem(
            id: "trig_028",
            type: .calculation,
            tier: 4,
            formulaIds: ["double_angle"],
            content: "求方程 sinx+cosx=1+sinxcosx 在 [0,2π) 内的解。",
            contentLatex: #"\sin x+\cos x=1+\sin x\cos x,\quad x\in[0,2\pi)"#,
            answer: "0, π/2",
            difficulty: 0.72,
            averageTime: 180,
            hints: ["令t=sinx+cosx", "sinxcosx=(t²-1)/2"],
            standardSteps: [
                step(1, "整体换元", #"t=\sin x+\cos x,\quad \sin x\cos x=\frac{t^2-1}{2}"#),
                step(2, "转化方程", #"t=1+\frac{t^2-1}{2}\Rightarrow (t-1)^2=0"#),
                step(3, "回代", #"\sin x+\cos x=1"#),
                step(4, "求解", #"\sqrt2\sin(x+\frac\pi4)=1\Rightarrow x=0,\frac\pi2"#)
            ],
            shortcutSteps: [
                step(1, "整体一元化", #"t=1+\frac{t^2-1}{2}\Rightarrow t=1"#),
                step(2, "特殊角", #"\sin x+\cos x=1\Rightarrow x=0,\frac\pi2"#)
            ],
            keyInsight: "含sinx+cosx和sinxcosx的方程优先整体换元。",
            shortcutInsight: "方程直接降为(t-1)²=0。",
            weapon: "整体换元解方程",
            timeRatio: 2.7,
            tags: ["三角函数", "三角方程", "整体换元", "综合"]
        ),

        trigProblem(
            id: "trig_029",
            type: .calculation,
            tier: 4,
            formulaIds: ["double_angle"],
            content: "求方程 sin2x=sinx+cosx-1 在 [0,2π) 内的所有解。",
            contentLatex: #"\sin2x=\sin x+\cos x-1,\quad x\in[0,2\pi)"#,
            answer: "0, π/2, 3π/4, 7π/4",
            difficulty: 0.72,
            averageTime: 180,
            hints: ["令t=sinx+cosx", "sin2x=t²-1"],
            standardSteps: [
                step(1, "整体换元", #"t=\sin x+\cos x,\quad \sin2x=t^2-1"#),
                step(2, "转化方程", #"t^2-1=t-1\Rightarrow t(t-1)=0"#),
                step(3, "分支求解", #"t=1\Rightarrow x=0,\frac\pi2"#),
                step(4, "另一分支", #"t=0\Rightarrow x=\frac{3\pi}{4},\frac{7\pi}{4}"#)
            ],
            shortcutSteps: [
                step(1, "sin2x整体化", #"\sin2x=(\sin x+\cos x)^2-1"#),
                step(2, "一元分解", #"t^2-1=t-1\Rightarrow t=0或1"#)
            ],
            keyInsight: "sin2x可以由sinx+cosx的平方表示。",
            shortcutInsight: "把三角方程变成 t(t-1)=0。",
            weapon: "sin2x整体替换",
            timeRatio: 2.6,
            tags: ["三角函数", "三角方程", "整体换元", "综合"]
        ),

        trigProblem(
            id: "trig_030",
            type: .calculation,
            tier: 4,
            formulaIds: ["cos_double"],
            content: "求方程 cos⁴x-sin⁴x=1/2 在 [0,2π) 内的所有解。",
            contentLatex: #"\cos^4x-\sin^4x=\frac12,\quad x\in[0,2\pi)"#,
            answer: "π/6, 5π/6, 7π/6, 11π/6",
            difficulty: 0.70,
            averageTime: 170,
            hints: ["四次差先平方差", "cos²x+sin²x=1"],
            standardSteps: [
                step(1, "平方差降阶", #"\cos^4x-\sin^4x=(\cos^2x-\sin^2x)(\cos^2x+\sin^2x)=\cos2x"#),
                step(2, "基本方程", #"\cos2x=\frac12"#),
                step(3, "求解", #"2x=\frac\pi3,\frac{5\pi}{3}\pmod{2\pi}"#),
                step(4, "列出区间解", #"x=\frac\pi6,\frac{5\pi}{6},\frac{7\pi}{6},\frac{11\pi}{6}"#)
            ],
            shortcutSteps: [
                step(1, "四次式秒降", #"\cos^4x-\sin^4x=\cos2x"#),
                step(2, "解cos2x", #"\cos2x=\frac12"#)
            ],
            keyInsight: "四次差不要展开，平方差能直接降到二倍角。",
            shortcutInsight: "cos⁴x-sin⁴x 是 cos2x 的伪装。",
            weapon: "平方差降阶",
            timeRatio: 2.6,
            tags: ["三角函数", "高次式", "三角方程", "综合"]
        ),

        trigProblem(
            id: "trig_031",
            type: .calculation,
            tier: 5,
            formulaIds: ["sin_add"],
            content: "求方程 4sin³x-3sinx=1/2 在 [0,π] 内的所有解。",
            contentLatex: #"4\sin^3x-3\sin x=\frac12,\quad x\in[0,\pi]"#,
            answer: "7π/18, 11π/18",
            difficulty: 0.78,
            averageTime: 210,
            hints: ["用sin3x=3sinx-4sin³x", "转成sin3x=-1/2"],
            standardSteps: [
                step(1, "三倍角反用", #"4\sin^3x-3\sin x=-\sin3x"#),
                step(2, "转方程", #"\sin3x=-\frac12"#),
                step(3, "区间变换", #"x\in[0,\pi]\Rightarrow 3x\in[0,3\pi]"#),
                step(4, "求解", #"3x=\frac{7\pi}{6},\frac{11\pi}{6}\Rightarrow x=\frac{7\pi}{18},\frac{11\pi}{18}"#)
            ],
            shortcutSteps: [
                step(1, "三倍角一眼识别", #"4s^3-3s=-\sin3x"#),
                step(2, "特殊角回代", #"\sin3x=-\frac12\Rightarrow x=\frac{7\pi}{18},\frac{11\pi}{18}"#)
            ],
            keyInsight: "三次三角多项式常是三倍角公式的反向使用。",
            shortcutInsight: "看到4s³-3s，立刻还原cos/ sin三倍角。",
            weapon: "三倍角反用",
            timeRatio: 3.0,
            tags: ["三角函数", "三倍角", "三角方程", "压轴"]
        ),

        trigProblem(
            id: "trig_032",
            type: .calculation,
            tier: 5,
            formulaIds: ["cos_add"],
            content: "求方程 4cos³x-3cosx=0 在 [0,2π) 内的所有解。",
            contentLatex: #"4\cos^3x-3\cos x=0,\quad x\in[0,2\pi)"#,
            answer: "π/6, π/2, 5π/6, 7π/6, 3π/2, 11π/6",
            difficulty: 0.76,
            averageTime: 200,
            hints: ["识别cos3x", "cos3x=4cos³x-3cosx"],
            standardSteps: [
                step(1, "三倍角反用", #"4\cos^3x-3\cos x=\cos3x"#),
                step(2, "转方程", #"\cos3x=0"#),
                step(3, "求通解", #"3x=\frac\pi2+k\pi"#),
                step(4, "列出区间解", #"x=\frac\pi6,\frac\pi2,\frac{5\pi}{6},\frac{7\pi}{6},\frac{3\pi}{2},\frac{11\pi}{6}"#)
            ],
            shortcutSteps: [
                step(1, "三倍角识别", #"4c^3-3c=\cos3x"#),
                step(2, "周期均分", #"x=\frac\pi6+\frac{k\pi}{3},\quad k=0,\dots,5"#)
            ],
            keyInsight: "cos三倍角能把三次方程变成一次角方程。",
            shortcutInsight: "三倍角方程的解按π/3均匀分布。",
            weapon: "余弦三倍角降维",
            timeRatio: 2.8,
            tags: ["三角函数", "三倍角", "三角方程", "压轴"]
        ),

        trigProblem(
            id: "trig_033",
            type: .calculation,
            tier: 5,
            formulaIds: ["double_angle"],
            content: "求 f(x)=sin⁴x+cos⁴x+sin2x 的值域。",
            contentLatex: #"f(x)=\sin^4x+\cos^4x+\sin2x"#,
            answer: "[-1/2, 3/2]",
            difficulty: 0.78,
            averageTime: 220,
            hints: ["sin⁴+cos⁴=1-2sin²xcos²x", "令y=sin2x"],
            standardSteps: [
                step(1, "降幂", #"\sin^4x+\cos^4x=(\sin^2x+\cos^2x)^2-2\sin^2x\cos^2x=1-\frac12\sin^22x"#),
                step(2, "令y=sin2x", #"y\in[-1,1],\quad f=1-\frac12y^2+y"#),
                step(3, "二次函数", #"f=-\frac12(y-1)^2+\frac32"#),
                step(4, "区间取值", #"f_{\max}=\frac32,\quad f_{\min}=f(-1)=-\frac12"#)
            ],
            shortcutSteps: [
                step(1, "高次降成y", #"y=\sin2x,\quad f=1-\frac12y^2+y"#),
                step(2, "抛物线读范围", #"y\in[-1,1]\Rightarrow f\in[-\frac12,\frac32]"#)
            ],
            keyInsight: "四次三角式常可降成sin2x上的二次函数。",
            shortcutInsight: "先降幂再把sin2x当普通变量。",
            weapon: "四次降幂主元法",
            timeRatio: 3.0,
            tags: ["三角函数", "高次式", "值域", "压轴"]
        ),

        trigProblem(
            id: "trig_034",
            type: .calculation,
            tier: 5,
            formulaIds: ["tan_add"],
            content: "已知 α+β=π/4，且tanα·tanβ=1/3，求tanα+tanβ。",
            contentLatex: #"\alpha+\beta=\frac\pi4,\quad \tan\alpha\tan\beta=\frac13"#,
            answer: "2/3",
            difficulty: 0.72,
            averageTime: 150,
            hints: ["设S=tanα+tanβ", "反用tan(α+β)=1"],
            standardSteps: [
                step(1, "设和与积", #"S=\tan\alpha+\tan\beta,\quad P=\tan\alpha\tan\beta=\frac13"#),
                step(2, "正切和角", #"\tan(\alpha+\beta)=\frac{S}{1-P}=1"#),
                step(3, "求S", #"S=1-P=\frac23"#)
            ],
            shortcutSteps: [
                step(1, "公式反用", #"\frac{\tan\alpha+\tan\beta}{1-\frac13}=1"#),
                step(2, "直接得", #"\tan\alpha+\tan\beta=\frac23"#)
            ],
            keyInsight: "正切和角公式可反向求和，不必求两个角。",
            shortcutInsight: "把tanα+tanβ作为整体。",
            weapon: "正切和角反用",
            timeRatio: 2.3,
            tags: ["三角函数", "正切", "整体思想", "综合"]
        ),

        trigProblem(
            id: "trig_035",
            type: .calculation,
            tier: 5,
            formulaIds: ["sine_rule"],
            content: "△ABC中，a:b=√3:1，A=60°，求角B，并说明为何没有第二解。",
            contentLatex: #"a:b=\sqrt3:1,\quad A=60^\circ"#,
            answer: "B=30°",
            difficulty: 0.74,
            averageTime: 160,
            hints: ["正弦定理转为sinA/sinB", "检查B=150°是否可能"],
            standardSteps: [
                step(1, "正弦定理", #"\frac{\sin A}{\sin B}=\frac{a}{b}=\sqrt3"#),
                step(2, "求sinB", #"\sin B=\frac{\sin60^\circ}{\sqrt3}=\frac12"#),
                step(3, "列候选", #"B=30^\circ\ \text{或}\ 150^\circ"#),
                step(4, "排除第二解", #"A+B=60^\circ+150^\circ>180^\circ,\quad 故B=30^\circ"#)
            ],
            shortcutSteps: [
                step(1, "边比转角", #"\sin B=\frac12"#),
                step(2, "内角和筛选", #"150^\circ不合法\Rightarrow B=30^\circ"#)
            ],
            keyInsight: "正弦定理产生二义性后，必须用内角和筛选。",
            shortcutInsight: "SSA题目先列两解，再排不合法分支。",
            weapon: "正弦定理二义性排除",
            timeRatio: 2.2,
            tags: ["解三角形", "正弦定理", "二义性", "综合"]
        )
    ]

    private static func step(_ order: Int, _ description: String, _ latex: String, _ annotation: String = "") -> SolutionStep {
        SolutionStep(order: order, description: description, latex: latex, annotation: annotation)
    }

    private static func trigProblem(
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
        commonMistakes: [String] = ["漏掉三角方程的周期解", "只考虑锐角分支而忽略钝角可能", "把整体换元后的取值范围写错"]
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
