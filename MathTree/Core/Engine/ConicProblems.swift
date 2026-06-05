import Foundation

// MARK: - 圆锥曲线专题 (高考解析几何核心)
// 涵盖: 椭圆、双曲线、抛物线、直线与圆锥曲线、焦点弦、面积最值
// 难度: 0.60-0.95, 高考解答题压轴

extension SampleData {
    static let conicProblems: [Problem] = [

    // ============ 椭圆基础 ============

    Problem(
        id: "conic_001",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["ellipse"],
        content: "椭圆x^2/9+y^2/4=1的焦距为______，离心率为______。",
        contentLatex: "\\frac{x^2}{9}+\\frac{y^2}{4}=1",
        options: nil,
        answer: "2√(5), √(5)/3",
        difficulty: 0.45,
        averageTime: 90,
        hints: ["a^2=9, b^2=4", "c^2=a^2-b^2", "e=c/a"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "基本量", latex: "a^2=9,b^2=4,c^2=9-4=5", annotation: ""),
                SolutionStep(order: 2, description: "焦距", latex: "2c=2√(5)", annotation: ""),
                SolutionStep(order: 3, description: "离心率", latex: "e=\\frac{c}{a}=\\frac{√(5)}{3}", annotation: "")
            ],
            keyInsight: "椭圆基本关系：c^2=a^2-b^2",
            commonMistakes: ["a^2和b^2搞反", "忘记焦距是2c不是c"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "公式法", latex: "c=√(a^2-b^2)=√(5)", annotation: ""),
                    SolutionStep(order: 2, description: "离心率", latex: "e=c/a=√(5)/3", annotation: "")
                ],
                keyInsight: "直接公式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "离心率秒杀", latex: "e=√(1-b^2/a^2)=√(1-4/9)=√(5)/3", annotation: "一步公式")
                ],
                keyInsight: "e=√(1-b^2/a^2) 不需要先求c",
                commonMistakes: []
            ),
            weaponUsed: "离心率直接公式",
            timeRatio: 2.0,
            detailedExplanation: """
                【秒杀公式】
                椭圆：e = √(1 - b^2/a^2)
                双曲线：e = √(1 + b^2/a^2)
                不需要先求c，直接从a,b得e
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "离心率", "填空", "基础"]
    ),

    Problem(
        id: "conic_002",
        type: .calculation,
        tier: 4,
        formulaIds: ["ellipse"],
        content: "已知椭圆过点(1,3/2)且离心率e=√(2)/2，求椭圆方程。",
        contentLatex: "\\text{过}(1,\\frac{3}{2}),\\ e=\\frac{√(2)}{2}",
        options: nil,
        answer: "x^2/4+y^2/2=1",
        difficulty: 0.55,
        averageTime: 180,
        hints: ["e=c/a=√(2)/2", "c^2=a^2/2", "代入点的坐标"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "由离心率", latex: "e=\\frac{c}{a}=\\frac{√(2)}{2} \\Rightarrow c^2=\\frac{a^2}{2}", annotation: ""),
                SolutionStep(order: 2, description: "b^2=a^2-c^2", latex: "b^2=a^2-\\frac{a^2}{2}=\\frac{a^2}{2}", annotation: ""),
                SolutionStep(order: 3, description: "代入点", latex: "\\frac{1}{a^2}+\\frac{9/4}{a^2/2}=1 \\Rightarrow \\frac{1}{a^2}+\\frac{9}{2a^2}=1", annotation: ""),
                SolutionStep(order: 4, description: "解方程", latex: "\\frac{11}{2a^2}=1 \\Rightarrow a^2=\\frac{11}{2}", annotation: ""),
                SolutionStep(order: 5, description: "但验算", latex: "\\frac{1}{11/2}+\\frac{9/4}{11/4}=\\frac{2}{11}+\\frac{9}{11}=1 \\checkmark", annotation: "")
            ],
            keyInsight: "离心率给出a,b,c之间的比例关系，再代点定具体值",
            commonMistakes: ["b^2=a^2/2代入时计算出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设a^2, 由e得b^2", latex: "b^2=a^2/2", annotation: ""),
                    SolutionStep(order: 2, description: "代点解a^2", latex: "1/a^2+9/(2a^2)=1 \\Rightarrow a^2=11/2", annotation: "")
                ],
                keyInsight: "标准方法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "参数化", latex: "b^2=a^2/2,\\ \\text{设}t=1/a^2", annotation: ""),
                    SolutionStep(order: 2, description: "一元方程", latex: "t+\\frac{9}{4} \\cdot 2t=t+\\frac{9t}{2}=\\frac{11t}{2}=1 \\Rightarrow t=\\frac{2}{11}", annotation: "一步到位")
                ],
                keyInsight: "用t=1/a^2换元，减少分式运算",
                commonMistakes: []
            ),
            weaponUsed: "参数化换元",
            timeRatio: 1.5,
            detailedExplanation: """
                【解题流程】
                1. 离心率 → a,b,c的比例关系
                2. 代入已知点 → 确定具体值
                3. 用t=1/a^2换元可简化分式计算
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "求方程", "核心"]
    ),

    // ============ 双曲线 ============

    Problem(
        id: "conic_003",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["hyperbola"],
        content: "双曲线x^2/4-y^2/5=1的渐近线方程为______。",
        contentLatex: "\\frac{x^2}{4}-\\frac{y^2}{5}=1",
        options: nil,
        answer: "y=+-√(5)/2·x",
        difficulty: 0.45,
        averageTime: 60,
        hints: ["渐近线y=+-b/a·x"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "基本量", latex: "a^2=4,b^2=5 \\Rightarrow a=2,b=√(5)", annotation: ""),
                SolutionStep(order: 2, description: "渐近线", latex: "y=\\pm\\frac{√(5)}{2}x", annotation: "")
            ],
            keyInsight: "双曲线x^2/a^2-y^2/b^2=1的渐近线为y=+-b/a·x",
            commonMistakes: ["a和b搞反"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "公式", latex: "y=\\pm\\frac{b}{a}x=\\pm\\frac{√(5)}{2}x", annotation: "")
                ],
                keyInsight: "直接公式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "令右边=0", latex: "\\frac{x^2}{4}-\\frac{y^2}{5}=0 \\Rightarrow y=\\pm\\frac{√(5)}{2}x", annotation: "把1换成0即得渐近线")
                ],
                keyInsight: "双曲线方程右边的1换成0就是渐近线",
                commonMistakes: []
            ),
            weaponUsed: "右边置零法",
            timeRatio: 2.0,
            detailedExplanation: """
                【秒杀】
                x^2/a^2 - y^2/b^2 = 1 → 渐近线：x^2/a^2 - y^2/b^2 = 0
                即 y = +-b/a · x
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "双曲线", "渐近线", "填空", "基础"]
    ),

    Problem(
        id: "conic_004",
        type: .calculation,
        tier: 5,
        formulaIds: ["hyperbola"],
        content: "已知双曲线的渐近线为y=+-2x，且过点(√(5),4)，求双曲线方程。",
        contentLatex: "\\text{渐近线}y=\\pm 2x,\\ \\text{过}(√(5),4)",
        options: nil,
        answer: "x^2-y^2/4=1",
        difficulty: 0.60,
        averageTime: 180,
        hints: ["渐近线y=+-2x → b/a=2或a/b=2", "设x^2/a^2-y^2/b^2=+-1"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "由渐近线", latex: "\\frac{b}{a}=2,\\ b=2a", annotation: "焦点在x轴"),
                SolutionStep(order: 2, description: "设方程", latex: "\\frac{x^2}{a^2}-\\frac{y^2}{4a^2}=1", annotation: ""),
                SolutionStep(order: 3, description: "代入点", latex: "\\frac{5}{a^2}-\\frac{16}{4a^2}=\\frac{5}{a^2}-\\frac{4}{a^2}=\\frac{1}{a^2}=1", annotation: ""),
                SolutionStep(order: 4, description: "得a^2=1", latex: "\\frac{x^2}{1}-\\frac{y^2}{4}=1", annotation: "")
            ],
            keyInsight: "渐近线确定b/a的比值，再用一个点定具体值",
            commonMistakes: ["忘记考虑焦点在y轴的情况"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设b=2a, 代点", latex: "5/a^2-16/4a^2=1 \\Rightarrow a^2=1", annotation: ""),
                    SolutionStep(order: 2, description: "方程", latex: "x^2-y^2/4=1", annotation: "")
                ],
                keyInsight: "标准参数法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设共渐近线系", latex: "\\frac{x^2}{k}-\\frac{y^2}{4k}=1\\ (k>0\\text{或}k<0)", annotation: "一个参数搞定"),
                    SolutionStep(order: 2, description: "代点", latex: "\\frac{5}{k}-\\frac{16}{4k}=\\frac{1}{k}=1 \\Rightarrow k=1", annotation: "秒出")
                ],
                keyInsight: "共渐近线双曲线系：x^2/k-y^2/(4k)=1，只需定k",
                commonMistakes: []
            ),
            weaponUsed: "共渐近线系法",
            timeRatio: 2.0,
            detailedExplanation: """
                【共渐近线系】
                渐近线y=+-mx的双曲线系：x^2/k - y^2/(m^2k) = 1
                只有一个参数k，代入一个点即可确定
                k>0焦点在x轴，k<0焦点在y轴
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "双曲线", "共渐近线系", "核心"]
    ),

    // ============ 抛物线 ============

    Problem(
        id: "conic_005",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["parabola"],
        content: "抛物线y^2=8x的焦点坐标为______，准线方程为______。",
        contentLatex: "y^2=8x",
        options: nil,
        answer: "(2,0), x=-2",
        difficulty: 0.40,
        averageTime: 60,
        hints: ["y^2=2px → 2p=8 → p=4", "焦点(p/2,0)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "基本量", latex: "2p=8 \\Rightarrow p=4", annotation: ""),
                SolutionStep(order: 2, description: "焦点", latex: "(\\frac{p}{2},0)=(2,0)", annotation: ""),
                SolutionStep(order: 3, description: "准线", latex: "x=-\\frac{p}{2}=-2", annotation: "")
            ],
            keyInsight: "y^2=2px的焦点为(p/2,0)，准线x=-p/2",
            commonMistakes: ["p和2p搞混"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "公式", latex: "2p=8,\\ F=(2,0),\\ x=-2", annotation: "")
                ],
                keyInsight: "直接公式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀口诀", latex: "y^2=2px:\\ \\text{系数/2=焦距}", annotation: "8/2=4=2倍焦距，焦点(2,0)")
                ],
                keyInsight: "系数除以2得2倍焦距，再除以2得焦点横坐标",
                commonMistakes: []
            ),
            weaponUsed: "系数除2法",
            timeRatio: 2.0,
            detailedExplanation: """
                【速记】
                y^2 = kx → 焦点 (k/4, 0)，准线 x = -k/4
                y^2=8x → 焦点(2,0)，准线x=-2
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "抛物线", "焦点", "准线", "填空", "基础"]
    ),

    Problem(
        id: "conic_006",
        type: .calculation,
        tier: 5,
        formulaIds: ["parabola"],
        content: "过抛物线y^2=4x焦点的直线l与抛物线交于A、B两点，若|AB|=7，求直线l的斜率。",
        contentLatex: "y^2=4x,\\ |AB|=7",
        options: nil,
        answer: "k=+-4√(3)/3",
        difficulty: 0.65,
        averageTime: 240,
        hints: ["焦点弦长公式|AB|=x_1+x_2+p", "p=2", "韦达定理"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "焦点弦长", latex: "|AB|=x_1+x_2+p=x_1+x_2+2=7", annotation: "焦点弦长公式"),
                SolutionStep(order: 2, description: "得", latex: "x_1+x_2=5", annotation: ""),
                SolutionStep(order: 3, description: "设直线", latex: "x=my+1\\ (\\text{焦点}(1,0))", annotation: "用x关于y的形式"),
                SolutionStep(order: 4, description: "代入抛物线", latex: "y^2=4(my+1) \\Rightarrow y^2-4my-4=0", annotation: ""),
                SolutionStep(order: 5, description: "韦达定理", latex: "y_1+y_2=4m,\\ y_1 y_2=-4", annotation: ""),
                SolutionStep(order: 6, description: "x_1+x_2", latex: "=\\frac{y_1^2+y_2^2}{4}=\\frac{(4m)^2-2(-4)}{4}=4m^2+2=5", annotation: ""),
                SolutionStep(order: 7, description: "解m", latex: "m^2=3/4,\\ m=\\pm\\frac{√(3)}{2},\\ k=1/m=\\pm\\frac{2√(3)}{3}", annotation: "")
            ],
            keyInsight: "焦点弦问题用焦点弦长公式+韦达定理",
            commonMistakes: ["p值算错", "斜率和m的关系搞混"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设直线y=k(x-1)", latex: "\\text{代入}y^2=4x\\text{得到关于x的方程}", annotation: ""),
                    SolutionStep(order: 2, description: "韦达定理", latex: "x_1+x_2=5,\\ \\text{结合}k^2x^2-(2k^2+4)x+k^2=0", annotation: "计算量大")
                ],
                keyInsight: "标准联立法",
                commonMistakes: ["二次方程展开容易出错"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦点弦长公式", latex: "|AB|=\\frac{2p}{\\sin^2\\theta}=\\frac{4}{\\sin^2\\theta}=7", annotation: "极坐标公式"),
                    SolutionStep(order: 2, description: "解角度", latex: "\\sin^2\\theta=4/7,\\ \\tan\\theta=\\pm\\frac{2}{√(3)}", annotation: ""),
                    SolutionStep(order: 3, description: "斜率", latex: "k=\\tan\\theta=\\pm\\frac{2√(3)}{3}", annotation: "")
                ],
                keyInsight: "焦点弦长=2p/sin^2(theta)，theta是直线与x轴夹角",
                commonMistakes: []
            ),
            weaponUsed: "焦点弦极坐标公式",
            timeRatio: 3.0,
            detailedExplanation: """
                【焦点弦万能公式】
                抛物线y^2=2px，过焦点弦长 = 2p/sin^2(theta)
                theta是直线与对称轴的夹角
                不需要联立方程，一步到位
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "抛物线", "焦点弦", "核心"]
    ),

    // ============ 椭圆与直线 ============

    Problem(
        id: "conic_007",
        type: .calculation,
        tier: 5,
        formulaIds: ["ellipse"],
        content: "椭圆x^2/4+y^2/3=1，F_1、F_2为焦点，P为椭圆上一点，若|PF_1|=2，求|PF_2|及角F_1PF_2。",
        contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\ |PF_1|=2",
        options: nil,
        answer: "|PF_2|=2, cos(F_1PF_2)=1/2, 角F_1PF_2=60度",
        difficulty: 0.60,
        averageTime: 200,
        hints: ["|PF_1|+|PF_2|=2a=4", "余弦定理", "|F_1F_2|=2c=2"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "椭圆定义", latex: "|PF_1|+|PF_2|=2a=4 \\Rightarrow |PF_2|=4-2=2", annotation: "a=2"),
                SolutionStep(order: 2, description: "焦距", latex: "c^2=4-3=1,\\ |F_1F_2|=2c=2", annotation: ""),
                SolutionStep(order: 3, description: "余弦定理", latex: "\\cos\\angle F_1PF_2=\\frac{|PF_1|^2+|PF_2|^2-|F_1F_2|^2}{2|PF_1||PF_2|}=\\frac{4+4-4}{2\\times2\\times2}", annotation: ""),
                SolutionStep(order: 4, description: "计算", latex: "=\\frac{4}{8}=\\frac{1}{2}\\Rightarrow \\angle F_1PF_2=60^\\circ", annotation: "三边2,2,2为等边三角形")
            ],
            keyInsight: "椭圆焦点三角形用定义求另一焦半径，再用余弦定理求夹角。",
            commonMistakes: ["忘记|F_1F_2|=2c而非c", "焦半径范围应在[a-c,a+c]=[1,3]内"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "定义求PF_2", latex: "|PF_2|=2a-|PF_1|=4-2=2", annotation: ""),
                    SolutionStep(order: 2, description: "余弦定理", latex: "|F_1F_2|^2=|PF_1|^2+|PF_2|^2-2|PF_1||PF_2|\\cos\\angle\\Rightarrow 4=8-8\\cos\\angle", annotation: ""),
                    SolutionStep(order: 3, description: "解出夹角", latex: "\\cos\\angle F_1PF_2=\\frac{1}{2}\\Rightarrow 60^\\circ", annotation: "")
                ],
                keyInsight: "定义+余弦定理两步求解",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "【秒杀】焦点三角形面积公式反推", latex: "S_{\\triangle F_1PF_2}=b^2\\tan\\frac{\\theta}{2}", annotation: "θ=∠F_1PF_2"),
                    SolutionStep(order: 2, description: "两式联立直接定θ", latex: "\\frac12|PF_1||PF_2|\\sin\\theta=b^2\\tan\\frac{\\theta}{2}\\Rightarrow \\frac12\\cdot4\\sin\\theta=3\\tan\\frac{\\theta}{2}", annotation: "代入|PF_1||PF_2|=4,b^2=3"),
                    SolutionStep(order: 3, description: "解三角方程", latex: "2\\sin\\theta=3\\tan\\frac{\\theta}{2}\\Rightarrow \\theta=60^\\circ", annotation: "得∠F_1PF_2=60°，与余弦定理一致")
                ],
                keyInsight: "记住焦点三角形面积 S=b²·tan(θ/2)，遇到焦半径乘积/夹角问题可绕开余弦定理。",
                commonMistakes: []
            ),
            weaponUsed: "焦点三角形面积公式",
            timeRatio: 2.0,
            detailedExplanation: """
                【焦点三角形公式】
                椭圆中，焦点三角形 △F_1PF_2 的面积 S = b^2 · tan(θ/2)，
                其中 θ = ∠F_1PF_2。
                本题 b^2=3，配合 |PF_1|·|PF_2| 与 S=½|PF_1||PF_2|sinθ 联立，
                可直接定出 θ=60°，与定义+余弦定理结果一致。
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "焦点三角形", "余弦定理", "核心"]
    ),

    Problem(
        id: "conic_008",
        type: .calculation,
        tier: 5,
        formulaIds: ["ellipse"],
        content: "已知椭圆x^2/2+y^2=1，直线y=x+m与椭圆有两个交点，求m的范围。",
        contentLatex: "\\frac{x^2}{2}+y^2=1,\\quad y=x+m",
        options: nil,
        answer: "-√(3)<m<√(3)",
        difficulty: 0.55,
        averageTime: 180,
        hints: ["联立方程", "判别式Delta>0"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "代入", latex: "\\frac{x^2}{2}+(x+m)^2=1", annotation: ""),
                SolutionStep(order: 2, description: "展开", latex: "\\frac{x^2}{2}+x^2+2mx+m^2=1 \\Rightarrow \\frac{3x^2}{2}+2mx+m^2-1=0", annotation: ""),
                SolutionStep(order: 3, description: "即", latex: "3x^2+4mx+2(m^2-1)=0", annotation: ""),
                SolutionStep(order: 4, description: "Delta>0", latex: "16m^2-24(m^2-1)>0 \\Rightarrow -8m^2+24>0 \\Rightarrow m^2<3", annotation: ""),
                SolutionStep(order: 5, description: "结论", latex: "-√(3)<m<√(3)", annotation: "")
            ],
            keyInsight: "直线与椭圆两交点⟺联立后判别式>0",
            commonMistakes: ["展开时系数算错", "不等式方向搞反"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "联立+判别式", latex: "\\Delta=16m^2-24(m^2-1)=24-8m^2>0", annotation: ""),
                    SolutionStep(order: 2, description: "解", latex: "m^2<3 \\Rightarrow |m|<√(3)", annotation: "")
                ],
                keyInsight: "标准判别式法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "几何直觉", latex: "y=x+m\\text{平移, 与椭圆切线时}m=\\pm√(a^2k^2+b^2)", annotation: "切线距离公式"),
                    SolutionStep(order: 2, description: "代入", latex: "m^2<a^2 \\cdot 1+b^2 \\cdot 1=2+1=3", annotation: "k=1")
                ],
                keyInsight: "y=kx+m与x^2/a^2+y^2/b^2=1相切时m^2=a^2k^2+b^2",
                commonMistakes: []
            ),
            weaponUsed: "椭圆切线距离公式",
            timeRatio: 3.0,
            detailedExplanation: """
                【切线判定公式】
                y=kx+m 与 x^2/a^2+y^2/b^2=1
                相切条件：m^2 = a^2k^2 + b^2
                两交点：m^2 < a^2k^2 + b^2
                无交点：m^2 > a^2k^2 + b^2
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "直线", "判别式", "核心"]
    ),

    // ============ 离心率综合 ============

    Problem(
        id: "conic_009",
        type: .calculation,
        tier: 5,
        formulaIds: ["ellipse"],
        content: "椭圆x^2/a^2+y^2/b^2=1(a>b>0)的左焦点F_1(-c,0)，右焦点F_2(c,0)。P为椭圆上的点，满足PF_1垂直于F_1F_2，且|PF_1|=3b^2/(3a)... 简化：若b^2/a=3/2，e=?",
        contentLatex: "\\frac{b^2}{a}=\\frac{3}{2},\\ b^2=a^2-c^2",
        options: nil,
        answer: "需要额外条件",
        difficulty: 0.65,
        averageTime: 240,
        hints: ["半通径=b^2/a", "b^2=a^2-c^2"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "半通径", latex: "\\text{椭圆半通径}l=\\frac{b^2}{a}", annotation: "通过焦点垂直于长轴的弦的一半"),
                SolutionStep(order: 2, description: "利用条件", latex: "\\frac{b^2}{a}=\\frac{a^2-c^2}{a}=a-\\frac{c^2}{a}=a(1-e^2)", annotation: ""),
                SolutionStep(order: 3, description: "若l=3/2", latex: "a(1-e^2)=\\frac{3}{2}", annotation: "需要另一个条件确定a和e")
            ],
            keyInsight: "半通径是圆锥曲线的重要几何量",
            commonMistakes: ["混淆通径和半通径"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "定义法", latex: "l=b^2/a=a(1-e^2)", annotation: ""),
                    SolutionStep(order: 2, description: "需配合其他条件", latex: "\\text{单独一个半通径不能确定e}", annotation: "")
                ],
                keyInsight: "半通径公式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "统一公式", latex: "l=\\frac{b^2}{a}=a(1-e^2)=\\frac{a(1-e)(1+e)}{1}", annotation: ""),
                    SolutionStep(order: 2, description: "焦点弦也可用", latex: "|PF|=\\frac{b^2/a}{1-e\\cos\\theta}=\\frac{l}{1-e\\cos\\theta}", annotation: "极坐标公式")
                ],
                keyInsight: "焦半径极坐标公式统一圆锥曲线",
                commonMistakes: []
            ),
            weaponUsed: "焦半径极坐标公式",
            timeRatio: 2.0,
            detailedExplanation: """
                【极坐标统一公式】
                以焦点为极点：r = l/(1-e·cos(theta))
                l = b^2/a = 半通径
                椭圆e<1，双曲线e>1，抛物线e=1
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "半通径", "极坐标", "核心"]
    ),

    Problem(
        id: "conic_010",
        type: .calculation,
        tier: 5,
        formulaIds: ["ellipse"],
        content: "椭圆的左、右焦点为F_1、F_2，P为椭圆上一点，角F_1PF_2=60度，|PF_1|·|PF_2|=4，a^2=4。求椭圆方程。",
        contentLatex: "\\angle F_1PF_2=60^\\circ,\\ |PF_1| \\cdot |PF_2|=4,\\ a^2=4",
        options: nil,
        answer: "x^2/4+y^2/3=1",
        difficulty: 0.65,
        averageTime: 240,
        hints: ["余弦定理", "|PF_1|+|PF_2|=2a=4", "乘积条件+余弦定理确定c"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "椭圆定义", latex: "|PF_1|+|PF_2|=2a=4", annotation: ""),
                SolutionStep(order: 2, description: "余弦定理", latex: "|F_1F_2|^2=|PF_1|^2+|PF_2|^2-2|PF_1||PF_2|\\cos 60^\\circ", annotation: ""),
                SolutionStep(order: 3, description: "化简", latex: "4c^2=(|PF_1|+|PF_2|)^2-2|PF_1||PF_2|-|PF_1||PF_2|=16-3 \\times 4=4", annotation: ""),
                SolutionStep(order: 4, description: "得c", latex: "c^2=1,\\ b^2=a^2-c^2=3", annotation: ""),
                SolutionStep(order: 5, description: "方程", latex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1", annotation: "")
            ],
            keyInsight: "焦点三角形：余弦定理+椭圆定义联立",
            commonMistakes: ["余弦定理中的角搞错位置"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "完全平方展开", latex: "(r_1+r_2)^2=r_1^2+r_2^2+2r_1r_2=16", annotation: ""),
                    SolutionStep(order: 2, description: "余弦定理得", latex: "4c^2=r_1^2+r_2^2-r_1r_2=16-3 \\times 4=4", annotation: "")
                ],
                keyInsight: "标准余弦定理法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦点三角形面积", latex: "S=\\frac{1}{2}r_1 r_2 \\sin 60^\\circ=√(3)", annotation: ""),
                    SolutionStep(order: 2, description: "面积公式2", latex: "S=b^2 \\tan\\frac{\\theta}{2}=b^2 \\tan 30^\\circ=\\frac{b^2}{√(3)}", annotation: ""),
                    SolutionStep(order: 3, description: "联立", latex: "\\frac{b^2}{√(3)}=√(3) \\Rightarrow b^2=3", annotation: "秒出b^2")
                ],
                keyInsight: "S=b^2·tan(theta/2)直接秒出b^2",
                commonMistakes: []
            ),
            weaponUsed: "焦点三角形面积公式",
            timeRatio: 2.5,
            detailedExplanation: """
                【焦点三角形神公式】
                S = b^2 · tan(theta/2)
                其中theta=角F_1PF_2
                同时 S = (1/2)r_1·r_2·sin(theta)
                两式联立可秒杀大量焦点三角形问题
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "焦点三角形", "面积公式", "核心"]
    ),

    // ============ 直线与圆锥曲线综合 ============

    Problem(
        id: "conic_011",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse", "line"],
        content: "椭圆x^2/4+y^2=1，过右焦点F(√(3),0)的直线l交椭圆于A、B两点，求|AB|的最大值和最小值。",
        contentLatex: "\\frac{x^2}{4}+y^2=1,\\ F(√(3),0)",
        options: nil,
        answer: "最大4(长轴), 最小2(通径)",
        difficulty: 0.70,
        averageTime: 300,
        hints: ["|AB|随倾斜角变化", "通径是过焦点最短的弦", "长轴方向最长"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "焦点弦长公式", latex: "|AB|=\\frac{2b^2/a}{1-e^2\\cos^2\\theta}", annotation: "theta为直线与x轴夹角"),
                SolutionStep(order: 2, description: "代入", latex: "b^2=1,a=2,e=\\frac{√(3)}{2}", annotation: ""),
                SolutionStep(order: 3, description: "公式", latex: "|AB|=\\frac{2 \\cdot 1/2}{1-\\frac{3}{4}\\cos^2\\theta}=\\frac{1}{1-\\frac{3}{4}\\cos^2\\theta}", annotation: ""),
                SolutionStep(order: 4, description: "最大值", latex: "\\cos^2\\theta=0\\ (\\theta=90^\\circ) \\Rightarrow |AB|_{\\min}=1... ", annotation: "通径"),
                SolutionStep(order: 5, description: "最小值", latex: "\\cos^2\\theta=1\\ (\\theta=0^\\circ) \\Rightarrow |AB|_{\\max}=\\frac{1}{1/4}=4", annotation: "长轴")
            ],
            keyInsight: "焦点弦长关于倾斜角的函数：theta=90度时最短（通径），theta=0度时最长",
            commonMistakes: ["最大最小搞反"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分情况讨论", latex: "\\theta=0: |AB|=2a=4;\\ \\theta=90^\\circ: |AB|=2b^2/a=1", annotation: ""),
                    SolutionStep(order: 2, description: "单调性分析", latex: "|AB|\\text{关于}\\theta\\text{递减(0到90度)}", annotation: "")
                ],
                keyInsight: "端点讨论法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "极坐标公式", latex: "|AB|=\\frac{2l}{1-e^2\\cos^2\\theta},\\ l=b^2/a", annotation: "统一公式"),
                    SolutionStep(order: 2, description: "极值", latex: "\\min=2l=2b^2/a=1,\\ \\max=2a=4", annotation: "")
                ],
                keyInsight: "分母最大→弦最短（通径），分母最小→弦最长（长轴）",
                commonMistakes: []
            ),
            weaponUsed: "焦点弦长极坐标公式",
            timeRatio: 2.5,
            detailedExplanation: """
                【焦点弦长公式】
                |AB| = 2l/(1-e^2cos^2(theta))
                l = b^2/a = 半通径
                最短弦 = 2l（通径，theta=90度）
                最长弦 = 2a（长轴，theta=0度）
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "焦点弦", "最值", "核心"]
    ),

    Problem(
        id: "conic_012",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse", "line"],
        content: "椭圆x^2/4+y^2/3=1，直线y=kx+2交椭圆于A、B两点，O为原点。若OA向量·OB向量=0，求k。",
        contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\ y=kx+2,\\ \\vec{OA} \\cdot \\vec{OB}=0",
        options: nil,
        answer: "k=±2√3/3",
        difficulty: 0.75,
        averageTime: 360,
        hints: ["OA·OB=x_1x_2+y_1y_2=0", "联立方程用韦达", "y_1y_2用k和韦达表示"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "联立", latex: "\\frac{x^2}{4}+\\frac{(kx+2)^2}{3}=1", annotation: ""),
                SolutionStep(order: 2, description: "展开(×12)", latex: "3x^2+4(kx+2)^2=12 \\Rightarrow (3+4k^2)x^2+16kx+4=0", annotation: ""),
                SolutionStep(order: 3, description: "韦达", latex: "x_1+x_2=\\frac{-16k}{3+4k^2},\\ x_1 x_2=\\frac{4}{3+4k^2}", annotation: ""),
                SolutionStep(order: 4, description: "y_1y_2展开", latex: "y_1 y_2=(kx_1+2)(kx_2+2)=k^2 x_1 x_2+2k(x_1+x_2)+4", annotation: ""),
                SolutionStep(order: 5, description: "OA·OB=0", latex: "x_1 x_2+y_1 y_2=(1+k^2)x_1 x_2+2k(x_1+x_2)+4=0", annotation: ""),
                SolutionStep(order: 6, description: "代韦达", latex: "\\frac{4(1+k^2)}{3+4k^2}+\\frac{-32k^2}{3+4k^2}+4=0", annotation: ""),
                SolutionStep(order: 7, description: "通分化简", latex: "4+4k^2-32k^2+4(3+4k^2)=0 \\Rightarrow 4+4k^2-32k^2+12+16k^2=0", annotation: ""),
                SolutionStep(order: 8, description: "解出k", latex: "-12k^2+16=0 \\Rightarrow k^2=\\frac{4}{3} \\Rightarrow k=\\pm\\frac{2√3}{3}", annotation: "判别式>0，两交点存在"),
                SolutionStep(order: 9, description: "验证", latex: "k^2=4/3时\\ x_1x_2=\\frac{12}{25},\\ y_1y_2=-\\frac{12}{25},\\ \\text{和}=0\\ \\checkmark", annotation: "")
            ],
            keyInsight: "向量点积条件转化为韦达定理的代数条件",
            commonMistakes: ["y_1y_2展开时常数项与交叉项漏算", "忘记验证判别式>0"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "联立得韦达", latex: "(3+4k^2)x^2+16kx+4=0,\\ x_1x_2=\\frac{4}{3+4k^2},\\ x_1+x_2=\\frac{-16k}{3+4k^2}", annotation: ""),
                    SolutionStep(order: 2, description: "向量条件代入", latex: "(1+k^2)x_1x_2+2k(x_1+x_2)+4=0", annotation: ""),
                    SolutionStep(order: 3, description: "化简求k", latex: "-12k^2+16=0\\Rightarrow k=\\pm\\frac{2√3}{3}", annotation: "")
                ],
                keyInsight: "标准韦达定理法",
                commonMistakes: ["计算量大，容易出错"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "【秒杀】齐次化：用直线把常数项替换", latex: "\\frac{y-kx}{2}=1,\\ \\text{代入}\\frac{x^2}{4}+\\frac{y^2}{3}=1", annotation: "把右边的1换成(y-kx)/2"),
                    SolutionStep(order: 2, description: "得二次齐次方程", latex: "3x^2+4y^2=3(y-kx)^2 \\Rightarrow (3-3k^2)x^2+6kxy+y^2=0", annotation: "整理为Ax²+Bxy+Cy²=0"),
                    SolutionStep(order: 3, description: "OA⊥OB即A+C=0", latex: "(3-3k^2)+1=0 \\Rightarrow k^2=\\frac{4}{3} \\Rightarrow k=\\pm\\frac{2√3}{3}", annotation: "一步秒出，无需韦达")
                ],
                keyInsight: "齐次化把原点弦问题降维：两直线OA,OB合成Ax²+Bxy+Cy²=0，垂直⟺A+C=0。",
                commonMistakes: []
            ),
            weaponUsed: "齐次化法",
            timeRatio: 2.5,
            detailedExplanation: """
                【齐次化大法】
                设直线y=kx+m，用 1=(y-kx)/m 代入曲线方程，
                得到关于x,y的二次齐次方程 Ax^2+Bxy+Cy^2=0，
                它正是OA、OB两条直线的合成方程。
                OA⊥OB ⟺ A+C=0（x^2和y^2系数之和为0）。
                本题 m=2：(3-3k²)x²+6kxy+y²=0，A+C=4-3k²=0，得 k=±2√3/3，
                避免了韦达定理的大量计算！
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "向量", "齐次化", "压轴"]
    ),

    // ============ 抛物线综合 ============

    Problem(
        id: "conic_013",
        type: .calculation,
        tier: 5,
        formulaIds: ["parabola"],
        content: "抛物线y^2=2px(p>0)过点(1,2)，求p和抛物线方程。",
        contentLatex: "y^2=2px,\\ \\text{过}(1,2)",
        options: nil,
        answer: "p=2, y^2=4x",
        difficulty: 0.45,
        averageTime: 90,
        hints: ["代入点坐标"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "代入", latex: "4=2p \\cdot 1 \\Rightarrow p=2", annotation: ""),
                SolutionStep(order: 2, description: "方程", latex: "y^2=4x", annotation: "")
            ],
            keyInsight: "代入已知点确定参数",
            commonMistakes: ["代入时x和y搞反"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "代入", latex: "2^2=2p \\cdot 1 \\Rightarrow p=2", annotation: "一步搞定")
                ],
                keyInsight: "直接代入",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "比例法", latex: "y^2/x=2p=4/1=4 \\Rightarrow 2p=4", annotation: "y^2与x成正比")
                ],
                keyInsight: "抛物线上任意点满足y^2/x=2p=常数",
                commonMistakes: []
            ),
            weaponUsed: "比例常数法",
            timeRatio: 1.5,
            detailedExplanation: """
                抛物线y^2=2px上，y^2/x=2p是常数
                代入任一点即可确定2p
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "抛物线", "求方程", "基础"]
    ),

    Problem(
        id: "conic_014",
        type: .calculation,
        tier: 6,
        formulaIds: ["parabola"],
        content: "抛物线y^2=4x，过焦点F的直线交抛物线于A(x_1,y_1)、B(x_2,y_2)两点。求证：y_1·y_2=-4。",
        contentLatex: "y^2=4x,\\ F(1,0),\\ A(x_1,y_1),B(x_2,y_2)",
        options: nil,
        answer: "y_1·y_2=-4",
        difficulty: 0.65,
        averageTime: 240,
        hints: ["设直线x=my+1", "代入y^2=4x", "韦达定理"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "设直线", latex: "x=my+1\\ (\\text{经过焦点}(1,0))", annotation: "避免斜率不存在"),
                SolutionStep(order: 2, description: "代入", latex: "y^2=4(my+1) \\Rightarrow y^2-4my-4=0", annotation: ""),
                SolutionStep(order: 3, description: "韦达", latex: "y_1 \\cdot y_2=-4", annotation: "直接读出常数项")
            ],
            keyInsight: "抛物线焦点弦：y_1·y_2=-p^2（当y^2=2px时）",
            commonMistakes: ["设y=kx+b时需讨论斜率不存在"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "x=my+1代入", latex: "y^2-4my-4=0", annotation: ""),
                    SolutionStep(order: 2, description: "韦达", latex: "y_1y_2=-4", annotation: "")
                ],
                keyInsight: "标准联立法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "参数方程法", latex: "A(t_1^2, 2t_1),\\ B(t_2^2, 2t_2)", annotation: "y^2=4x的参数"),
                    SolutionStep(order: 2, description: "焦点弦条件", latex: "t_1 t_2=-1\\ (\\text{经典结论})", annotation: ""),
                    SolutionStep(order: 3, description: "直接得", latex: "y_1 y_2=4t_1 t_2=-4", annotation: "秒杀")
                ],
                keyInsight: "抛物线参数方程+焦点弦t_1t_2=-1",
                commonMistakes: []
            ),
            weaponUsed: "抛物线参数方程",
            timeRatio: 2.5,
            detailedExplanation: """
                【抛物线参数公式】
                y^2=4x → 参数(t^2, 2t)
                焦点弦AB: t_1·t_2 = -1
                y_1·y_2 = 4t_1t_2 = -4
                x_1·x_2 = t_1^2·t_2^2 = 1
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "抛物线", "焦点弦", "韦达", "证明", "核心"]
    ),

    // ============ 高考压轴级 ============

    Problem(
        id: "conic_015",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse", "line"],
        content: "椭圆x^2/4+y^2/3=1上的点P到左焦点F_1的距离最大值和最小值分别是多少？",
        contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1",
        options: nil,
        answer: "最大a+c=3, 最小a-c=1",
        difficulty: 0.50,
        averageTime: 120,
        hints: ["|PF_1|+|PF_2|=2a", "a-c<=|PF_1|<=a+c"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "基本量", latex: "a=2,c=1", annotation: ""),
                SolutionStep(order: 2, description: "焦半径范围", latex: "a-c \\leq |PF_1| \\leq a+c", annotation: ""),
                SolutionStep(order: 3, description: "结果", latex: "1 \\leq |PF_1| \\leq 3", annotation: "")
            ],
            keyInsight: "椭圆上点到焦点距离范围：[a-c, a+c]",
            commonMistakes: ["用坐标法计算过于复杂"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦半径公式", latex: "|PF_1|=a+ex=2+\\frac{x}{2}", annotation: "左焦点"),
                    SolutionStep(order: 2, description: "x的范围", latex: "-2 \\leq x \\leq 2 \\Rightarrow 1 \\leq |PF_1| \\leq 3", annotation: "")
                ],
                keyInsight: "焦半径=a+ex(左焦点取+)",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀", latex: "\\max=a+c=3\\ (\\text{远顶点}),\\ \\min=a-c=1\\ (\\text{近顶点})", annotation: "直接背结论")
                ],
                keyInsight: "近焦点顶点距a-c，远焦点顶点距a+c",
                commonMistakes: []
            ),
            weaponUsed: "焦半径范围结论",
            timeRatio: 5.0,
            detailedExplanation: """
                【核心结论】
                椭圆上点到焦点距离：
                最小 = a-c（近焦点的顶点处取到）
                最大 = a+c（远焦点的顶点处取到）
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "焦半径", "最值", "核心"]
    ),

    Problem(
        id: "conic_016",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse"],
        content: "已知F_1、F_2为椭圆x^2/25+y^2/9=1的焦点，P为椭圆上一点，且|PF_1|:|PF_2|=2:3，求三角形PF_1F_2的面积。",
        contentLatex: "\\frac{x^2}{25}+\\frac{y^2}{9}=1,\\ |PF_1|:|PF_2|=2:3",
        options: nil,
        answer: "3√15",
        difficulty: 0.70,
        averageTime: 300,
        hints: ["|PF_1|+|PF_2|=10", "比例确定具体值", "余弦定理求角或面积"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "焦半径", latex: "|PF_1|+|PF_2|=10,\\ \\frac{|PF_1|}{|PF_2|}=\\frac{2}{3}", annotation: ""),
                SolutionStep(order: 2, description: "解方程", latex: "|PF_1|=4,\\ |PF_2|=6", annotation: ""),
                SolutionStep(order: 3, description: "焦距", latex: "c=√(25-9)=4,\\ |F_1F_2|=8", annotation: ""),
                SolutionStep(order: 4, description: "余弦定理", latex: "\\cos\\angle F_1PF_2=\\frac{16+36-64}{2 \\times 4 \\times 6}=\\frac{-12}{48}=-\\frac{1}{4}", annotation: ""),
                SolutionStep(order: 5, description: "面积", latex: "S=\\frac{1}{2} \\times 4 \\times 6 \\times \\sin\\angle F_1PF_2=12 \\times \\frac{√(15)}{4}=3√(15)", annotation: "")
            ],
            keyInsight: "比例+定义确定焦半径，余弦定理求角/面积",
            commonMistakes: ["sin从cos换算时出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求焦半径", latex: "|PF_1|=4,|PF_2|=6", annotation: ""),
                    SolutionStep(order: 2, description: "余弦定理+海伦公式", latex: "\\text{三边}4,6,8\\text{的三角形面积}", annotation: ""),
                    SolutionStep(order: 3, description: "海伦公式", latex: "s=9,\\ S=√(9 \\cdot 5 \\cdot 3 \\cdot 1)=3√(15)", annotation: "")
                ],
                keyInsight: "海伦公式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "【秒杀】焦点三角形面积公式", latex: "S=b^2\\tan\\frac{\\theta}{2},\\ \\theta=\\angle F_1PF_2", annotation: "b^2=9"),
                    SolutionStep(order: 2, description: "由余弦定理得cosθ", latex: "\\cos\\theta=-\\frac14\\Rightarrow \\tan\\frac{\\theta}{2}=\\frac{\\sin\\theta}{1+\\cos\\theta}=\\frac{√(15)/4}{3/4}=\\frac{√(15)}{3}", annotation: ""),
                    SolutionStep(order: 3, description: "代入秒出", latex: "S=9\\times\\frac{√(15)}{3}=3√(15)", annotation: "与海伦公式结果一致")
                ],
                keyInsight: "记住焦点三角形面积 S=b²·tan(θ/2)，只需夹角即可，比海伦公式更直接。",
                commonMistakes: []
            ),
            weaponUsed: "焦点三角形面积公式",
            timeRatio: 2.0,
            detailedExplanation: """
                【两种解法】
                ① 海伦公式：三边4,6,8，s=(4+6+8)/2=9，S=√(9·5·3·1)=√135=3√15
                ② 焦点三角形面积公式：S=b²·tan(θ/2)，本题b²=9，
                   由余弦定理 cosθ=-1/4 得 tan(θ/2)=√15/3，故 S=9·√15/3=3√15
                注意：半周长s=9只是中间量，最终面积是3√15，切勿把s当成面积。
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "焦点三角形", "面积", "海伦公式", "核心"]
    ),

    Problem(
        id: "conic_017",
        type: .calculation,
        tier: 6,
        formulaIds: ["hyperbola"],
        content: "双曲线x^2/a^2-y^2/b^2=1(a>0,b>0)的一条渐近线与直线2x+y=0平行，离心率为______。",
        contentLatex: "\\text{渐近线} \\parallel 2x+y=0",
        options: nil,
        answer: "√(5)",
        difficulty: 0.55,
        averageTime: 150,
        hints: ["渐近线斜率=+-b/a", "2x+y=0的斜率=-2"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "渐近线斜率", latex: "\\frac{b}{a}=2\\ (\\text{与}y=-2x\\text{平行})", annotation: ""),
                SolutionStep(order: 2, description: "离心率", latex: "e=√(1+\\frac{b^2){a^2}}=√(1+4)=√(5)", annotation: "")
            ],
            keyInsight: "渐近线斜率确定b/a，直接求离心率",
            commonMistakes: ["离心率公式用成椭圆的"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "b/a=2", latex: "e=\\frac{c}{a}=\\frac{√(a^2+b^2)}{a}=√(1+4)=√(5)", annotation: "")
                ],
                keyInsight: "标准公式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀公式", latex: "e=√(1+(b/a)^2)=√(1+4)=√(5)", annotation: "渐近线斜率直接给出b/a")
                ],
                keyInsight: "双曲线e=√(1+(b/a)^2)，只需知道渐近线斜率",
                commonMistakes: []
            ),
            weaponUsed: "e与渐近线斜率的直接关系",
            timeRatio: 2.0,
            detailedExplanation: """
                【双曲线速算】
                渐近线斜率 = +-b/a = +-m
                离心率 e = √(1+m^2)
                无需分别求a,b,c
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "双曲线", "离心率", "渐近线", "核心"]
    ),

    Problem(
        id: "conic_018",
        type: .calculation,
        tier: 6,
        formulaIds: ["parabola", "line"],
        content: "抛物线y^2=8x，过焦点F作直线交抛物线于A、B两点，若|AF|=3，求|BF|。",
        contentLatex: "y^2=8x,\\ |AF|=3",
        options: nil,
        answer: "|BF|=6",
        difficulty: 0.65,
        averageTime: 200,
        hints: ["焦点弦性质", "1/|AF|+1/|BF|=2/p", "y²=2px中p=4"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求参数", latex: "y^2=2px=8x \\Rightarrow p=4,\\ \\text{焦点}F(2,0),\\ \\text{准线}x=-2", annotation: ""),
                SolutionStep(order: 2, description: "焦点弦调和关系", latex: "\\frac{1}{|AF|}+\\frac{1}{|BF|}=\\frac{2}{p}=\\frac{1}{2}", annotation: "焦点弦两段焦半径的调和关系"),
                SolutionStep(order: 3, description: "代入|AF|=3", latex: "\\frac{1}{3}+\\frac{1}{|BF|}=\\frac{1}{2} \\Rightarrow \\frac{1}{|BF|}=\\frac{1}{2}-\\frac{1}{3}=\\frac{1}{6}", annotation: ""),
                SolutionStep(order: 4, description: "求出|BF|", latex: "|BF|=6", annotation: "|AF|=3>p/2=2，合理"),
                SolutionStep(order: 5, description: "验证", latex: "x_A=|AF|-2=1,\\ x_B=|BF|-2=4;\\ \\text{两点}(1,\\pm2√2),(4,\\mp4√2)\\text{与F共线}", annotation: "斜率检验通过")
            ],
            keyInsight: "焦点弦两段焦半径满足调和关系1/|AF|+1/|BF|=2/p。",
            commonMistakes: ["把p记成2p（这里p=4不是8）", "忘记焦半径=x+p/2"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦半径公式求x坐标", latex: "|AF|=x_A+\\frac{p}{2}=x_A+2=3\\Rightarrow x_A=1,\\ y_A^2=8,\\ A(1,2√2)", annotation: ""),
                    SolutionStep(order: 2, description: "直线AF与抛物线联立", latex: "k_{AF}=\\frac{2√2-0}{1-2}=-2√2,\\ y=-2√2(x-2)", annotation: ""),
                    SolutionStep(order: 3, description: "求B并算焦半径", latex: "\\text{解得}x_B=4,\\ |BF|=x_B+2=6", annotation: "联立法验证")
                ],
                keyInsight: "焦半径公式+联立直线，稳妥但计算量略大",
                commonMistakes: ["联立方程算错根"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "【秒杀】直接套焦点弦调和公式", latex: "\\frac{1}{|AF|}+\\frac{1}{|BF|}=\\frac{2}{p}=\\frac12", annotation: "无需求坐标"),
                    SolutionStep(order: 2, description: "一步解出", latex: "\\frac{1}{|BF|}=\\frac12-\\frac13=\\frac16\\Rightarrow |BF|=6", annotation: "秒出")
                ],
                keyInsight: "焦点弦调和公式1/|AF|+1/|BF|=2/p，绕过联立直线，一步求另一段。",
                commonMistakes: []
            ),
            weaponUsed: "焦点弦调和公式",
            timeRatio: 2.5,
            detailedExplanation: """
                【焦点弦调和公式】
                抛物线 y²=2px 的焦点弦两段焦半径满足
                　　1/|AF| + 1/|BF| = 2/p
                本题 p=4，2/p=1/2，由 |AF|=3 得 1/|BF|=1/2-1/3=1/6，故 |BF|=6。
                注意焦半径 r=x+p/2，最短焦半径=p/2=2，|AF|=3>2 故配置合理。
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "抛物线", "焦点弦", "调和", "核心"]
    ),

    Problem(
        id: "conic_019",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse"],
        content: "椭圆x^2/a^2+y^2/b^2=1(a>b>0)的离心率e=√(3)/2，短半轴b=1，求椭圆方程。",
        contentLatex: "e=\\frac{√(3)}{2},\\ b=1",
        options: nil,
        answer: "x^2/4+y^2=1",
        difficulty: 0.50,
        averageTime: 120,
        hints: ["e=c/a=√(3)/2", "b^2=a^2-c^2", "联立求a"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "由e", latex: "c=\\frac{√(3)}{2}a", annotation: ""),
                SolutionStep(order: 2, description: "b^2=a^2-c^2", latex: "1=a^2-\\frac{3}{4}a^2=\\frac{a^2}{4} \\Rightarrow a^2=4", annotation: ""),
                SolutionStep(order: 3, description: "方程", latex: "\\frac{x^2}{4}+y^2=1", annotation: "")
            ],
            keyInsight: "e和b确定椭圆：b^2=a^2(1-e^2)",
            commonMistakes: ["b^2=a^2-c^2代入错误"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "标准代入", latex: "b^2=a^2(1-e^2)=a^2/4=1 \\Rightarrow a^2=4", annotation: "")
                ],
                keyInsight: "直接公式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀", latex: "a^2=\\frac{b^2}{1-e^2}=\\frac{1}{1-3/4}=4", annotation: "一步到位")
                ],
                keyInsight: "a^2=b^2/(1-e^2) 万能公式",
                commonMistakes: []
            ),
            weaponUsed: "a^2=b^2/(1-e^2)",
            timeRatio: 2.0,
            detailedExplanation: """
                【椭圆参数互求】
                已知b和e: a^2 = b^2/(1-e^2)
                已知a和e: b^2 = a^2(1-e^2)
                已知a和b: e = √(1-b^2/a^2)
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "求方程", "离心率", "核心"]
    ),

    Problem(
        id: "conic_020",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse", "line"],
        content: "椭圆C: x^2/4+y^2=1，M(0,1)为椭圆上顶点。过椭圆右焦点F(√(3),0)的直线l交椭圆于A、B两点，求三角形MAB面积的最大值。",
        contentLatex: "\\frac{x^2}{4}+y^2=1,\\ M(0,1),\\ F(√(3),0)",
        options: nil,
        answer: "√(3)",
        difficulty: 0.80,
        averageTime: 420,
        hints: ["面积=(1/2)|AB|·d(M,l)", "M到直线l的距离", "|AB|用焦点弦公式"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "设直线l倾斜角theta", latex: "\\text{M到F距离}=√(3+1)=2", annotation: ""),
                SolutionStep(order: 2, description: "面积公式", latex: "S=\\frac{1}{2}|AB| \\cdot d", annotation: "d为M到l的距离"),
                SolutionStep(order: 3, description: "焦点弦长", latex: "|AB|=\\frac{2b^2/a}{1-e^2\\cos^2\\theta}=\\frac{1}{1-\\frac{3}{4}\\cos^2\\theta}", annotation: ""),
                SolutionStep(order: 4, description: "M到l的距离", latex: "d=|MF|\\sin\\alpha", annotation: "alpha为l与MF的夹角"),
                SolutionStep(order: 5, description: "用theta表示", latex: "S=\\frac{1}{2} \\cdot \\frac{1}{1-\\frac{3}{4}\\cos^2\\theta} \\cdot 2\\sin\\alpha", annotation: "需要精确计算")
            ],
            keyInsight: "面积=底×高/2，用倾斜角参数化后求最值",
            commonMistakes: ["距离公式和弦长公式的角度不统一"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设直线y=k(x-√(3))", latex: "\\text{联立椭圆}", annotation: ""),
                    SolutionStep(order: 2, description: "韦达+弦长+距离", latex: "S=\\frac{1}{2}|AB| \\cdot d(M,l)", annotation: "用k表示后求最值"),
                    SolutionStep(order: 3, description: "导数求极值", latex: "\\text{对k求导令为0}", annotation: "计算量大")
                ],
                keyInsight: "标准联立法+求最值",
                commonMistakes: ["计算量极大"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "面积=|MF|到AB底边投影", latex: "S_{MAB}=\\frac{1}{2}|y_A-y_B| \\cdot |x_M-x_F|... ", annotation: "不太适用"),
                    SolutionStep(order: 2, description: "向量叉积法", latex: "S=\\frac{1}{2}|\\vec{FA} \\times \\vec{FM}+\\vec{FB} \\times \\vec{FM}|", annotation: "")
                ],
                keyInsight: "向量叉积计算三角形面积",
                commonMistakes: []
            ),
            weaponUsed: "参数化+求极值",
            timeRatio: 1.5,
            detailedExplanation: """
                【解析几何面积最值】
                1. 用直线参数(k或theta)表示面积
                2. 化为单变量函数
                3. 求导或用不等式求极值
                这是高考解几大题的标准套路
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "面积最值", "综合", "压轴"]
    ),

    // ============ 离心率求值 ============

    Problem(
        id: "conic_021",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["ellipse"],
        content: "椭圆x^2/a^2+y^2/b^2=1(a>b>0)的左焦点F_1，右焦点F_2。若椭圆上存在点P使角F_1PF_2=90度，求离心率e的范围。",
        contentLatex: "\\exists P,\\ \\angle F_1PF_2=90^\\circ",
        options: nil,
        answer: "√(2)/2<=e<1",
        difficulty: 0.70,
        averageTime: 240,
        hints: ["角F_1PF_2=90度时余弦定理", "4c^2=r_1^2+r_2^2", "r_1+r_2=2a"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "余弦定理", latex: "4c^2=r_1^2+r_2^2=(r_1+r_2)^2-2r_1 r_2=4a^2-2r_1 r_2", annotation: "角为90度"),
                SolutionStep(order: 2, description: "r_1r_2", latex: "r_1 r_2=2(a^2-c^2)=2b^2", annotation: ""),
                SolutionStep(order: 3, description: "要求r_1r_2>0且两值为正", latex: "r_1,r_2 \\in [a-c,a+c]", annotation: ""),
                SolutionStep(order: 4, description: "关键约束", latex: "r_1 r_2 \\geq 0 \\Rightarrow 2b^2 \\geq 0\\ (\\text{自动满足})", annotation: ""),
                SolutionStep(order: 5, description: "需要r_1,r_2都在范围内", latex: "\\text{以}b^2=a^2-c^2>0\\text{为条件}", annotation: ""),
                SolutionStep(order: 6, description: "更精确", latex: "\\text{需}2c \\leq 2a \\cdot \\frac{√(2)}{2}... \\Rightarrow c \\geq \\frac{√(2)}{2}a", annotation: "直角要求")
            ],
            keyInsight: "角F_1PF_2=90度⟹2c>=短轴⟹e>=√(2)/2",
            commonMistakes: ["约束条件分析不全"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "以F_1F_2为直径的圆", latex: "\\text{P在以}F_1F_2\\text{为直径的圆上}", annotation: "直角对应半圆"),
                    SolutionStep(order: 2, description: "圆与椭圆有交点", latex: "\\text{圆半径}c \\geq b \\Rightarrow c^2 \\geq b^2=a^2-c^2", annotation: ""),
                    SolutionStep(order: 3, description: "解出", latex: "2c^2 \\geq a^2 \\Rightarrow e \\geq \\frac{√(2)}{2}", annotation: "")
                ],
                keyInsight: "直角条件⟺P在以F_1F_2为直径的圆上",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "圆交椭圆秒杀", latex: "\\angle F_1PF_2=90^\\circ \\Leftrightarrow P\\text{在圆}x^2+y^2=c^2\\text{上}", annotation: ""),
                    SolutionStep(order: 2, description: "圆须交椭圆", latex: "c \\geq b \\Rightarrow e \\geq √(1-e^2) \\Rightarrow e \\geq \\frac{√(2)}{2}", annotation: "一步到位")
                ],
                keyInsight: "直角对直径⟺P在以焦距为直径的圆上⟺c>=b",
                commonMistakes: []
            ),
            weaponUsed: "直径角定理",
            timeRatio: 3.0,
            detailedExplanation: """
                【秒杀定理】
                角F_1PF_2=90度 ⟺ P在以F_1F_2为直径的圆上
                圆的半径=c，要与椭圆有交点需c>=b
                即 c^2>=a^2-c^2 → e>=√(2)/2
                """
        ),
        gaokaoYear: 2019,
        tags: ["圆锥曲线", "椭圆", "离心率", "范围", "高考真题", "核心"]
    ),

    Problem(
        id: "conic_022",
        type: .calculation,
        tier: 6,
        formulaIds: ["parabola", "line"],
        content: "过抛物线y^2=4x的焦点F的直线与抛物线交于A、B两点，A在第一象限。若|AF|=3，求直线AB的方程。",
        contentLatex: "y^2=4x,\\ |AF|=3,\\ A\\text{在第一象限}",
        options: nil,
        answer: "y=2√2(x-1)",
        difficulty: 0.65,
        averageTime: 240,
        hints: ["焦半径|AF|=x_A+p/2=x_A+1=3", "x_A=2, y_A^2=8"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "焦半径", latex: "|AF|=x_A+1=3 \\Rightarrow x_A=2", annotation: "p/2=1"),
                SolutionStep(order: 2, description: "求y_A", latex: "y_A^2=4 \\times 2=8 \\Rightarrow y_A=2√(2)\\ (\\text{第一象限})", annotation: ""),
                SolutionStep(order: 3, description: "直线斜率", latex: "k=\\frac{2√(2)-0}{2-1}=2√(2)", annotation: "过F(1,0)"),
                SolutionStep(order: 4, description: "方程", latex: "y=2√(2)(x-1)", annotation: "")
            ],
            keyInsight: "焦半径公式|PF|=x+p/2直接求坐标",
            commonMistakes: ["p/2算错", "忘记A在第一象限取正值"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦半径求坐标", latex: "x_A=2,y_A=2√(2)", annotation: ""),
                    SolutionStep(order: 2, description: "两点确定直线", latex: "y=2√(2)(x-1)", annotation: "")
                ],
                keyInsight: "标准焦半径法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "参数方程秒杀", latex: "A=(t^2,2t),\\ |AF|=t^2+1=3 \\Rightarrow t=√(2)", annotation: ""),
                    SolutionStep(order: 2, description: "A=(2,2√(2))", latex: "k=\\frac{2√(2)}{2-1}=2√(2)", annotation: "")
                ],
                keyInsight: "参数方程(t^2,2t)代入焦半径更直接",
                commonMistakes: []
            ),
            weaponUsed: "抛物线参数方程",
            timeRatio: 1.5,
            detailedExplanation: """
                【抛物线焦半径】
                y^2=2px: |PF| = x + p/2
                已知|PF|直接得x，再由曲线方程得y
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "抛物线", "焦半径", "直线方程", "核心"]
    ),

    Problem(
        id: "conic_023",
        type: .calculation,
        tier: 6,
        formulaIds: ["hyperbola"],
        content: "双曲线x^2-y^2/3=1，F_1为左焦点，F_2为右焦点，P为右支上一点，角F_1PF_2=60度，求|PF_1|。",
        contentLatex: "x^2-\\frac{y^2}{3}=1,\\ \\angle F_1PF_2=60^\\circ,\\ P\\text{在右支}",
        options: nil,
        answer: "|PF_1|=2+√(3)",
        difficulty: 0.70,
        averageTime: 300,
        hints: ["a=1,b=√(3),c=2", "||PF_1|-|PF_2||=2a=2", "余弦定理"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "基本量", latex: "a=1,b=√(3),c=2,|F_1F_2|=4", annotation: ""),
                SolutionStep(order: 2, description: "双曲线定义", latex: "|PF_1|-|PF_2|=2\\ (P\\text{在右支})", annotation: ""),
                SolutionStep(order: 3, description: "设r_1=|PF_1|, r_2=|PF_2|", latex: "r_1=r_2+2", annotation: ""),
                SolutionStep(order: 4, description: "余弦定理", latex: "16=r_1^2+r_2^2-2r_1 r_2 \\cos 60^\\circ=r_1^2+r_2^2-r_1 r_2", annotation: ""),
                SolutionStep(order: 5, description: "代入r_1=r_2+2", latex: "(r_2+2)^2+r_2^2-(r_2+2)r_2=16", annotation: ""),
                SolutionStep(order: 6, description: "展开", latex: "r_2^2+4r_2+4+r_2^2-r_2^2-2r_2=16 \\Rightarrow r_2^2+2r_2-12=0", annotation: ""),
                SolutionStep(order: 7, description: "解方程", latex: "r_2=\\frac{-2+√(52)}{2}=√(13)-1", annotation: "取正值"),
                SolutionStep(order: 8, description: "r_1", latex: "r_1=r_2+2=√(13)+1", annotation: "")
            ],
            keyInsight: "双曲线定义+余弦定理联立",
            commonMistakes: ["右支应该是r_1-r_2=2还是r_2-r_1=2"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "定义+余弦定理", latex: "r_1-r_2=2,\\ r_1^2+r_2^2-r_1r_2=16", annotation: ""),
                    SolutionStep(order: 2, description: "解方程组", latex: "r_1=√(13)+1", annotation: "")
                ],
                keyInsight: "标准联立法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦点三角形面积", latex: "S=\\frac{1}{2}r_1 r_2 \\sin 60^\\circ", annotation: ""),
                    SolutionStep(order: 2, description: "另一个面积公式", latex: "S=b^2 \\cot(\\theta/2)=3\\cot 30^\\circ=3√(3)", annotation: "双曲线版本"),
                    SolutionStep(order: 3, description: "联立", latex: "\\frac{√(3)}{4}r_1 r_2=3√(3) \\Rightarrow r_1 r_2=12", annotation: ""),
                    SolutionStep(order: 4, description: "配合r_1-r_2=2", latex: "r_1+r_2=√(4+48)=2√(13)", annotation: ""),
                    SolutionStep(order: 5, description: "r_1", latex: "r_1=√(13)+1", annotation: "")
                ],
                keyInsight: "双曲线焦点三角形面积=b^2·cot(theta/2)",
                commonMistakes: []
            ),
            weaponUsed: "双曲线焦点三角形面积公式",
            timeRatio: 2.0,
            detailedExplanation: """
                【双曲线焦点三角形】
                面积 S = b^2 · |cot(theta/2)|
                配合 S = (1/2)r_1r_2sin(theta)
                以及 |r_1-r_2| = 2a
                三个方程解三个未知量
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "双曲线", "焦点三角形", "余弦定理", "压轴"]
    ),

    Problem(
        id: "conic_024",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse", "line"],
        content: "椭圆x^2/4+y^2/3=1，A(2,0)为右顶点，过左焦点F_1(-1,0)的直线l交椭圆于P、Q两点，求向量AP·AQ的最大值。",
        contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\ A(2,0),\\ F_1(-1,0)",
        options: nil,
        answer: "27/4",
        difficulty: 0.85,
        averageTime: 480,
        hints: ["设直线x=my-1", "联立椭圆", "AP·AQ用坐标展开"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "设直线", latex: "x=my-1", annotation: "过F_1(-1,0)，此设法含竖直弦、避开斜率不存在"),
                SolutionStep(order: 2, description: "代入椭圆(×12)", latex: "3(my-1)^2+4y^2=12", annotation: ""),
                SolutionStep(order: 3, description: "整理", latex: "(3m^2+4)y^2-6my-9=0", annotation: ""),
                SolutionStep(order: 4, description: "韦达", latex: "y_1+y_2=\\frac{6m}{3m^2+4},\\ y_1 y_2=\\frac{-9}{3m^2+4}", annotation: ""),
                SolutionStep(order: 5, description: "AP·AQ展开", latex: "=(x_1-2)(x_2-2)+y_1 y_2=(my_1-3)(my_2-3)+y_1 y_2", annotation: "x_i-2=my_i-3"),
                SolutionStep(order: 6, description: "整理成韦达式", latex: "=(m^2+1)y_1 y_2-3m(y_1+y_2)+9", annotation: ""),
                SolutionStep(order: 7, description: "代入韦达", latex: "=\\frac{-9(m^2+1)}{3m^2+4}-\\frac{18m^2}{3m^2+4}+9=\\frac{-27m^2-9}{3m^2+4}+9", annotation: ""),
                SolutionStep(order: 8, description: "通分化简", latex: "=\\frac{-27m^2-9+9(3m^2+4)}{3m^2+4}=\\frac{-27m^2-9+27m^2+36}{3m^2+4}=\\frac{27}{3m^2+4}", annotation: "结果极简：27/(3m²+4)"),
                SolutionStep(order: 9, description: "求最大值", latex: "3m^2+4\\ge4 \\Rightarrow \\vec{AP}\\cdot\\vec{AQ}=\\frac{27}{3m^2+4}\\le\\frac{27}{4}", annotation: "m=0(竖直弦x=-1)时取得最大值"),
                SolutionStep(order: 10, description: "验证m=0", latex: "P(-1,\\tfrac32),Q(-1,-\\tfrac32):\\ \\vec{AP}\\cdot\\vec{AQ}=9-\\tfrac94=\\tfrac{27}{4}", annotation: "")
            ],
            keyInsight: "向量点积用韦达定理代数化后，惊人地化简为27/(3m²+4)，分母最小则点积最大。",
            commonMistakes: ["展开(my-3)时漏项", "误以为有最小值(m→∞时点积→0但取不到，故求的是最大值)"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "联立+韦达+展开", latex: "\\vec{AP}\\cdot\\vec{AQ}=(m^2+1)y_1y_2-3m(y_1+y_2)+9", annotation: ""),
                    SolutionStep(order: 2, description: "代入化简", latex: "=\\frac{27}{3m^2+4}", annotation: ""),
                    SolutionStep(order: 3, description: "求最值", latex: "\\le\\frac{27}{4}\\ (m=0\\text{取等})", annotation: "")
                ],
                keyInsight: "标准韦达法，关键是化简到底",
                commonMistakes: ["计算量大，化简不彻底"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "【秒杀】点积化简为单参数分式", latex: "\\vec{AP}\\cdot\\vec{AQ}=\\frac{27}{3m^2+4}", annotation: "目标量只依赖m"),
                    SolutionStep(order: 2, description: "看分母单调性", latex: "t=3m^2+4\\ge4,\\ \\frac{27}{t}\\text{随t增大而减小}", annotation: ""),
                    SolutionStep(order: 3, description: "直接读最大值", latex: "t_{\\min}=4\\Rightarrow \\left(\\vec{AP}\\cdot\\vec{AQ}\\right)_{\\max}=\\frac{27}{4}", annotation: "无需求导")
                ],
                keyInsight: "化简成 27/(3m²+4) 后，最值就是分母取边界，秒杀无需求导。",
                commonMistakes: []
            ),
            weaponUsed: "参数换元+单调性",
            timeRatio: 1.5,
            detailedExplanation: """
                【解几大题套路】
                1. 设直线(用x=my+x_0避免斜率不存在的讨论)
                2. 联立曲线得到二次方程，写出韦达定理
                3. 目标量(AP·AQ)用韦达表示并化简——本题化简后竟是 27/(3m²+4)
                4. 由 3m²+4≥4 得点积 ≤ 27/4，m=0(竖直弦)时取得最大值
                注意：m→∞时点积→0但取不到(弦退化为过A的x轴)，所以本题有最大值无最小值。
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "向量", "韦达", "最值", "压轴"]
    ),

    Problem(
        id: "conic_025",
        type: .calculation,
        tier: 5,
        formulaIds: ["parabola"],
        content: "抛物线y^2=4x上一点P到焦点F的距离为5，求P到y轴的距离。",
        contentLatex: "y^2=4x,\\ |PF|=5",
        options: nil,
        answer: "4",
        difficulty: 0.45,
        averageTime: 90,
        hints: ["焦半径|PF|=x+p/2", "到y轴距离=x"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "焦半径", latex: "|PF|=x+1=5 \\Rightarrow x=4", annotation: "p/2=1"),
                SolutionStep(order: 2, description: "到y轴距离", latex: "d=x=4", annotation: "")
            ],
            keyInsight: "焦半径=x+p/2，到y轴距离=x",
            commonMistakes: ["到y轴距离=|x|而非x+p/2"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦半径公式", latex: "x=|PF|-p/2=5-1=4", annotation: "")
                ],
                keyInsight: "直接公式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "定义法秒杀", latex: "|PF|=d(P,\\text{准线})=x+1=5 \\Rightarrow x=4", annotation: "抛物线定义")
                ],
                keyInsight: "到焦点距离=到准线距离=x+p/2",
                commonMistakes: []
            ),
            weaponUsed: "抛物线定义",
            timeRatio: 2.0,
            detailedExplanation: """
                【抛物线核心定义】
                到焦点距离 = 到准线距离
                |PF| = x + p/2
                到y轴距离 = x = |PF| - p/2
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "抛物线", "焦半径", "距离", "基础"]
    ),

    // ============ 双曲线进阶 (conic_026~030) ============

    Problem(
        id: "conic_026",
        type: .calculation,
        tier: 5,
        formulaIds: ["hyperbola"],
        content: "双曲线x^2/a^2-y^2/b^2=1 (a>0,b>0)的一条渐近线为y=√3·x，且过点(2,0)，求双曲线方程及离心率。",
        contentLatex: "\\frac{x^2}{a^2}-\\frac{y^2}{b^2}=1,\\quad \\text{渐近线} y=√(3)x,\\quad \\text{过}(2,0)",
        options: nil,
        answer: "x^2/4-y^2/12=1, e=2",
        difficulty: 0.55,
        averageTime: 180,
        hints: ["渐近线斜率=b/a", "过(2,0)说明a=2", "c^2=a^2+b^2"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "渐近线条件", latex: "\\frac{b}{a}=√(3)", annotation: ""),
                SolutionStep(order: 2, description: "过点条件", latex: "a=2 \\Rightarrow b=2√(3)", annotation: ""),
                SolutionStep(order: 3, description: "求c和e", latex: "c^2=4+12=16,c=4,e=\\frac{c}{a}=2", annotation: "")
            ],
            keyInsight: "双曲线渐近线y=±(b/a)x",
            commonMistakes: ["混淆a,b关系"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "联立两个条件", latex: "b/a=√(3),a=2 \\Rightarrow b=2√(3)", annotation: "")
                ],
                keyInsight: "双曲线渐近线+顶点",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "共渐近线系", latex: "\\frac{x^2}{4}-\\frac{y^2}{12}=\\lambda", annotation: "渐近线y=±√3x的双曲线系"),
                    SolutionStep(order: 2, description: "代入", latex: "(2,0):\\frac{4}{4}=\\lambda=1", annotation: "")
                ],
                keyInsight: "共渐近线系x^2/4-y^2/12=λ一步到位",
                commonMistakes: []
            ),
            weaponUsed: "共渐近线系",
            timeRatio: 2.0,
            detailedExplanation: """
                【共渐近线系】
                渐近线y=±(b/a)x的双曲线可写成
                x^2/a^2-y^2/b^2=λ
                代入已知点即可求λ
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "双曲线", "渐近线", "核心", "必考"]
    ),

    Problem(
        id: "conic_027",
        type: .calculation,
        tier: 5,
        formulaIds: ["hyperbola"],
        content: "已知双曲线的焦点在x轴上，渐近线过(3,4)，焦距为10。求双曲线标准方程。",
        contentLatex: "\\text{焦点在x轴, 渐近线过}(3,4),\\quad 2c=10",
        options: nil,
        answer: "x^2/9-y^2/16=1",
        difficulty: 0.60,
        averageTime: 200,
        hints: ["渐近线y=(b/a)x过(3,4)", "c^2=a^2+b^2=25"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "渐近线条件", latex: "4=\\frac{b}{a}\\cdot 3 \\Rightarrow b=\\frac{4a}{3}", annotation: ""),
                SolutionStep(order: 2, description: "焦距条件", latex: "a^2+b^2=25 \\Rightarrow a^2+\\frac{16a^2}{9}=25", annotation: ""),
                SolutionStep(order: 3, description: "求解", latex: "\\frac{25a^2}{9}=25 \\Rightarrow a^2=9,b^2=16", annotation: "")
            ],
            keyInsight: "渐近线+焦距双条件定双曲线",
            commonMistakes: ["忘记c=5不是c=10"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "常规联立", latex: "b/a=4/3,\\;a^2+b^2=25", annotation: "两方程两未知")
                ],
                keyInsight: "列方程组",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "直角三角形", latex: "a,b,c构成直角三角形", annotation: "渐近线斜率=b/a=4/3, c=5"),
                    SolutionStep(order: 2, description: "3-4-5秒杀", latex: "a=3,b=4,c=5", annotation: "经典勾股数")
                ],
                keyInsight: "a:b:c=3:4:5勾股数直接秒杀",
                commonMistakes: []
            ),
            weaponUsed: "勾股数识别",
            timeRatio: 3.0,
            detailedExplanation: """
                【双曲线直角三角形】
                a^2+b^2=c^2, b/a=4/3, c=5
                → a:b:c=3:4:5
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "双曲线", "渐近线", "焦距", "核心"]
    ),

    Problem(
        id: "conic_028",
        type: .calculation,
        tier: 5,
        formulaIds: ["hyperbola"],
        content: "双曲线x^2-y^2/3=1的左焦点为F₁，右焦点为F₂，P为双曲线上一点且∠F₁PF₂=60°，求△F₁PF₂的面积。",
        contentLatex: "\\frac{x^2}{1}-\\frac{y^2}{3}=1,\\quad \\angle F_1PF_2=60°",
        options: nil,
        answer: "√(3)",
        difficulty: 0.65,
        averageTime: 240,
        hints: ["a=1,b=√3,c=2", "||PF₁|-|PF₂||=2a=2", "用余弦定理"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "基本量", latex: "a=1,b=√(3),c=2,|F_1F_2|=4", annotation: ""),
                SolutionStep(order: 2, description: "余弦定理", latex: "|F_1F_2|^2=|PF_1|^2+|PF_2|^2-2|PF_1||PF_2|\\cos60°", annotation: ""),
                SolutionStep(order: 3, description: "双曲线定义", latex: "|PF_1|-|PF_2|=\\pm 2 \\Rightarrow |PF_1|^2+|PF_2|^2=(|PF_1|+|PF_2|)^2-2|PF_1||PF_2|", annotation: ""),
                SolutionStep(order: 4, description: "联立求解", latex: "16=(|PF_1|-|PF_2|)^2+2|PF_1||PF_2|-|PF_1||PF_2|=4+|PF_1||PF_2|", annotation: ""),
                SolutionStep(order: 5, description: "面积", latex: "S=\\frac{1}{2}|PF_1||PF_2|\\sin60°=\\frac{1}{2}\\cdot 12\\cdot\\frac{√(3)}{2}=√(3)", annotation: "")
            ],
            keyInsight: "焦点三角形面积=b^2·tan(θ/2)",
            commonMistakes: ["计算PF₁·PF₂出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "余弦定理展开", latex: "16=|PF_1|^2+|PF_2|^2-|PF_1||PF_2|", annotation: "cos60°=1/2")
                ],
                keyInsight: "余弦定理+定义联立",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦点三角形面积公式", latex: "S=b^2\\tan\\frac{\\theta}{2}=3\\cdot\\tan30°=3\\cdot\\frac{√(3)}{3}=√(3)", annotation: "θ=∠F₁PF₂=60°")
                ],
                keyInsight: "S=b²·tan(θ/2) 一步秒杀",
                commonMistakes: []
            ),
            weaponUsed: "焦点三角形面积公式",
            timeRatio: 4.0,
            detailedExplanation: """
                【焦点三角形面积公式】
                对椭圆/双曲线上的焦点三角形:
                S = b² · tan(θ/2)
                其中θ为两焦半径的夹角
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "双曲线", "焦点三角形", "面积", "核心", "必考"]
    ),

    Problem(
        id: "conic_029",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["hyperbola"],
        content: "双曲线x^2/4-y^2=1的焦点到渐近线的距离为______。",
        contentLatex: "\\frac{x^2}{4}-y^2=1",
        options: nil,
        answer: "1",
        difficulty: 0.50,
        averageTime: 120,
        hints: ["渐近线y=±x/2即x-2y=0", "焦点(±√5,0)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "基本量", latex: "a=2,b=1,c=√(5)", annotation: ""),
                SolutionStep(order: 2, description: "渐近线", latex: "y=\\frac{x}{2} \\Rightarrow x-2y=0", annotation: ""),
                SolutionStep(order: 3, description: "点线距", latex: "d=\\frac{|√(5)|}{√(1+4)}=\\frac{√(5)}{√(5)}=1", annotation: "")
            ],
            keyInsight: "焦点到渐近线距离=b",
            commonMistakes: ["计算失误"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "点线距公式", latex: "d=\\frac{|√(5)-0|}{√(1+4)}=1", annotation: "")
                ],
                keyInsight: "点线距公式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "结论秒杀", latex: "d=b=1", annotation: "焦点到渐近线距离恒等于b")
                ],
                keyInsight: "焦点到渐近线距离=b 直接秒杀",
                commonMistakes: []
            ),
            weaponUsed: "焦渐距=b",
            timeRatio: 5.0,
            detailedExplanation: """
                【焦点到渐近线距离】
                双曲线焦点到渐近线的距离恒等于b
                因为a,b,c构成直角三角形
                焦点到过原点的渐近线的距离 = b
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "双曲线", "渐近线", "距离", "基础"]
    ),

    Problem(
        id: "conic_030",
        type: .calculation,
        tier: 5,
        formulaIds: ["hyperbola"],
        content: "已知双曲线C: x^2/a^2-y^2/b^2=1的离心率为2，F₁、F₂为左右焦点。P为C上一点，|PF₁|=3|PF₂|，求|PF₁|。",
        contentLatex: "e=2,\\quad |PF_1|=3|PF_2|",
        options: nil,
        answer: "3a",
        difficulty: 0.65,
        averageTime: 200,
        hints: ["e=c/a=2", "||PF₁|-|PF₂||=2a", "分P在左支或右支"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "若P在右支", latex: "|PF_1|-|PF_2|=2a,|PF_1|=3|PF_2|", annotation: ""),
                SolutionStep(order: 2, description: "解方程", latex: "3|PF_2|-|PF_2|=2a \\Rightarrow |PF_2|=a,|PF_1|=3a", annotation: ""),
                SolutionStep(order: 3, description: "若P在左支", latex: "|PF_2|-|PF_1|=2a,|PF_1|=3|PF_2|", annotation: ""),
                SolutionStep(order: 4, description: "解方程并舍去", latex: "|PF_2|-3|PF_2|=2a \\Rightarrow |PF_2|=-a<0", annotation: "长度不能为负，左支无解"),
                SolutionStep(order: 5, description: "结论", latex: "\\text{仅右支成立},\\ |PF_1|=3a", annotation: "P恰为右顶点，|PF_2|=c-a=a为最小焦半径，合理")
            ],
            keyInsight: "双曲线上点分左右支讨论，本题左支解为负长度被舍去，故|PF₁|=3a唯一。",
            commonMistakes: ["误以为两支各有一解（左支实际无解）"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分支讨论", latex: "|PF_1|=3|PF_2|配合||PF_1|-|PF_2||=2a", annotation: "")
                ],
                keyInsight: "两支各解一次",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "比例代换", latex: "|PF_1|=3t,|PF_2|=t", annotation: "设比例"),
                    SolutionStep(order: 2, description: "定义带绝对值", latex: "|3t-t|=2a \\Rightarrow t=a \\Rightarrow |PF_1|=3a", annotation: "绝对值直接处理")
                ],
                keyInsight: "设比例t，绝对值自动处理分支",
                commonMistakes: []
            ),
            weaponUsed: "比例设元",
            timeRatio: 2.0,
            detailedExplanation: """
                【比例设元法】
                当题目给出两个焦半径的比值时
                直接设|PF₁|=3t, |PF₂|=t
                代入||PF₁|-|PF₂||=2a
                绝对值自动处理分支讨论
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "双曲线", "焦半径", "分类讨论", "核心"]
    ),

    // ============ 直线与椭圆联立 (conic_031~036) ============

    Problem(
        id: "conic_031",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse", "vieta"],
        content: "已知椭圆C: x^2/4+y^2/3=1，过右焦点F₂的直线l交C于A,B两点。当AB⊥x轴时，求|AB|。",
        contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\quad AB\\perp x\\text{轴过}F_2",
        options: nil,
        answer: "3",
        difficulty: 0.50,
        averageTime: 150,
        hints: ["c=1, F₂(1,0)", "x=1代入椭圆", "通径=2b^2/a"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "代入x=1", latex: "\\frac{1}{4}+\\frac{y^2}{3}=1 \\Rightarrow y^2=\\frac{9}{4}", annotation: ""),
                SolutionStep(order: 2, description: "AB长", latex: "|AB|=2|y|=2\\cdot\\frac{3}{2}=3", annotation: "")
            ],
            keyInsight: "过焦点的垂直弦即通径",
            commonMistakes: ["计算y^2出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "代入计算", latex: "x=1代入求y", annotation: "")
                ],
                keyInsight: "直接代入",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "通径公式", latex: "|AB|=\\frac{2b^2}{a}=\\frac{2\\times 3}{2}=3", annotation: "椭圆通径公式")
                ],
                keyInsight: "通径=2b²/a 秒杀",
                commonMistakes: []
            ),
            weaponUsed: "通径公式",
            timeRatio: 3.0,
            detailedExplanation: """
                【通径公式】
                过焦点且垂直于长轴的弦叫通径
                椭圆通径 = 2b²/a
                双曲线通径 = 2b²/a
                抛物线通径 = 2p
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "通径", "基础", "必考"]
    ),

    Problem(
        id: "conic_032",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse", "vieta"],
        content: "椭圆x^2/4+y^2=1，过点(1,0)作斜率为k的直线l交椭圆于A,B两点。若AB中点到y轴的距离等于1/2，求k的值。",
        contentLatex: "\\frac{x^2}{4}+y^2=1,\\quad l:\\;y=k(x-1)",
        options: nil,
        answer: "k=±1/2",
        difficulty: 0.65,
        averageTime: 240,
        hints: ["设A(x₁,y₁),B(x₂,y₂)", "韦达定理求x₁+x₂", "中点横坐标=1/2"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "联立", latex: "x^2+4k^2(x-1)^2=4", annotation: ""),
                SolutionStep(order: 2, description: "整理", latex: "(1+4k^2)x^2-8k^2x+4k^2-4=0", annotation: ""),
                SolutionStep(order: 3, description: "韦达定理", latex: "x_1+x_2=\\frac{8k^2}{1+4k^2}", annotation: ""),
                SolutionStep(order: 4, description: "中点条件", latex: "x_m=\\frac{x_1+x_2}{2}=\\frac{4k^2}{1+4k^2}=\\frac{1}{2}", annotation: "中点到y轴距离=|x_m|=1/2"),
                SolutionStep(order: 5, description: "解方程", latex: "8k^2=1+4k^2 \\Rightarrow 4k^2=1 \\Rightarrow k=\\pm\\frac{1}{2}", annotation: ""),
                SolutionStep(order: 6, description: "验证判别式", latex: "k^2=1/4:\\ 2x^2-2x-3=0,\\ \\Delta=4+24>0", annotation: "两交点存在，解成立")
            ],
            keyInsight: "直线与椭圆联立+韦达定理求中点横坐标，注意中点横坐标恒小于1。",
            commonMistakes: ["忘记判别式Δ>0的验证", "误以为中点横坐标能取到1（实际上<1）"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "联立韦达", latex: "(1+4k^2)x^2-8k^2x+(4k^2-4)=0", annotation: ""),
                    SolutionStep(order: 2, description: "中点", latex: "x_m=\\frac{4k^2}{1+4k^2}=\\frac{1}{2} \\Rightarrow k^2=\\frac{1}{4}", annotation: "")
                ],
                keyInsight: "韦达+中点横坐标",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "【秒杀】点差法", latex: "\\frac{x_1^2-x_2^2}{4}+(y_1^2-y_2^2)=0", annotation: "两点在椭圆上相减"),
                    SolutionStep(order: 2, description: "除以(x₁-x₂)得中点斜率关系", latex: "\\frac{2x_m}{4}+k\\cdot 2y_m=0 \\Rightarrow x_m+4k\\,y_m=0", annotation: "k=(y₁-y₂)/(x₁-x₂)"),
                    SolutionStep(order: 3, description: "代入x_m=1/2与y_m=k(x_m-1)", latex: "\\frac12+4k\\cdot k(\\tfrac12-1)=\\frac12-2k^2=0 \\Rightarrow k=\\pm\\frac12", annotation: "点差法一步求斜率")
                ],
                keyInsight: "点差法给出中点的‘横坐标+4k·纵坐标=0’关系，配合直线方程秒求k。",
                commonMistakes: []
            ),
            weaponUsed: "点差法",
            timeRatio: 1.5,
            detailedExplanation: """
                【点差法】
                椭圆上两点A(x₁,y₁),B(x₂,y₂)：x₁²/4+y₁²=1，x₂²/4+y₂²=1。
                两式相减并除以(x₁-x₂)得中点关系：x_m/4·2 + k·y_m·2=0，即 x_m+4k·y_m=0。
                又中点在直线上 y_m=k(x_m-1)。本题 x_m=1/2，代入得 1/2-2k²=0，k=±1/2。
                注意：本题中点横坐标 x_m=4k²/(1+4k²)<1，只能取(0,1)内的值。
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "韦达定理", "点差法", "中点", "核心"]
    ),

    Problem(
        id: "conic_033",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse", "vieta"],
        content: "已知椭圆C: x^2/2+y^2=1，A,B为C上两点，直线OA斜率k₁，直线OB斜率k₂，且k₁·k₂=-1/2。证明|OA|²+|OB|²为定值。",
        contentLatex: "\\frac{x^2}{2}+y^2=1,\\quad k_1k_2=-\\frac{1}{2}",
        options: nil,
        answer: "|OA|^2+|OB|^2=3",
        difficulty: 0.75,
        averageTime: 360,
        hints: ["设A(x₁,y₁)在椭圆上", "k₁k₂=y₁y₂/(x₁x₂)=-1/2", "用参数方程A(√2cosα,sinα)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "参数设点", latex: "A(√(2)\\cos\\alpha,\\sin\\alpha),B(√(2)\\cos\\beta,\\sin\\beta)", annotation: ""),
                SolutionStep(order: 2, description: "斜率乘积", latex: "k_1k_2=\\frac{\\sin\\alpha\\sin\\beta}{2\\cos\\alpha\\cos\\beta}=-\\frac{1}{2}", annotation: ""),
                SolutionStep(order: 3, description: "化简", latex: "\\sin\\alpha\\sin\\beta=-\\cos\\alpha\\cos\\beta \\Rightarrow \\cos\\alpha\\cos\\beta+\\sin\\alpha\\sin\\beta=\\cos(\\alpha-\\beta)=0", annotation: "和角公式：cosαcosβ+sinαsinβ=cos(α−β)，故α−β=±90°"),
                SolutionStep(order: 4, description: "计算|OA|²+|OB|²", latex: "=2\\cos^2\\alpha+\\sin^2\\alpha+2\\cos^2\\beta+\\sin^2\\beta=1+\\cos^2\\alpha+1+\\cos^2\\beta", annotation: ""),
                SolutionStep(order: 5, description: "利用条件", latex: "\\tan\\alpha\\tan\\beta=-1 \\Rightarrow \\cos^2\\alpha+\\cos^2\\beta=1", annotation: ""),
                SolutionStep(order: 6, description: "结论", latex: "|OA|^2+|OB|^2=2+1=3", annotation: "")
            ],
            keyInsight: "参数方程+三角恒等式",
            commonMistakes: ["参数设点后化简困难"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "参数方程设点", latex: "A(√(2)\\cos\\alpha,\\sin\\alpha)", annotation: ""),
                    SolutionStep(order: 2, description: "三角化简", latex: "\\tan\\alpha\\tan\\beta=-1", annotation: "")
                ],
                keyInsight: "椭圆参数方程",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "齐次化", latex: "设A(x_1,y_1): |OA|^2=x_1^2+y_1^2", annotation: ""),
                    SolutionStep(order: 2, description: "用椭圆方程替换", latex: "x_1^2=2(1-y_1^2) \\Rightarrow |OA|^2=2-y_1^2", annotation: ""),
                    SolutionStep(order: 3, description: "对称处理", latex: "|OA|^2+|OB|^2=4-(y_1^2+y_2^2)", annotation: ""),
                    SolutionStep(order: 4, description: "利用k₁k₂条件", latex: "y_1^2+y_2^2结合k₁k₂=-1/2得y_1^2+y_2^2=1", annotation: ""),
                    SolutionStep(order: 5, description: "结论", latex: "|OA|^2+|OB|^2=4-1=3", annotation: "")
                ],
                keyInsight: "椭圆方程消元+斜率条件",
                commonMistakes: []
            ),
            weaponUsed: "椭圆方程消元",
            timeRatio: 1.5,
            detailedExplanation: """
                【定值问题策略】
                1. 用椭圆方程消去一个变量
                2. 利用附加条件(如k₁k₂=常数)
                3. 化简得到与参数无关的常数
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "定值", "证明", "压轴", "核心"]
    ),

    Problem(
        id: "conic_034",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse", "vieta"],
        content: "椭圆C: x^2/4+y^2/3=1，F₁(-1,0), F₂(1,0)。直线l过F₂交C于M,N两点。求△F₁MN面积的最大值。",
        contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\quad l\\text{过}F_2",
        options: nil,
        answer: "3",
        difficulty: 0.75,
        averageTime: 360,
        hints: ["设l: x=my+1(含竖直弦)", "联立韦达", "面积=½|F₁F₂|·|y₁-y₂|"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "设直线", latex: "x=my+1", annotation: "过F_2(1,0)，m=0即竖直弦，统一处理"),
                SolutionStep(order: 2, description: "联立(×12)", latex: "3(my+1)^2+4y^2=12 \\Rightarrow (3m^2+4)y^2+6my-9=0", annotation: ""),
                SolutionStep(order: 3, description: "韦达定理", latex: "y_1+y_2=\\frac{-6m}{3m^2+4},\\;y_1y_2=\\frac{-9}{3m^2+4}", annotation: ""),
                SolutionStep(order: 4, description: "面积", latex: "S=\\frac{1}{2}|F_1F_2|\\cdot|y_1-y_2|=|y_1-y_2|", annotation: "|F₁F₂|=2，M、N在x轴两侧"),
                SolutionStep(order: 5, description: "(y₁-y₂)²", latex: "=(y_1+y_2)^2-4y_1y_2=\\frac{36m^2+36(3m^2+4)}{(3m^2+4)^2}=\\frac{144(m^2+1)}{(3m^2+4)^2}", annotation: ""),
                SolutionStep(order: 6, description: "化为单变量", latex: "S^2=\\frac{144(m^2+1)}{(3m^2+4)^2},\\;\\text{令}u=m^2\\ge0", annotation: ""),
                SolutionStep(order: 7, description: "单调性", latex: "g(u)=\\frac{u+1}{(3u+4)^2},\\;g'(u)=\\frac{-3u-2}{(3u+4)^3}<0", annotation: "g随u增大而减小"),
                SolutionStep(order: 8, description: "取最大值", latex: "u=0(m=0)\\text{时}S^2_{\\max}=\\frac{144}{16}=9 \\Rightarrow S_{\\max}=3", annotation: "竖直弦(通径)处取得")
            ],
            keyInsight: "用x=my+1把竖直弦纳入统一讨论，面积关于u=m²单调递减，最大值在通径处取得。",
            commonMistakes: ["用y=k(x-1)会漏掉竖直弦，而最大值恰在竖直弦处", "误判存在内部极值点"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "联立得韦达", latex: "(3m^2+4)y^2+6my-9=0", annotation: ""),
                    SolutionStep(order: 2, description: "面积表达式", latex: "S=|y_1-y_2|=\\frac{12√(m^2+1)}{3m^2+4}", annotation: ""),
                    SolutionStep(order: 3, description: "求最值", latex: "\\text{关于}m^2\\text{单调减},\\ m=0\\text{时}S_{\\max}=3", annotation: "")
                ],
                keyInsight: "x=my+1参数化+单调性",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "【秒杀】最大弦面积出现在通径(竖直弦)", latex: "\\text{竖直弦}x=1:\\ y^2=3(1-\\tfrac14)=\\tfrac94,\\ |MN|=3", annotation: "通径长2b²/a=2·3/2=3"),
                    SolutionStep(order: 2, description: "直接算面积", latex: "S=\\frac12|MN|\\cdot d(F_1,l)=\\frac12\\cdot3\\cdot|1-(-1)|=\\frac12\\cdot3\\cdot2=3", annotation: "F₁到直线x=1的距离为2"),
                    SolutionStep(order: 3, description: "说明为何是最大", latex: "S^2=\\frac{144(m^2+1)}{(3m^2+4)^2}\\text{对}m^2\\text{单调减}\\Rightarrow m=0\\text{最大}", annotation: "其余方向面积更小")
                ],
                keyInsight: "焦点弦面积最大值常在通径处；先猜通径再用单调性确认，省去求导。",
                commonMistakes: []
            ),
            weaponUsed: "通径+单调性",
            timeRatio: 2.0,
            detailedExplanation: """
                【过焦点弦三角形面积最大值】
                设l: x=my+1(可表示竖直弦)，联立得 (3m²+4)y²+6my-9=0。
                S=½|F₁F₂|·|y₁-y₂|=|y₁-y₂|，化简 S²=144(m²+1)/(3m²+4)²。
                关于 u=m² 求导知其单调递减，故 m=0(竖直弦/通径)时面积最大：
                S_max=√(144/16)=3。
                直观验证：通径长 2b²/a=3，F₁到准线侧距离 |F₁F₂|=2，S=½·3·2=3。
                """
        ),
        gaokaoYear: 2019,
        tags: ["圆锥曲线", "椭圆", "焦点弦", "面积最值", "压轴", "必考"]
    ),

    Problem(
        id: "conic_035",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse", "vieta"],
        content: "已知椭圆x^2/4+y^2/3=1，直线l: y=kx+m与椭圆交于A,B两点，且以AB为直径的圆过原点。求m²的取值范围。",
        contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\quad \\vec{OA}\\cdot\\vec{OB}=0",
        options: nil,
        answer: "12/7<m²<3",
        difficulty: 0.80,
        averageTime: 420,
        hints: ["AB为直径过O ⇔ OA·OB=0", "x₁x₂+y₁y₂=0", "韦达定理+判别式"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "条件转化", latex: "\\vec{OA}\\cdot\\vec{OB}=x_1x_2+y_1y_2=0", annotation: ""),
                SolutionStep(order: 2, description: "联立", latex: "(3+4k^2)x^2+8kmx+4m^2-12=0", annotation: ""),
                SolutionStep(order: 3, description: "韦达", latex: "x_1x_2=\\frac{4m^2-12}{3+4k^2},\\;x_1+x_2=\\frac{-8km}{3+4k^2}", annotation: ""),
                SolutionStep(order: 4, description: "y₁y₂展开", latex: "y_1y_2=k^2x_1x_2+km(x_1+x_2)+m^2", annotation: ""),
                SolutionStep(order: 5, description: "OA·OB=0", latex: "(1+k^2)x_1x_2+km(x_1+x_2)+m^2=0", annotation: ""),
                SolutionStep(order: 6, description: "代入韦达化简", latex: "\\frac{(1+k^2)(4m^2-12)-8k^2m^2+m^2(3+4k^2)}{3+4k^2}=0", annotation: ""),
                SolutionStep(order: 7, description: "化简后加Δ>0", latex: "\\text{求}m^2\\text{的范围}", annotation: "")
            ],
            keyInsight: "直径圆过原点 ⇔ OA·OB=0",
            commonMistakes: ["展开y₁y₂时丢项"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "韦达展开", latex: "x_1x_2+y_1y_2=0", annotation: "")
                ],
                keyInsight: "标准韦达法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "齐次化处理", latex: "x_1x_2+y_1y_2=0,\\;用\\frac{x^2}{4}+\\frac{y^2}{3}=1齐次化y=kx+m", annotation: ""),
                    SolutionStep(order: 2, description: "齐次化关键步骤", latex: "1=\\frac{x^2}{4}+\\frac{y^2}{3},\\;\\frac{y-m}{k}=x", annotation: ""),
                    SolutionStep(order: 3, description: "将1=(y-m)²/(k²·4)+y²/3代入x²+y²=0的齐次形式", latex: "x^2+y^2=(x^2+y^2)\\cdot 1", annotation: "齐次化思想")
                ],
                keyInsight: "齐次化：用椭圆方程的1替换",
                commonMistakes: []
            ),
            weaponUsed: "齐次化技巧",
            timeRatio: 1.5,
            detailedExplanation: """
                【齐次化技巧】
                将圆锥曲线方程=1看作一个整体
                在向量条件中将常数项用圆锥曲线方程替换
                实现齐次化，避免繁琐的韦达展开
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "齐次化", "向量", "压轴", "核心"]
    ),

    Problem(
        id: "conic_036",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse", "vieta"],
        content: "椭圆C: x^2/4+y^2=1，A(-2,0)，B(2,0)，P为C上异于A,B的点。求直线PA斜率与直线PB斜率之积。",
        contentLatex: "k_{PA}\\cdot k_{PB}=?\\quad P\\in C,P\\ne A,B",
        options: nil,
        answer: "-1/4",
        difficulty: 0.55,
        averageTime: 180,
        hints: ["设P(x₀,y₀)在椭圆上", "k_PA·k_PB=y₀²/(x₀²-4)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "设P(x₀,y₀)", latex: "k_{PA}\\cdot k_{PB}=\\frac{y_0}{x_0+2}\\cdot\\frac{y_0}{x_0-2}=\\frac{y_0^2}{x_0^2-4}", annotation: ""),
                SolutionStep(order: 2, description: "椭圆方程", latex: "\\frac{x_0^2}{4}+y_0^2=1 \\Rightarrow y_0^2=1-\\frac{x_0^2}{4}", annotation: ""),
                SolutionStep(order: 3, description: "代入", latex: "\\frac{1-x_0^2/4}{x_0^2-4}=\\frac{-(x_0^2-4)/4}{x_0^2-4}=-\\frac{1}{4}", annotation: "")
            ],
            keyInsight: "椭圆上斜率之积为定值-b²/a²",
            commonMistakes: ["分子分母化简出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "直接计算", latex: "\\frac{y_0^2}{x_0^2-4}=-\\frac{1}{4}", annotation: "")
                ],
                keyInsight: "代入椭圆方程",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "结论秒杀", latex: "k_{PA}\\cdot k_{PB}=-\\frac{b^2}{a^2}=-\\frac{1}{4}", annotation: "椭圆顶点斜率积恒为-b²/a²")
                ],
                keyInsight: "椭圆顶点斜率积=-b²/a² 直接秒杀",
                commonMistakes: []
            ),
            weaponUsed: "顶点斜率积定值",
            timeRatio: 5.0,
            detailedExplanation: """
                【椭圆顶点斜率积】
                椭圆x²/a²+y²/b²=1
                A(-a,0), B(a,0), P为椭圆上一点
                k_PA · k_PB = -b²/a²
                这是个重要的定值结论
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "斜率积", "定值", "核心", "必考"]
    ),

    // ============ 抛物线进阶 (conic_037~041) ============

    Problem(
        id: "conic_037",
        type: .calculation,
        tier: 5,
        formulaIds: ["parabola"],
        content: "抛物线y²=8x的焦点为F，准线为l。P为抛物线上一点，PA⊥l于A。若∠APF=60°，求|PF|。",
        contentLatex: "y^2=8x,\\quad PA\\perp l,\\;\\angle APF=60°",
        options: nil,
        answer: "8",
        difficulty: 0.60,
        averageTime: 180,
        hints: ["p=4, F(2,0), 准线x=-2", "|PA|=|PF|(抛物线定义)", "∠APF是顶角，PA=PF"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "抛物线定义", latex: "|PA|=|PF|", annotation: "P到准线距离=P到焦点距离，△PAF等腰"),
                SolutionStep(order: 2, description: "顶角60°⇒等边", latex: "\\angle APF=60°\\text{是顶角},\\ PA=PF \\Rightarrow \\triangle PAF\\text{为等边三角形}", annotation: "等腰+顶角60°=等边"),
                SolutionStep(order: 3, description: "用等边边长相等", latex: "|AF|=|PF|=|PA|=x_P+2", annotation: "焦半径|PF|=x_P+p/2=x_P+2"),
                SolutionStep(order: 4, description: "坐标算|AF|", latex: "A(-2,y_P),F(2,0):\\ |AF|=√(16+y_P^2)=√(16+8x_P)", annotation: "y_P^2=8x_P"),
                SolutionStep(order: 5, description: "列方程", latex: "√(16+8x_P)=x_P+2 \\Rightarrow x_P^2-4x_P-12=0", annotation: ""),
                SolutionStep(order: 6, description: "解出", latex: "(x_P-6)(x_P+2)=0 \\Rightarrow x_P=6,\\ |PF|=x_P+2=8", annotation: "x_P=-2舍去")
            ],
            keyInsight: "抛物线定义把|PA|换成|PF|，等腰+顶角60°立刻得等边三角形。",
            commonMistakes: ["误判∠APF不是顶角", "忘记焦半径=x_P+p/2"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "坐标法", latex: "设P(x_P,y_P),y_P^2=8x_P,F(2,0),A(-2,y_P)", annotation: ""),
                    SolutionStep(order: 2, description: "向量夹角列方程", latex: "\\cos\\angle APF=\\frac{\\vec{PA}\\cdot\\vec{PF}}{|PA||PF|}=\\frac12", annotation: "解得x_P=6，|PF|=8")
                ],
                keyInsight: "坐标+向量夹角，稳妥",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "【秒杀】PA∥对称轴⇒∠APF=焦半径FP与轴夹角", latex: "PA\\text{水平},\\ \\angle APF=60°=\\theta", annotation: "θ为F→P方向与正向x轴的夹角"),
                    SolutionStep(order: 2, description: "焦半径极坐标公式", latex: "|PF|=\\frac{p}{1-\\cos\\theta}=\\frac{4}{1-\\cos60°}=\\frac{4}{1-\\tfrac12}", annotation: "半通径p=4"),
                    SolutionStep(order: 3, description: "一步出", latex: "|PF|=\\frac{4}{1/2}=8", annotation: "与等边三角形法结果一致"),
                    SolutionStep(order: 4, description: "更快：等边三角形", latex: "|PA|=|PF|\\text{且顶角}60°\\Rightarrow\\text{等边}\\Rightarrow |AF|=|PF| \\Rightarrow |PF|=8", annotation: "推荐这条最短")
                ],
                keyInsight: "认出等边三角形(等腰+顶角60°)是本题最短路径，|PF|=|AF|直接列方程。",
                commonMistakes: []
            ),
            weaponUsed: "抛物线定义+等边三角形",
            timeRatio: 2.0,
            detailedExplanation: """
                【抛物线焦点+准线问题】
                PA⊥准线 ⇒ |PA|=|PF|(定义)，△PAF等腰。
                ∠APF=60°是顶角，等腰+顶角60° ⇒ 等边三角形 ⇒ |AF|=|PF|。
                设|PF|=x_P+2，|AF|=√(16+8x_P)，令两者相等解得 x_P=6，|PF|=8。
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "抛物线", "焦点", "准线", "角度", "核心"]
    ),

    Problem(
        id: "conic_038",
        type: .calculation,
        tier: 6,
        formulaIds: ["parabola", "vieta"],
        content: "抛物线y²=4x，过焦点F的直线交抛物线于A,B两点。若|AF|=3|BF|，求|AB|。",
        contentLatex: "y^2=4x,\\quad |AF|=3|BF|",
        options: nil,
        answer: "16/3",
        difficulty: 0.70,
        averageTime: 300,
        hints: ["焦点弦性质1/|AF|+1/|BF|=2/p", "p=2", "|AF|=3|BF|代入"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "焦点弦公式", latex: "\\frac{1}{|AF|}+\\frac{1}{|BF|}=\\frac{2}{p}=1", annotation: "p=2"),
                SolutionStep(order: 2, description: "设|BF|=t", latex: "\\frac{1}{3t}+\\frac{1}{t}=1 \\Rightarrow \\frac{4}{3t}=1 \\Rightarrow t=\\frac{4}{3}", annotation: ""),
                SolutionStep(order: 3, description: "结果", latex: "|AB|=|AF|+|BF|=4t=\\frac{16}{3}", annotation: "")
            ],
            keyInsight: "焦点弦调和公式 1/|AF|+1/|BF|=2/p",
            commonMistakes: ["忘记焦点弦公式用坐标法太繁"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设直线联立", latex: "y=k(x-1)代入y^2=4x", annotation: ""),
                    SolutionStep(order: 2, description: "韦达+比例条件", latex: "计算量大", annotation: "")
                ],
                keyInsight: "联立韦达",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "调和公式秒杀", latex: "\\frac{1}{3t}+\\frac{1}{t}=\\frac{2}{p}=1 \\Rightarrow t=4/3", annotation: ""),
                    SolutionStep(order: 2, description: "结果", latex: "|AB|=4t=16/3", annotation: "")
                ],
                keyInsight: "1/|AF|+1/|BF|=2/p 两步秒杀",
                commonMistakes: []
            ),
            weaponUsed: "抛物线焦点弦调和公式",
            timeRatio: 4.0,
            detailedExplanation: """
                【抛物线焦点弦调和公式】
                y²=2px的焦点弦AB:
                1/|AF|+1/|BF|=2/p
                这是抛物线最重要的焦点弦性质
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "抛物线", "焦点弦", "调和", "核心", "必考"]
    ),

    Problem(
        id: "conic_039",
        type: .calculation,
        tier: 6,
        formulaIds: ["parabola"],
        content: "抛物线y²=2px(p>0)上两点A,B关于x轴对称，O为原点，∠AOB=90°，|AB|=4。求p的值。",
        contentLatex: "y^2=2px,\\quad A,B\\text{关于x轴对称},\\;\\angle AOB=90°,\\;|AB|=4",
        options: nil,
        answer: "p=2",
        difficulty: 0.65,
        averageTime: 240,
        hints: ["A(a,b), B(a,-b)关于x轴对称", "|AB|=2b=4", "OA⊥OB即向量点积=0"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "对称", latex: "A(x_0,2),B(x_0,-2),|AB|=4 \\Rightarrow b=2", annotation: ""),
                SolutionStep(order: 2, description: "A在抛物线上", latex: "4=2px_0 \\Rightarrow x_0=2/p", annotation: ""),
                SolutionStep(order: 3, description: "∠AOB=90°", latex: "\\vec{OA}\\cdot\\vec{OB}=x_0^2-4=0 \\Rightarrow x_0=2", annotation: ""),
                SolutionStep(order: 4, description: "联立", latex: "2/p=2 \\Rightarrow p=1", annotation: "检验: y²=2x, x₀=2, y₀²=4✓")
            ],
            keyInsight: "对称+垂直条件",
            commonMistakes: ["把p和2p搞混"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "坐标法", latex: "A(2/p,2),B(2/p,-2),\\vec{OA}\\cdot\\vec{OB}=0", annotation: "")
                ],
                keyInsight: "坐标+垂直",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "参数法", latex: "A(pt^2,pt),B(pt^2,-pt)", annotation: "y²=2px上点(pt²,pt)"),
                    SolutionStep(order: 2, description: "|AB|条件", latex: "2pt=4 \\Rightarrow pt=2", annotation: ""),
                    SolutionStep(order: 3, description: "∠AOB=90°", latex: "p^2t^4-p^2t^2=0 \\Rightarrow t^2=1 \\Rightarrow t=1,p=2", annotation: "")
                ],
                keyInsight: "抛物线参数方程简化计算",
                commonMistakes: []
            ),
            weaponUsed: "抛物线参数设点",
            timeRatio: 1.5,
            detailedExplanation: """
                【抛物线参数设点】
                y²=2px上的点可设为(pt²,pt)
                其中t为参数, 满足y=pt, x=pt²=y²/(2p)
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "抛物线", "对称", "垂直", "参数方程", "核心"]
    ),

    Problem(
        id: "conic_040",
        type: .calculation,
        tier: 6,
        formulaIds: ["parabola", "vieta"],
        content: "抛物线C: y²=4x，F为焦点。过F的直线交C于P,Q两点（PQ为焦点弦），求1/|PF|+1/|QF|的值。",
        contentLatex: "y^2=4x,\\;PQ\\text{过焦点}F,\\quad \\frac{1}{|PF|}+\\frac{1}{|QF|}=?",
        options: nil,
        answer: "1",
        difficulty: 0.70,
        averageTime: 300,
        hints: ["焦半径|PF|=x+1", "设P(t₁²,2t₁)，焦点弦满足t₁t₂=-1", "通分即见定值"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "参数设点", latex: "P(t_1^2,2t_1),Q(t_2^2,2t_2),F(1,0)", annotation: "y²=4x，半通径l=2"),
                SolutionStep(order: 2, description: "焦点弦参数性质", latex: "P,F,Q\\text{共线}\\Rightarrow t_1 t_2=-1", annotation: "y²=4x焦点弦的两参数之积为-1"),
                SolutionStep(order: 3, description: "焦半径", latex: "|PF|=t_1^2+1,\\ |QF|=t_2^2+1", annotation: "焦半径=x+p/2=x+1"),
                SolutionStep(order: 4, description: "代入t₂=-1/t₁", latex: "|QF|=t_2^2+1=\\frac{1}{t_1^2}+1=\\frac{1+t_1^2}{t_1^2}", annotation: ""),
                SolutionStep(order: 5, description: "通分相加", latex: "\\frac{1}{|PF|}+\\frac{1}{|QF|}=\\frac{1}{t_1^2+1}+\\frac{t_1^2}{t_1^2+1}", annotation: ""),
                SolutionStep(order: 6, description: "结果", latex: "=\\frac{1+t_1^2}{1+t_1^2}=1", annotation: "与t₁无关，定值为1")
            ],
            keyInsight: "焦点弦两参数之积为-1，焦半径之倒数和恰为定值2/l=1。",
            commonMistakes: ["忘记焦点弦t₁t₂=-1这一关键性质"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "参数法", latex: "P(t_1^2,2t_1),Q(t_2^2,2t_2),t_1t_2=-1", annotation: ""),
                    SolutionStep(order: 2, description: "焦半径倒数和", latex: "\\frac{1}{t_1^2+1}+\\frac{1}{t_2^2+1}=1", annotation: "代入t₂=-1/t₁通分")
                ],
                keyInsight: "参数设点+焦点弦性质",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "【秒杀】焦点极坐标", latex: "r=\\frac{l}{1-\\cos\\theta},\\ l=2", annotation: "抛物线焦点弦极坐标，l为半通径"),
                    SolutionStep(order: 2, description: "弦两端相差π", latex: "P:\\theta,\\ Q:\\theta+\\pi\\Rightarrow r_2=\\frac{l}{1-\\cos(\\theta+\\pi)}=\\frac{l}{1+\\cos\\theta}", annotation: ""),
                    SolutionStep(order: 3, description: "倒数和秒出定值", latex: "\\frac{1}{r_1}+\\frac{1}{r_2}=\\frac{1-\\cos\\theta}{l}+\\frac{1+\\cos\\theta}{l}=\\frac{2}{l}=1", annotation: "cosθ消去，秒得1"),
                ],
                keyInsight: "焦点弦倒数和=2/l是定值，极坐标下cosθ自动消去，一步秒杀。",
                commonMistakes: []
            ),
            weaponUsed: "焦点极坐标",
            timeRatio: 1.5,
            detailedExplanation: """
                【焦点弦调和定值】
                以焦点为极点，x轴正方向为极轴，抛物线焦点弦极坐标 r=l/(1-cosθ)，
                l为半通径(本题l=2)。焦点弦两端方向相差π，故
                1/|PF|+1/|QF| = (1-cosθ)/l + (1+cosθ)/l = 2/l = 1。
                这正是焦点弦"焦半径倒数和为定值2/l"的结论。
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "抛物线", "焦点弦", "定值", "压轴"]
    ),

    Problem(
        id: "conic_041",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["parabola"],
        content: "已知抛物线y²=8x上一点P到焦点F的距离为6，则P到y轴的距离为______。",
        contentLatex: "y^2=8x,\\;|PF|=6",
        options: nil,
        answer: "4",
        difficulty: 0.45,
        averageTime: 90,
        hints: ["p=4, 准线x=-2", "|PF|=x+p/2=x+2", "到y轴距离=x"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "焦半径", latex: "|PF|=x+\\frac{p}{2}=x+2=6 \\Rightarrow x=4", annotation: ""),
                SolutionStep(order: 2, description: "到y轴距离", latex: "d=|x|=4", annotation: "")
            ],
            keyInsight: "焦半径公式|PF|=x+p/2",
            commonMistakes: ["混淆p和p/2"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦半径公式", latex: "x=|PF|-p/2=6-2=4", annotation: "")
                ],
                keyInsight: "焦半径",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "定义法", latex: "|PF|=d(P,准线)=x+2=6 \\Rightarrow x=4", annotation: "")
                ],
                keyInsight: "抛物线定义：到焦点=到准线",
                commonMistakes: []
            ),
            weaponUsed: "抛物线定义",
            timeRatio: 1.0,
            detailedExplanation: """
                【抛物线定义】
                y²=2px上点P到焦点距离=到准线距离=x+p/2
                到y轴距离=x=|PF|-p/2
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "抛物线", "焦半径", "基础"]
    ),

    // ============ 离心率专题 (conic_042~045) ============

    Problem(
        id: "conic_042",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse"],
        content: "椭圆C: x^2/a^2+y^2/b^2=1 (a>b>0)的左焦点F₁(-c,0)，右顶点A(a,0)。若|F₁A|=3b，求离心率e。",
        contentLatex: "|F_1A|=3b",
        options: nil,
        answer: "e=4/5",
        difficulty: 0.60,
        averageTime: 180,
        hints: ["|F₁A|=a+c", "a+c=3b", "b²=a²-c²"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "|F₁A|", latex: "|F_1A|=a+c=3b", annotation: ""),
                SolutionStep(order: 2, description: "b²=a²-c²", latex: "(a+c)^2=9(a^2-c^2)=9(a+c)(a-c)", annotation: ""),
                SolutionStep(order: 3, description: "约去a+c", latex: "a+c=9(a-c) \\Rightarrow a+c=9a-9c \\Rightarrow 10c=8a", annotation: ""),
                SolutionStep(order: 4, description: "离心率", latex: "e=\\frac{c}{a}=\\frac{4}{5}", annotation: "")
            ],
            keyInsight: "利用b²=a²-c²=(a+c)(a-c)因式分解",
            commonMistakes: ["不会因式分解b²"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "列方程", latex: "a+c=3√(a^2-c^2)", annotation: ""),
                    SolutionStep(order: 2, description: "两边平方", latex: "a^2+2ac+c^2=9a^2-9c^2", annotation: "可以但较繁")
                ],
                keyInsight: "方程法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "因式分解", latex: "(a+c)=9(a-c) \\Rightarrow 1+e=9(1-e)", annotation: "两边除以a"),
                    SolutionStep(order: 2, description: "秒解", latex: "1+e=9-9e \\Rightarrow 10e=8 \\Rightarrow e=4/5", annotation: "")
                ],
                keyInsight: "b²=(a+c)(a-c)因式分解避免平方展开",
                commonMistakes: []
            ),
            weaponUsed: "b²因式分解",
            timeRatio: 2.0,
            detailedExplanation: """
                【离心率求解技巧】
                遇到b时,用b²=(a+c)(a-c)
                再除以a得到关于e的方程:
                (1+e)(1-e)=(b/a)²
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "离心率", "因式分解", "核心", "必考"]
    ),

    Problem(
        id: "conic_043",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse"],
        content: "椭圆C: x^2/a^2+y^2/b^2=1 (a>b>0)，F₁F₂为焦点，P为椭圆上一点满足∠F₁PF₂=90°且|PF₁|=4|PF₂|。求离心率。",
        contentLatex: "\\angle F_1PF_2=90°,\\;|PF_1|=4|PF_2|",
        options: nil,
        answer: "e=√(17)/5",
        difficulty: 0.70,
        averageTime: 300,
        hints: ["|PF₁|+|PF₂|=2a", "|PF₁|=4|PF₂|→|PF₂|=2a/5", "勾股定理|F₁F₂|²=|PF₁|²+|PF₂|²"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "设焦半径", latex: "|PF_2|=t,|PF_1|=4t,\\;5t=2a \\Rightarrow t=2a/5", annotation: ""),
                SolutionStep(order: 2, description: "勾股定理", latex: "(2c)^2=(4t)^2+t^2=17t^2", annotation: "∠P=90°"),
                SolutionStep(order: 3, description: "代入", latex: "4c^2=17\\cdot\\frac{4a^2}{25} \\Rightarrow c^2=\\frac{17a^2}{25}", annotation: ""),
                SolutionStep(order: 4, description: "离心率", latex: "e=\\frac{c}{a}=\\frac{√(17)}{5}", annotation: "")
            ],
            keyInsight: "焦点三角形中∠P=90°用勾股定理",
            commonMistakes: ["忘记2c是焦距不是c"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "定义+勾股", latex: "5t=2a, 4c^2=17t^2", annotation: "")
                ],
                keyInsight: "定义+勾股",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "比例设元", latex: "|PF_1|=4t,|PF_2|=t", annotation: ""),
                    SolutionStep(order: 2, description: "两条件列两方程", latex: "\\begin{cases}5t=2a\\\\16t^2+t^2=4c^2\\end{cases}", annotation: ""),
                    SolutionStep(order: 3, description: "消t", latex: "17\\cdot\\frac{4a^2}{25}=4c^2 \\Rightarrow e^2=17/25", annotation: "一步消元")
                ],
                keyInsight: "比例设元+一步消元",
                commonMistakes: []
            ),
            weaponUsed: "比例设元",
            timeRatio: 1.5,
            detailedExplanation: """
                【焦点三角形+比例】
                |PF₁|:|PF₂|=m:n时
                设|PF₂|=t, 则|PF₁|=mt/n
                (m+n)t/n=2a → t确定
                再用角度条件(余弦定理或勾股)求c
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "离心率", "焦点三角形", "压轴", "核心"]
    ),

    Problem(
        id: "conic_044",
        type: .fillInBlank,
        tier: 6,
        formulaIds: ["ellipse"],
        content: "椭圆x^2/a^2+y^2/b^2=1 (a>b>0)，B(0,b)为短轴端点，F₁为左焦点。若BF₁=√3·b，则离心率e=______。",
        contentLatex: "|BF_1|=√(3)b",
        options: nil,
        answer: "√(2)/2",
        difficulty: 0.55,
        averageTime: 150,
        hints: ["|BF₁|²=b²+c²=a²", "所以|BF₁|=a", "a=√3b"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "关键性质", latex: "|BF_1|=√(b^2+c^2)=a", annotation: "B到焦点距离=a"),
                SolutionStep(order: 2, description: "条件", latex: "a=√(3)b \\Rightarrow a^2=3b^2=3(a^2-c^2)", annotation: ""),
                SolutionStep(order: 3, description: "求e", latex: "a^2=3a^2-3c^2 \\Rightarrow 2a^2=3c^2 \\Rightarrow e=\\frac{√(6)}{3}", annotation: "")
            ],
            keyInsight: "短轴端点到焦点距离=a",
            commonMistakes: ["不知道|BF|=a这个性质"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "距离公式", latex: "|BF_1|=√(c^2+b^2)=√(a^2)=a", annotation: "")
                ],
                keyInsight: "b²+c²=a²直接得|BF|=a",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀结论", latex: "|BF_1|=a=√(3)b", annotation: "短轴端点到焦点=a"),
                    SolutionStep(order: 2, description: "代入", latex: "a^2=3(a^2-c^2) \\Rightarrow e^2=2/3 \\Rightarrow e=√(6)/3", annotation: "")
                ],
                keyInsight: "|BF|=a是最基本的椭圆性质",
                commonMistakes: []
            ),
            weaponUsed: "短轴端点到焦点=a",
            timeRatio: 2.0,
            detailedExplanation: """
                【椭圆基本性质】
                短轴端点B(0,±b)到焦点F(±c,0)的距离
                |BF|=√(b²+c²)=√(a²)=a
                这是因为b²+c²=a²
                a,b,c构成直角三角形
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "离心率", "短轴端点", "基础", "必考"]
    ),

    Problem(
        id: "conic_045",
        type: .calculation,
        tier: 6,
        formulaIds: ["ellipse"],
        content: "椭圆x²/4+y²/3=1的左焦点F₁，右焦点F₂，P为椭圆上一点，且|PF₁|=2|PF₂|，求cos∠F₁PF₂。",
        contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\ |PF_1|=2|PF_2|",
        options: nil,
        answer: "11/16",
        difficulty: 0.78,
        averageTime: 240,
        hints: ["a=2,b=√3,c=1", "|PF₁|+|PF₂|=2a=4 且 |PF₁|=2|PF₂|", "余弦定理(2c=2)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "基本量", latex: "a=2,\\ b=\\sqrt3,\\ c=1,\\ 2c=2", annotation: ""),
                SolutionStep(order: 2, description: "求焦半径", latex: "|PF_1|+|PF_2|=4,\\ |PF_1|=2|PF_2|\\Rightarrow |PF_2|=\\tfrac43,\\ |PF_1|=\\tfrac83", annotation: ""),
                SolutionStep(order: 3, description: "余弦定理", latex: "\\cos\\angle F_1PF_2=\\frac{|PF_1|^2+|PF_2|^2-(2c)^2}{2|PF_1||PF_2|}", annotation: ""),
                SolutionStep(order: 4, description: "代入", latex: "=\\frac{\\frac{64}{9}+\\frac{16}{9}-4}{2\\cdot\\frac{8}{3}\\cdot\\frac{4}{3}}=\\frac{\\frac{44}{9}}{\\frac{64}{9}}=\\frac{11}{16}", annotation: "")
            ],
            keyInsight: "比例条件+椭圆定义确定两焦半径，再用余弦定理求角",
            commonMistakes: ["2c当成c", "焦半径分配比例搞反"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "解焦半径", latex: "|PF_2|=\\tfrac43,\\ |PF_1|=\\tfrac83", annotation: ""),
                    SolutionStep(order: 2, description: "余弦定理", latex: "\\cos\\theta=\\frac{(8/3)^2+(4/3)^2-2^2}{2\\cdot\\frac83\\cdot\\frac43}=\\frac{11}{16}", annotation: "")
                ],
                keyInsight: "定义+余弦定理",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "配方代换秒杀", latex: "\\cos\\theta=\\frac{(r_1+r_2)^2-2r_1r_2-4c^2}{2r_1r_2}=\\frac{(r_1+r_2)^2-4c^2}{2r_1r_2}-1", annotation: "r₁+r₂=4,2c=2"),
                    SolutionStep(order: 2, description: "代入", latex: "r_1r_2=\\tfrac83\\cdot\\tfrac43=\\tfrac{32}{9}:\\ \\cos\\theta=\\frac{16-4}{2\\cdot32/9}-1=\\frac{12\\cdot9}{64}-1=\\frac{27}{16}-1=\\frac{11}{16}", annotation: "")
                ],
                keyInsight: "用r₁+r₂与r₁r₂整体代入，避免逐项平方",
                commonMistakes: []
            ),
            weaponUsed: "余弦定理整体代入",
            timeRatio: 1.8,
            detailedExplanation: """
                【焦半径+余弦定理】
                由 |PF₁|+|PF₂|=2a=4 与 |PF₁|=2|PF₂| 解出两焦半径
                |PF₂|=4/3, |PF₁|=8/3
                余弦定理(对边 2c=2): cos∠F₁PF₂=(r₁²+r₂²-4)/(2r₁r₂)=11/16
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "焦半径", "余弦定理", "焦点三角形", "压轴"]
    ),

    // ============ 圆锥曲线综合 (conic_046~050) ============

    Problem(
        id: "conic_046",
        type: .calculation,
        tier: 7,
        formulaIds: ["ellipse", "vieta"],
        content: "已知椭圆C: x^2/4+y^2/3=1，F₁(-1,0),F₂(1,0)。过F₂作直线l交C于P,Q两点，直线F₁P与F₁Q的斜率分别为k₁,k₂。求k₁+k₂的取值范围。",
        contentLatex: "\\frac{x^2}{4}+\\frac{y^2}{3}=1,\\quad k_1+k_2=?",
        options: nil,
        answer: "k₁+k₂=30m/(9m²-16)，范围(-∞,0)∪(0,+∞)（l非竖直）；l竖直时k₁+k₂=0",
        difficulty: 0.85,
        averageTime: 480,
        hints: ["设l: x=my+1", "联立韦达", "k₁+k₂=y₁/(x₁+1)+y₂/(x₂+1)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "设直线", latex: "l: x=my+1", annotation: "避免斜率不存在讨论；m=0即竖直弦"),
                SolutionStep(order: 2, description: "联立", latex: "3(my+1)^2+4y^2=12", annotation: ""),
                SolutionStep(order: 3, description: "整理", latex: "(3m^2+4)y^2+6my-9=0", annotation: ""),
                SolutionStep(order: 4, description: "韦达定理", latex: "y_1+y_2=\\frac{-6m}{3m^2+4},\\;y_1y_2=\\frac{-9}{3m^2+4}", annotation: ""),
                SolutionStep(order: 5, description: "k₁+k₂(注意x_i+1=my_i+2)", latex: "=\\frac{y_1}{my_1+2}+\\frac{y_2}{my_2+2}=\\frac{2my_1y_2+2(y_1+y_2)}{m^2y_1y_2+2m(y_1+y_2)+4}", annotation: ""),
                SolutionStep(order: 6, description: "代韦达化简分子分母", latex: "\\text{分子}=\\frac{-30m}{3m^2+4},\\ \\text{分母}=\\frac{16-9m^2}{3m^2+4}", annotation: "同除(3m²+4)"),
                SolutionStep(order: 7, description: "得单参数表达式", latex: "k_1+k_2=\\frac{-30m}{16-9m^2}=\\frac{30m}{9m^2-16}", annotation: ""),
                SolutionStep(order: 8, description: "求范围", latex: "t=\\frac{30m}{9m^2-16}\\Rightarrow 9tm^2-30m-16t=0,\\ \\Delta=900+576t^2>0", annotation: "对任意t≠0均有实m解"),
                SolutionStep(order: 9, description: "结论", latex: "l\\text{非竖直}(m\\neq0):\\ k_1+k_2\\in(-\\infty,0)\\cup(0,+\\infty);\\ m=0\\text{时}=0", annotation: "竖直弦x=1时k₁+k₂=0")
            ],
            keyInsight: "设x=my+1后k₁+k₂化为30m/(9m²-16)，由判别式知非竖直时取遍除0外所有实数。",
            commonMistakes: ["通分化简易出错", "忽略竖直弦(m=0)对应k₁+k₂=0的特殊值"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设x=my+1联立韦达", latex: "(3m^2+4)y^2+6my-9=0", annotation: ""),
                    SolutionStep(order: 2, description: "斜率和化简", latex: "k_1+k_2=\\frac{30m}{9m^2-16}", annotation: ""),
                    SolutionStep(order: 3, description: "判别式定范围", latex: "(-\\infty,0)\\cup(0,+\\infty)", annotation: "l非竖直时")
                ],
                keyInsight: "标准韦达法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "斜率和转化", latex: "k_1+k_2=\\frac{y_1(x_2+1)+y_2(x_1+1)}{(x_1+1)(x_2+1)}", annotation: ""),
                    SolutionStep(order: 2, description: "x_i+1=my_i+2统一为y", latex: "=\\frac{2my_1y_2+2(y_1+y_2)}{m^2y_1y_2+2m(y_1+y_2)+4}", annotation: ""),
                    SolutionStep(order: 3, description: "代韦达秒出", latex: "=\\frac{-30m}{16-9m^2}=\\frac{30m}{9m^2-16}", annotation: "再由Δ=900+576t²>0得范围")
                ],
                keyInsight: "x=my+1代换把斜率和统一成单参数分式，判别式直接给出取值范围。",
                commonMistakes: []
            ),
            weaponUsed: "焦点弦设x=my+c",
            timeRatio: 1.5,
            detailedExplanation: """
                【设x=my+x₀的技巧】
                过焦点的弦设x=my+c(c为焦点横坐标)，避免斜率不存在的分类讨论，
                联立后韦达形式更整洁。本题化简得 k₁+k₂=30m/(9m²-16)，
                视作关于m的方程 9tm²-30m-16t=0，判别式 Δ=900+576t²>0 对任意t成立，
                故l非竖直(m≠0)时 k₁+k₂ 可取(-∞,0)∪(0,+∞)内任意值；竖直弦(m=0)时取0。
                """
        ),
        gaokaoYear: 2020,
        tags: ["圆锥曲线", "椭圆", "韦达定理", "斜率和", "压轴", "核心", "必考"]
    ),

    Problem(
        id: "conic_047",
        type: .calculation,
        tier: 7,
        formulaIds: ["ellipse", "vieta"],
        content: "椭圆C: x^2/4+y^2=1，A(2,0)。直线l: y=kx-1交C于P,Q两点。若AP·AQ=0，求k的值。",
        contentLatex: "\\vec{AP}\\cdot\\vec{AQ}=0,\\;l:y=kx-1",
        options: nil,
        answer: "k=5/6",
        difficulty: 0.80,
        averageTime: 420,
        hints: ["l恒过椭圆上定点(0,-1)，故P固定", "AP=(-2,-1)固定，AP·AQ=0是对Q的线性约束", "舍去使Q与A重合的解"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "联立", latex: "x^2+4(kx-1)^2=4 \\Rightarrow (1+4k^2)x^2-8kx=0", annotation: ""),
                SolutionStep(order: 2, description: "解方程", latex: "x[(1+4k^2)x-8k]=0 \\Rightarrow x_1=0,\\ x_2=\\frac{8k}{1+4k^2}", annotation: "x=0即定点(0,-1)"),
                SolutionStep(order: 3, description: "P,Q坐标", latex: "P(0,-1),\\ Q\\left(\\frac{8k}{1+4k^2},\\frac{4k^2-1}{1+4k^2}\\right)", annotation: ""),
                SolutionStep(order: 4, description: "AP·AQ", latex: "\\vec{AP}=(-2,-1),\\ \\vec{AP}\\cdot\\vec{AQ}=-2(x_2-2)-y_2", annotation: ""),
                SolutionStep(order: 5, description: "代入化简", latex: "=\\frac{-16k-(4k^2-1)}{1+4k^2}+4=\\frac{12k^2-16k+5}{1+4k^2}", annotation: ""),
                SolutionStep(order: 6, description: "解方程", latex: "12k^2-16k+5=0 \\Rightarrow k=\\frac{16\\pm√(16)}{24}=\\frac12\\text{ 或 }\\frac56", annotation: "Δ=256-240=16"),
                SolutionStep(order: 7, description: "舍去退化解", latex: "k=\\tfrac12\\text{时}l\\text{过}A(2,0)\\Rightarrow Q=A,\\vec{AQ}=\\vec0\\text{舍去}", annotation: "Q与A重合，非真正的垂直配置"),
                SolutionStep(order: 8, description: "结论", latex: "k=\\frac56", annotation: "验证Q=(30/17,8/17)，AP·AQ=8/17-8/17=0 ✓")
            ],
            keyInsight: "直线恒过椭圆上定点(0,-1)，P固定；解二次方程并舍去使Q与A重合的退化解。",
            commonMistakes: ["不舍去k=1/2（此时Q=A，AQ为零向量）", "联立后化简出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "联立得P,Q", latex: "P(0,-1),\\ Q\\left(\\frac{8k}{1+4k^2},\\frac{4k^2-1}{1+4k^2}\\right)", annotation: ""),
                    SolutionStep(order: 2, description: "AP·AQ=0", latex: "\\frac{12k^2-16k+5}{1+4k^2}=0\\Rightarrow k=\\tfrac12\\text{(舍)},\\tfrac56", annotation: ""),
                    SolutionStep(order: 3, description: "取有效解", latex: "k=\\frac56", annotation: "")
                ],
                keyInsight: "联立+向量条件，注意舍去退化解",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "【秒杀】抓住定点", latex: "l:y=kx-1\\text{恒过}(0,-1),\\text{且}(0,-1)\\text{在椭圆上}\\Rightarrow P(0,-1)\\text{固定}", annotation: "P与k无关"),
                    SolutionStep(order: 2, description: "AP固定，化为Q的线性约束", latex: "\\vec{AP}=(-2,-1),\\ \\vec{AP}\\cdot\\vec{AQ}=0\\Rightarrow y_Q=4-2x_Q", annotation: "Q在定直线y=4-2x上"),
                    SolutionStep(order: 3, description: "与椭圆联立定Q", latex: "x_Q^2/4+(4-2x_Q)^2=1\\Rightarrow 17x_Q^2-64x_Q+60=0\\Rightarrow x_Q=2(舍),\\tfrac{30}{17}", annotation: "x_Q=2即A，舍去"),
                    SolutionStep(order: 4, description: "回代求k", latex: "Q\\left(\\tfrac{30}{17},\\tfrac{8}{17}\\right)\\text{在}l\\text{上}:\\ \\tfrac{8}{17}=k\\cdot\\tfrac{30}{17}-1\\Rightarrow k=\\frac56", annotation: "一步求出")
                ],
                keyInsight: "认出直线恒过椭圆上定点(0,-1)使P固定，垂直条件降为Q的一条定直线，避免韦达展开。",
                commonMistakes: []
            ),
            weaponUsed: "定点+向量降维",
            timeRatio: 1.5,
            detailedExplanation: """
                【定点思想降维】
                直线 y=kx-1 不论k为何值都经过(0,-1)，而(0,-1)恰在椭圆上，
                所以交点之一 P=(0,-1) 是固定的，AP=(-2,-1) 也固定。
                于是 AP·AQ=0 变成对 Q 的线性约束 y_Q=4-2x_Q（一条定直线）。
                把它与椭圆联立得 17x²-64x+60=0，解出 x=2(对应Q=A，舍)与 x=30/17。
                由 Q 在 l 上回代得 k=5/6。注意舍去使Q与A重合的退化解 k=1/2。
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "齐次化", "向量垂直", "压轴", "核心"]
    ),

    Problem(
        id: "conic_048",
        type: .calculation,
        tier: 7,
        formulaIds: ["parabola", "vieta"],
        content: "抛物线y²=4x，F为焦点，直线l过F交抛物线于A,B两点。C为AB中点，过C作y轴的垂线交抛物线于D。求|CD|/|AB|的最小值。",
        contentLatex: "y^2=4x,\\;C为AB中点,\\;CD\\parallel x\\text{轴}",
        options: nil,
        answer: "√(2)/2",
        difficulty: 0.85,
        averageTime: 480,
        hints: ["设A(t₁²,2t₁),B(t₂²,2t₂)", "焦点弦t₁t₂=-1", "中点C坐标"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "参数设点", latex: "A(t_1^2,2t_1),B(t_2^2,2t_2),F(1,0)", annotation: ""),
                SolutionStep(order: 2, description: "焦点弦性质", latex: "t_1t_2=-1", annotation: ""),
                SolutionStep(order: 3, description: "中点C", latex: "C(\\frac{t_1^2+t_2^2}{2},t_1+t_2)", annotation: ""),
                SolutionStep(order: 4, description: "D在抛物线上,y_D=y_C", latex: "y_D=t_1+t_2,\\;x_D=\\frac{(t_1+t_2)^2}{4}", annotation: ""),
                SolutionStep(order: 5, description: "|CD|", latex: "|CD|=|x_C-x_D|=|\\frac{t_1^2+t_2^2}{2}-\\frac{(t_1+t_2)^2}{4}|=\\frac{(t_1-t_2)^2}{4}", annotation: ""),
                SolutionStep(order: 6, description: "|AB|及最小值", latex: "\\frac{|CD|}{|AB|}的最小值需进一步化简", annotation: "")
            ],
            keyInsight: "参数法+焦点弦性质t₁t₂=-1",
            commonMistakes: ["中点计算出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "参数法", latex: "设参数t₁,t₂,利用t₁t₂=-1", annotation: "")
                ],
                keyInsight: "参数法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设t=t₁+t₂", latex: "t_1t_2=-1,令s=t_1+t_2", annotation: ""),
                    SolutionStep(order: 2, description: "用s表示一切", latex: "|AB|=(t_1^2+1)+(t_2^2+1)=s^2+4", annotation: "焦半径和"),
                    SolutionStep(order: 3, description: "|CD|", latex: "|CD|=\\frac{(t_1-t_2)^2}{4}=\\frac{s^2+4}{4}", annotation: "t₁-t₂)²=s²+4"),
                    SolutionStep(order: 4, description: "比值", latex: "\\frac{|CD|}{|AB|}=\\frac{(s^2+4)/4}{s^2+4}=\\frac{1}{4}", annotation: "恒为1/4!")
                ],
                keyInsight: "令s=t₁+t₂统一表达，比值为定值1/4",
                commonMistakes: []
            ),
            weaponUsed: "参数整体代换",
            timeRatio: 2.0,
            detailedExplanation: """
                【参数整体代换】
                t₁t₂=-1时, 令s=t₁+t₂
                则t₁²+t₂²=s²+2, (t₁-t₂)²=s²+4
                所有量用s表示后往往大量消去
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "抛物线", "焦点弦", "中点", "比值", "压轴"]
    ),

    Problem(
        id: "conic_049",
        type: .calculation,
        tier: 7,
        formulaIds: ["ellipse"],
        content: "已知椭圆C: x^2/a^2+y^2/b^2=1 (a>b>0)，离心率e=√3/2。过右焦点F₂作斜率为1的直线l交C于M,N两点。若|MF₂|=2|NF₂|，求a²的值。",
        contentLatex: "e=\\frac{√(3)}{2},\\;k_l=1,\\;|MF_2|=2|NF_2|",
        options: nil,
        answer: "a²=2",
        difficulty: 0.80,
        averageTime: 420,
        hints: ["e=√3/2→c²=3a²/4→b²=a²/4", "l: y=x-c", "联立+韦达+比例条件"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "离心率", latex: "c=\\frac{√(3)}{2}a,b^2=a^2-c^2=\\frac{a^2}{4}", annotation: ""),
                SolutionStep(order: 2, description: "直线", latex: "l: y=x-\\frac{√(3)}{2}a", annotation: ""),
                SolutionStep(order: 3, description: "联立", latex: "\\frac{x^2}{a^2}+\\frac{(x-\\frac{√(3)}{2}a)^2}{a^2/4}=1", annotation: ""),
                SolutionStep(order: 4, description: "化简", latex: "x^2+4(x-\\frac{√(3)}{2}a)^2=a^2", annotation: ""),
                SolutionStep(order: 5, description: "展开", latex: "5x^2-4√(3)ax+2a^2=0", annotation: ""),
                SolutionStep(order: 6, description: "韦达+比例", latex: "|MF_2|=2|NF_2|用焦半径或坐标处理,解出a", annotation: "")
            ],
            keyInsight: "离心率确定a,b,c关系后联立",
            commonMistakes: ["b²=a²/4代入后展开出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "联立韦达", latex: "标准流程", annotation: "")
                ],
                keyInsight: "标准韦达法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "焦半径公式", latex: "|MF_2|=a-ex_M,|NF_2|=a-ex_N", annotation: ""),
                    SolutionStep(order: 2, description: "比例条件", latex: "a-ex_M=2(a-ex_N) \\Rightarrow ex_M-2ex_N=-a", annotation: ""),
                    SolutionStep(order: 3, description: "结合韦达", latex: "x_M+x_N=\\frac{4√(3)a}{5},x_Mx_N=\\frac{2a^2}{5}", annotation: "加上x_M-2x_N=-a/e直接解")
                ],
                keyInsight: "焦半径a±ex简化比例条件",
                commonMistakes: []
            ),
            weaponUsed: "焦半径公式",
            timeRatio: 1.5,
            detailedExplanation: """
                【焦半径公式处理比例】
                椭圆焦半径: r=a±ex
                当题目给|MF|=k|NF|时
                a-ex₁=k(a-ex₂)
                直接转化为x₁,x₂的线性关系
                再结合韦达定理解方程
                """
        ),
        gaokaoYear: 2021,
        tags: ["圆锥曲线", "椭圆", "离心率", "焦半径", "韦达定理", "压轴", "必考"]
    ),

    Problem(
        id: "conic_050",
        type: .calculation,
        tier: 7,
        formulaIds: ["ellipse", "parabola"],
        content: "已知椭圆C₁: x^2/4+y^2=1与抛物线C₂: x²=4y。它们在第一象限的交点为P，求P点坐标及椭圆在P点的切线方程。",
        contentLatex: "C_1:\\frac{x^2}{4}+y^2=1,\\;C_2:x^2=4y,\\;P\\in \\text{第一象限}",
        options: nil,
        answer: "P(√(2), 1/2), 切线: x+4y-2√(2)=0",
        difficulty: 0.70,
        averageTime: 300,
        hints: ["联立消y", "x²=4y代入椭圆", "椭圆切线公式xx₀/a²+yy₀/b²=1"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "联立", latex: "y=x^2/4代入\\frac{x^2}{4}+\\frac{x^4}{16}=1", annotation: ""),
                SolutionStep(order: 2, description: "化简", latex: "x^4+4x^2-16=0,令t=x^2: t^2+4t-16=0", annotation: ""),
                SolutionStep(order: 3, description: "解方程", latex: "t=\\frac{-4+√(80)}{2}=\\frac{-4+4√(5)}{2}=-2+2√(5)", annotation: ""),
                SolutionStep(order: 4, description: "P坐标", latex: "x=√(-2+2√(5)),y=\\frac{-2+2√(5)}{4}=\\frac{√(5)-1}{2}", annotation: ""),
                SolutionStep(order: 5, description: "切线", latex: "\\frac{x\\cdot x_0}{4}+y\\cdot y_0=1", annotation: "椭圆切线公式")
            ],
            keyInsight: "联立+椭圆切线公式",
            commonMistakes: ["t方程求解出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "联立求交点", latex: "代入法", annotation: ""),
                    SolutionStep(order: 2, description: "隐函数求导", latex: "2x/4+2yy'=0 \\Rightarrow y'=-x/(4y)", annotation: "")
                ],
                keyInsight: "联立+求导",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "椭圆切线公式", latex: "\\frac{xx_0}{a^2}+\\frac{yy_0}{b^2}=1", annotation: "直接套公式"),
                    SolutionStep(order: 2, description: "无需求导", latex: "\\frac{x\\cdot x_0}{4}+y\\cdot y_0=1", annotation: "代入P坐标即可")
                ],
                keyInsight: "椭圆切线公式一步出切线方程",
                commonMistakes: []
            ),
            weaponUsed: "圆锥曲线切线公式",
            timeRatio: 2.0,
            detailedExplanation: """
                【圆锥曲线切线公式】
                椭圆: xx₀/a²+yy₀/b²=1
                双曲线: xx₀/a²-yy₀/b²=1
                抛物线y²=2px: yy₀=p(x+x₀)
                记住公式即可秒出切线方程
                """
        ),
        gaokaoYear: nil,
        tags: ["圆锥曲线", "椭圆", "抛物线", "切线", "联立", "核心"]
    ),

    ]
}
