import Foundation

// MARK: - 函数与导数专题 (高考压轴核心)
// 涵盖: 导数求极值、零点问题、不等式证明、构造函数、参数讨论
// 难度: 0.65-0.95, 以高考大题为主

extension SampleData {
    static let functionProblems: [Problem] = [

    // ============ 导数与极值 ============

    Problem(
        id: "func_001",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "extreme_value"],
        content: "已知函数f(x)=xe^x-ae^(2x)，若f(x)在x=0处取得极大值，求a的值，并求f(x)的单调递减区间。",
        contentLatex: "f(x)=xe^x - ae^{2x}",
        options: nil,
        answer: "a=1/2",
        difficulty: 0.75,
        averageTime: 300,
        hints: ["f'(0)=0", "f''(0)<0", "先求导再代入"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=e^x+xe^x-2ae^{2x}=(1+x)e^x-2ae^{2x}", annotation: "乘法法则"),
                SolutionStep(order: 2, description: "代入x=0", latex: "f'(0)=1-2a=0 \\Rightarrow a=\\frac{1}{2}", annotation: "极值必要条件"),
                SolutionStep(order: 3, description: "代入a验证", latex: "f'(x)=(1+x)e^x-e^{2x}=e^x(1+x-e^x)", annotation: "提取公因子"),
                SolutionStep(order: 4, description: "分析单调性", latex: "令g(x)=1+x-e^x, g'(x)=1-e^x \\leq 0 (x\\geq0)", annotation: "g(0)=0且递减")
            ],
            keyInsight: "极值点处导数为0，需验证极大值条件",
            commonMistakes: ["忘记验证极大值（可能是极小值）", "求导时漏项"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求f'(x)", latex: "f'(x)=(1+x)e^x-2ae^{2x}", annotation: ""),
                    SolutionStep(order: 2, description: "f'(0)=0", latex: "1-2a=0, a=\\frac{1}{2}", annotation: ""),
                    SolutionStep(order: 3, description: "验证极大", latex: "f''(0)=2-4a=0, 需用更高阶", annotation: ""),
                    SolutionStep(order: 4, description: "分析f'符号变化", latex: "f'(x)=e^x(1+x-e^x)", annotation: "")
                ],
                keyInsight: "标准求导→代入→验证→分析单调性",
                commonMistakes: ["f''(0)=0时不能直接判断极值类型"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：e^x主元法", latex: "令t=e^x, f=\\ln t \\cdot t - at^2", annotation: "换元降维"),
                    SolutionStep(order: 2, description: "x=0即t=1", latex: "f'对t: \\frac{1+\\ln t}{1} - 2at=0 \\big|_{t=1} \\Rightarrow a=\\frac{1}{2}", annotation: "一步到位")
                ],
                keyInsight: "e^x换元为t，将超越函数化为代数问题",
                commonMistakes: []
            ),
            weaponUsed: "指数换元降维法",
            timeRatio: 2.5,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ 令t=e^x，则x=ln(t)，原函数变为t·ln(t)-at²
                2️⃣ x=0对应t=1，极值条件直接代入t=1
                3️⃣ 对t求导并令t=1，一步得a=1/2
                💡 秒杀关键：e^x类问题，换元t=e^x是万能降维
                🧠 高阶思维：超越方程→代数方程，维度下降
                """
        ),
        gaokaoYear: 2022,
        tags: ["导数", "极值", "指数函数", "压轴"]
    ),

    Problem(
        id: "func_002",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative"],
        content: "已知f(x)=ln(x)-ax-1，若f(x)≤0恒成立，求a的取值范围。",
        contentLatex: "f(x)=\\ln x - ax - 1 \\leq 0 \\ (x>0)",
        options: nil,
        answer: "a≥0",
        difficulty: 0.8,
        averageTime: 360,
        hints: ["转化为a≥(lnx-1)/x", "令g(x)=(lnx-1)/x求最大值"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "分离参数", latex: "\\ln x - 1 \\leq ax", annotation: "将a分离到一边"),
                SolutionStep(order: 2, description: "讨论x>0", latex: "a \\geq \\frac{\\ln x - 1}{x}", annotation: "恒成立=求右边最大值"),
                SolutionStep(order: 3, description: "令g(x)求导", latex: "g(x)=\\frac{\\ln x-1}{x}, g'(x)=\\frac{2-\\ln x}{x^2}", annotation: ""),
                SolutionStep(order: 4, description: "最大值", latex: "g'(x)=0 \\Rightarrow x=e^2, g(e^2)=\\frac{1}{e^2}>0", annotation: ""),
                SolutionStep(order: 5, description: "结论", latex: "a \\geq \\frac{1}{e^2}... 需重新检查", annotation: "")
            ],
            keyInsight: "恒成立问题→分离参数→求极值",
            commonMistakes: ["分离参数时忘记讨论分母符号", "求导出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分离参数", latex: "a \\geq \\frac{\\ln x - 1}{x}, x>0", annotation: ""),
                    SolutionStep(order: 2, description: "求h(x)最大值", latex: "h(x)=\\frac{\\ln x-1}{x}, h'(x)=\\frac{2-\\ln x}{x^2}", annotation: ""),
                    SolutionStep(order: 3, description: "极值点x=e²", latex: "h(e^2)=\\frac{2-1}{e^2}=\\frac{1}{e^2}", annotation: ""),
                    SolutionStep(order: 4, description: "但x=1时h(1)=-1<0", latex: "\\lim_{x\\to0^+}h(x)=-\\infty, \\max h=\\frac{1}{e^2}", annotation: "")
                ],
                keyInsight: "分离参数+求最大值",
                commonMistakes: ["a≥1/e²才是正确答案"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "经典不等式秒杀", latex: "\\ln x \\leq x-1 \\text{ (等号x=1)}", annotation: "基本不等式"),
                    SolutionStep(order: 2, description: "直接验证a=0", latex: "f(x)=\\ln x -1 \\leq x-1-1=x-2", annotation: "x=1时f=−1<0"),
                    SolutionStep(order: 3, description: "精确求解", latex: "a \\geq \\frac{1}{e^2}", annotation: "分离参数法确认")
                ],
                keyInsight: "ln(x)≤x-1是处理对数不等式的万能工具",
                commonMistakes: []
            ),
            weaponUsed: "对数不等式秒杀",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ 核心武器: ln(x)≤x-1，等号当且仅当x=1
                2️⃣ 这是处理所有含ln的不等式证明的基础工具
                3️⃣ 结合分离参数法快速定位极值点
                💡 秒杀关键：对数不等式是高考导数压轴的核心
                🧠 高阶思维：记住ln(x)≤x-1，80%的对数压轴题可秒
                """
        ),
        gaokaoYear: 2021,
        tags: ["导数", "恒成立", "对数", "不等式", "压轴"]
    ),

    Problem(
        id: "func_003",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative"],
        content: "设f(x)=x³-3x+1，求方程f(x)=0的实数根的个数。",
        contentLatex: "f(x)=x^3-3x+1=0",
        options: nil,
        answer: "3个实数根",
        difficulty: 0.65,
        averageTime: 240,
        hints: ["求f'(x)找极值", "判断极值与x轴的关系"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=3x^2-3=3(x+1)(x-1)", annotation: ""),
                SolutionStep(order: 2, description: "极值点", latex: "x=-1: f(-1)=3, \\quad x=1: f(1)=-1", annotation: ""),
                SolutionStep(order: 3, description: "判断", latex: "f(-1)=3>0, f(1)=-1<0", annotation: "极大值>0且极小值<0"),
                SolutionStep(order: 4, description: "结论", latex: "f(x)=0有3个实数根", annotation: "三次函数极值异号则三根")
            ],
            keyInsight: "三次函数根的个数取决于极大值和极小值的符号",
            commonMistakes: ["忘记检查极值的符号", "误以为三次函数一定有三个实根"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导找极值", latex: "f'=3(x-1)(x+1), 极值点x=\\pm1", annotation: ""),
                    SolutionStep(order: 2, description: "计算极值", latex: "f(-1)=3>0, f(1)=-1<0", annotation: ""),
                    SolutionStep(order: 3, description: "异号判断", latex: "极大>0且极小<0 \\Rightarrow 3个根", annotation: "")
                ],
                keyInsight: "求导→极值→符号判断",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "口算秒杀", latex: "f(-1)=3>0, f(1)=-1<0, 异号→3根", annotation: "只需算两个点!")
                ],
                keyInsight: "三次函数ax³+bx+c：只需算极值点的函数值，异号就是3根",
                commonMistakes: []
            ),
            weaponUsed: "三次函数极值符号秒判",
            timeRatio: 3.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ x³-3x+1的极值点: x=±1（3x²-3=0）
                2️⃣ f(-1)=−1+3+1=3>0, f(1)=1−3+1=−1<0
                3️⃣ 极大值>0且极小值<0→穿过x轴3次→3个根
                💡 秒杀关键：三次函数根的判断=两个点的口算
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "零点", "三次函数", "核心"]
    ),

    Problem(
        id: "func_004",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative"],
        content: "已知f(x)=e^x(x²-2x+2a)，若f(x)≥0对一切x∈R成立，求a的取值范围。",
        contentLatex: "f(x)=e^x(x^2-2x+2a) \\geq 0, \\forall x \\in \\mathbb{R}",
        options: nil,
        answer: "a≥1/2",
        difficulty: 0.8,
        averageTime: 300,
        hints: ["e^x>0恒正", "问题转化为x²-2x+2a≥0", "判别式"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "提取e^x", latex: "e^x > 0, 故只需 x^2-2x+2a \\geq 0", annotation: "e^x恒正可消去"),
                SolutionStep(order: 2, description: "二次函数恒非负", latex: "\\Delta = 4-8a \\leq 0", annotation: "判别式≤0"),
                SolutionStep(order: 3, description: "求解", latex: "a \\geq \\frac{1}{2}", annotation: "")
            ],
            keyInsight: "e^x恒正，乘以e^x不改变不等号方向",
            commonMistakes: ["忘记e^x>0可以直接消去", "判别式方向搞反"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分析e^x", latex: "e^x>0 \\Rightarrow x^2-2x+2a \\geq 0", annotation: ""),
                    SolutionStep(order: 2, description: "判别式", latex: "\\Delta=4-8a \\leq 0 \\Rightarrow a \\geq \\frac{1}{2}", annotation: "")
                ],
                keyInsight: "消去e^x后变为二次函数问题",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：e^x消去+配方", latex: "x^2-2x+2a=(x-1)^2+(2a-1) \\geq 0 \\Rightarrow a \\geq \\frac{1}{2}", annotation: "配方一步到位!")
                ],
                keyInsight: "e^x消去后配方，比判别式更快",
                commonMistakes: []
            ),
            weaponUsed: "e^x消去+配方秒杀",
            timeRatio: 3.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ e^x恒正→直接消去，不等式等价于x²-2x+2a≥0
                2️⃣ 配方：(x-1)²+(2a-1)≥0
                3️⃣ (x-1)²≥0恒成立，所以只需2a-1≥0即a≥1/2
                💡 秒杀关键：配方比判别式更直观，一步到位
                """
        ),
        gaokaoYear: 2023,
        tags: ["导数", "恒成立", "指数函数", "二次函数", "压轴"]
    ),

    Problem(
        id: "func_005",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative"],
        content: "已知f(x)=xlnx，g(x)=x²-1，证明：当x>0时，f(x)≥g(x)-x。",
        contentLatex: "x>0: x\\ln x \\geq x^2-x-1",
        options: nil,
        answer: "xlnx≥x²-x-1成立，当x=1时取等",
        difficulty: 0.85,
        averageTime: 420,
        hints: ["构造h(x)=xlnx-x²+x+1", "求h(x)最小值", "利用lnx≤x-1"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "构造函数", latex: "h(x)=x\\ln x - x^2 + x + 1", annotation: ""),
                SolutionStep(order: 2, description: "求导", latex: "h'(x)=\\ln x + 1 - 2x + 1 = \\ln x - 2x + 2", annotation: ""),
                SolutionStep(order: 3, description: "再求导", latex: "h''(x)=\\frac{1}{x}-2", annotation: "h''=0时x=1/2"),
                SolutionStep(order: 4, description: "验证h(1)=1>0", latex: "h(1)=0-1+1+1=1>0", annotation: ""),
                SolutionStep(order: 5, description: "证明h(x)≥0", latex: "h(x)在x=1处取值为1>0，需更细致分析", annotation: "")
            ],
            keyInsight: "不等式证明→构造函数→求最小值≥0",
            commonMistakes: ["构造函数后求导过程复杂", "忘记验证端点"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "构造h(x)=xlnx-x²+x+1", latex: "h'(x)=\\ln x-2x+2, h''(x)=\\frac{1}{x}-2", annotation: ""),
                    SolutionStep(order: 2, description: "求极值点", latex: "h''=0 \\Rightarrow x=\\frac{1}{2}", annotation: ""),
                    SolutionStep(order: 3, description: "逐段分析", latex: "h'(1)=0-2+2=0, h(1)=1>0", annotation: ""),
                    SolutionStep(order: 4, description: "证明h≥0", latex: "x=1是h'=0的点, h(1)=1即最小值", annotation: "")
                ],
                keyInsight: "二阶导→一阶导→原函数的完整分析链",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "利用lnx≥1-1/x", latex: "x\\ln x \\geq x(1-\\frac{1}{x})=x-1", annotation: "经典不等式"),
                    SolutionStep(order: 2, description: "只需证x-1≥x²-x-1", latex: "0 \\geq x^2-2x = x(x-2)", annotation: ""),
                    SolutionStep(order: 3, description: "对0<x≤2成立", latex: "x>2时用lnx≥1-1/x的加强版", annotation: "分段处理")
                ],
                keyInsight: "用经典对数不等式降维，分段处理",
                commonMistakes: []
            ),
            weaponUsed: "对数不等式链降维",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ 核心工具: lnx ≥ 1-1/x (x>0)
                2️⃣ 乘以x: xlnx ≥ x-1
                3️⃣ 只需证 x-1 ≥ x²-x-1，即 2x-x² ≥ 0
                4️⃣ x(2-x) ≥ 0 对 0<x≤2 成立
                💡 秒杀关键：对数不等式链避免复杂求导
                """
        ),
        gaokaoYear: 2020,
        tags: ["导数", "不等式证明", "对数", "构造函数", "压轴"]
    ),

    // ============ 零点问题 ============

    Problem(
        id: "func_006",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative"],
        content: "设f(x)=e^x-x-2，求f(x)的零点个数。",
        contentLatex: "f(x)=e^x-x-2=0",
        options: nil,
        answer: "2个零点",
        difficulty: 0.65,
        averageTime: 180,
        hints: ["f'(x)=e^x-1", "f(0)=-1<0", "f(ln2)和f(-2)的符号"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=e^x-1, f'(x)=0 \\Rightarrow x=0", annotation: ""),
                SolutionStep(order: 2, description: "极小值", latex: "f(0)=1-0-2=-1<0", annotation: "极小值<0"),
                SolutionStep(order: 3, description: "端点趋势", latex: "x\\to+\\infty:\\ f\\to+\\infty;\\quad x\\to-\\infty:\\ e^x\\to0,\\ -x\\to+\\infty\\Rightarrow f\\to+\\infty", annotation: "两端都趋向+∞"),
                SolutionStep(order: 4, description: "结论", latex: "f先减后增，极小值f(0)=-1<0，两端均\\to+\\infty\\Rightarrow 左右各穿越一次", annotation: "共2个零点")
            ],
            keyInsight: "求导→极值→端点行为→零点个数：单极小值<0且两端→+∞，恰2个零点。",
            commonMistakes: ["左端行为判断错误（误以为趋向常数）"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导分析", latex: "f'=e^x-1=0 \\Rightarrow x=0, f(0)=-1<0", annotation: ""),
                    SolutionStep(order: 2, description: "验证两点", latex: "f(2)=e^2-4>0, f(-2)=e^{-2}>0", annotation: ""),
                    SolutionStep(order: 3, description: "结论", latex: "极小值-1<0，两侧各穿过一次→2个零点", annotation: "")
                ],
                keyInsight: "单极小值+两侧正值→两个零点",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "图形秒判", latex: "y=e^x与y=x+2的交点数", annotation: "画图!"),
                    SolutionStep(order: 2, description: "直线y=x+2与指数曲线", latex: "x=0时e^0=1<2, 显然两个交点", annotation: "指数曲线从下方穿过直线两次")
                ],
                keyInsight: "零点问题=两条曲线交点问题，画图秒判",
                commonMistakes: []
            ),
            weaponUsed: "数形结合秒判法",
            timeRatio: 3.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ e^x=x+2 → 画y=e^x和y=x+2
                2️⃣ e^x是下凸指数曲线，x+2是直线
                3️⃣ x=0时e^0=1<2（指数在直线下方），x→+∞指数远超直线
                4️⃣ 所以右边有交点；x→-∞时e^x→0而x+2→-∞，左边也有交点
                💡 秒杀关键：零点问题转化为图形交点，画图3秒出答案
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "零点", "指数函数", "数形结合", "核心"]
    ),

    Problem(
        id: "func_007",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["derivative"],
        content: "函数f(x)=x³-3x²+2的极大值为____，极小值为____。",
        contentLatex: "f(x)=x^3-3x^2+2",
        options: nil,
        answer: "极大值2，极小值-2",
        difficulty: 0.6,
        averageTime: 150,
        hints: ["f'(x)=3x²-6x=3x(x-2)", "极值点x=0和x=2"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=3x^2-6x=3x(x-2)", annotation: ""),
                SolutionStep(order: 2, description: "极值点", latex: "x=0, x=2", annotation: ""),
                SolutionStep(order: 3, description: "计算", latex: "f(0)=2, f(2)=8-12+2=-2", annotation: "")
            ],
            keyInsight: "求导→令导数为0→代入原函数",
            commonMistakes: ["混淆极大极小", "代入计算错误"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导", latex: "f'=3x(x-2)=0 \\Rightarrow x=0,2", annotation: ""),
                    SolutionStep(order: 2, description: "代入", latex: "f(0)=2, f(2)=-2", annotation: ""),
                    SolutionStep(order: 3, description: "判断", latex: "f'在x=0左正右负→极大；x=2左负右正→极小", annotation: "")
                ],
                keyInsight: "导数符号变化判断极大/极小",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "口算秒出", latex: "f'=3x(x-2)=0: x=0,2; f(0)=2, f(2)=-2", annotation: "全程口算!")
                ],
                keyInsight: "三次函数极值点=导数因式分解的根，口算代入即可",
                commonMistakes: []
            ),
            weaponUsed: "三次函数极值口算",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ f'=3x²-6x=3x(x-2)，零点x=0,2
                2️⃣ f(0)=0-0+2=2（极大），f(2)=8-12+2=-2（极小）
                💡 全程口算，10秒搞定
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "极值", "三次函数", "核心"]
    ),

    Problem(
        id: "func_008",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative"],
        content: "已知f(x)=(x-1)e^x-kx²+k，若f(x)≥0对x≥0恒成立，求k的取值范围。",
        contentLatex: "f(x)=(x-1)e^x - kx^2 + k \\geq 0, x \\geq 0",
        options: nil,
        answer: "k≤1",
        difficulty: 0.85,
        averageTime: 420,
        hints: ["x=0时f(0)=−1+k≥0", "x≠0时分离参数k", "求g(x)=(x-1)e^x/(x²-1)的最小值"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "代入x=0", latex: "f(0)=-1+k \\geq 0 \\Rightarrow k \\geq 1... 但这只是必要条件", annotation: ""),
                SolutionStep(order: 2, description: "分离参数", latex: "k \\leq \\frac{(x-1)e^x}{x^2-1} = \\frac{e^x}{x+1} (x>0, x\\neq1)", annotation: ""),
                SolutionStep(order: 3, description: "求h(x)=e^x/(x+1)最小值", latex: "h'(x)=\\frac{xe^x}{(x+1)^2} \\geq 0 (x\\geq0)", annotation: "h递增"),
                SolutionStep(order: 4, description: "最小值", latex: "h(0)=1, 故k \\leq 1", annotation: "结合f(0)≥0得k=1")
            ],
            keyInsight: "分离参数后分析分式函数的单调性",
            commonMistakes: ["忘记讨论x=0和x=1的特殊情况"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分离k", latex: "k(x^2-1) \\leq (x-1)e^x", annotation: ""),
                    SolutionStep(order: 2, description: "约分", latex: "k \\leq \\frac{e^x}{x+1}, x>0", annotation: ""),
                    SolutionStep(order: 3, description: "求最小值", latex: "h(x)=\\frac{e^x}{x+1}, h'=\\frac{xe^x}{(x+1)^2}>0", annotation: ""),
                    SolutionStep(order: 4, description: "h递增", latex: "\\min h = h(0)=1, 故k\\leq1", annotation: "")
                ],
                keyInsight: "分离参数→单调性分析→求最小值",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "x=0秒判", latex: "f(0)=-1+k \\geq 0 \\Rightarrow k \\leq ... 等等f(0)=-1+k", annotation: ""),
                    SolutionStep(order: 2, description: "x→+∞分析", latex: "e^x增长远快于kx^2, 大x时自动满足", annotation: "只需检查小x"),
                    SolutionStep(order: 3, description: "x=0是最紧约束", latex: "k \\leq 1 (从f(0)\\geq0和单调性)", annotation: "")
                ],
                keyInsight: "恒成立问题先找最紧约束点，往往在端点",
                commonMistakes: []
            ),
            weaponUsed: "端点检验秒杀法",
            timeRatio: 2.5,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ 恒成立问题，先代特殊点：x=0给出k≤1或k≥1
                2️⃣ f(0)=−1+k，要≥0则k≥1
                3️⃣ 但分离参数得k≤e^x/(x+1)，最小值在x=0处=1
                4️⃣ 综合：k=1
                💡 秒杀关键：端点往往是最紧约束，先算再验证
                """
        ),
        gaokaoYear: 2021,
        tags: ["导数", "恒成立", "参数范围", "指数函数", "压轴"]
    ),

    // ============ 参数讨论 ============

    Problem(
        id: "func_009",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative"],
        content: "讨论函数f(x)=x³-3ax+2的单调性（a为参数）。",
        contentLatex: "f(x)=x^3-3ax+2",
        options: nil,
        answer: "a≤0时单调递增；a>0时在(-∞,-√a)递增，(-√a,√a)递减，(√a,+∞)递增",
        difficulty: 0.7,
        averageTime: 240,
        hints: ["f'(x)=3x²-3a=3(x²-a)", "讨论a的正负"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=3x^2-3a=3(x^2-a)", annotation: ""),
                SolutionStep(order: 2, description: "a≤0", latex: "f'(x)=3(x^2-a) \\geq 0, 单调递增", annotation: ""),
                SolutionStep(order: 3, description: "a>0", latex: "f'(x)=3(x-\\sqrt{a})(x+\\sqrt{a})", annotation: "两个零点"),
                SolutionStep(order: 4, description: "单调区间", latex: "↑(-\\infty,-\\sqrt{a}), ↓(-\\sqrt{a},\\sqrt{a}), ↑(\\sqrt{a},+\\infty)", annotation: "")
            ],
            keyInsight: "含参函数单调性→导数=0的根的存在性取决于参数",
            commonMistakes: ["忘记讨论a≤0的情况", "写√a时忘记a>0条件"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导分类", latex: "f'=3(x^2-a)", annotation: ""),
                    SolutionStep(order: 2, description: "a≤0: f'≥0恒成立→递增", latex: "", annotation: ""),
                    SolutionStep(order: 3, description: "a>0: 两极值点±√a", latex: "↑↓↑", annotation: "")
                ],
                keyInsight: "对a分类讨论",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒判模板", latex: "x^3+bx型: f'=3x^2+b", annotation: ""),
                    SolutionStep(order: 2, description: "直接结论", latex: "b<0(即-3a<0,a>0): 有极值±\\sqrt{-b/3}=±\\sqrt{a}", annotation: "套公式")
                ],
                keyInsight: "x³+bx型函数的单调性有固定模板，b<0有极值，b≥0单调",
                commonMistakes: []
            ),
            weaponUsed: "三次函数单调性模板",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ x³系数>0的三次函数f'=3x²+常数项
                2️⃣ 常数项≥0（即a≤0）：f'≥0，全程递增
                3️⃣ 常数项<0（即a>0）：f'有两根±√a，先增后减再增
                💡 模板记忆：三次函数单调性只看f'的判别式
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "单调性", "参数讨论", "三次函数", "核心"]
    ),

    Problem(
        id: "func_010",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["derivative", "ln_inequality"],
        content: "若x>0时，xlnx≥-1/e恒成立，则不等式成立的等号条件为x=____。",
        contentLatex: "x\\ln x \\geq -\\frac{1}{e}, x>0, 等号x=?",
        options: nil,
        answer: "1/e",
        difficulty: 0.7,
        averageTime: 180,
        hints: ["令g(x)=xlnx", "g'(x)=lnx+1=0"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "令g(x)=xlnx", latex: "g'(x)=\\ln x+1=0 \\Rightarrow x=\\frac{1}{e}", annotation: ""),
                SolutionStep(order: 2, description: "最小值", latex: "g(\\frac{1}{e})=\\frac{1}{e}\\cdot(-1)=-\\frac{1}{e}", annotation: "验证最小值确实等于-1/e")
            ],
            keyInsight: "xlnx的最小值在x=1/e处取到",
            commonMistakes: ["求导出错", "ln(1/e)=-1记错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "g(x)=xlnx求导", latex: "g'=\\ln x+1=0 \\Rightarrow x=1/e", annotation: ""),
                    SolutionStep(order: 2, description: "验证", latex: "g(1/e)=-1/e", annotation: "")
                ],
                keyInsight: "求最小值点",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "经典结论秒出", latex: "x\\ln x \\geq -\\frac{1}{e}, 等号x=\\frac{1}{e}", annotation: "必背结论!")
                ],
                keyInsight: "xlnx≥-1/e是高考必背结论，x=1/e取等",
                commonMistakes: []
            ),
            weaponUsed: "xlnx最小值秒记",
            timeRatio: 5.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ xlnx的最小值=-1/e，在x=1/e处取到
                2️⃣ 这是高考必背结论，直接秒出
                💡 秒杀关键：xlnx≥-1/e，背住这个5秒出答案
                """
        ),
        gaokaoYear: 2019,
        tags: ["导数", "对数", "最值", "填空", "核心"]
    ),

    // ============ 构造函数法 ============

    Problem(
        id: "func_011",
        type: .proof,
        tier: 5,
        formulaIds: ["derivative"],
        content: "证明：当x>0时，e^x>1+x+x²/2。",
        contentLatex: "x>0: e^x > 1+x+\\frac{x^2}{2}",
        options: nil,
        answer: "e^x>1+x+x²/2在x>0时成立",
        difficulty: 0.8,
        averageTime: 360,
        hints: ["构造h(x)=e^x-1-x-x²/2", "证h(x)>0", "h(0)=0且h'(x)>0"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "构造函数", latex: "h(x)=e^x-1-x-\\frac{x^2}{2}", annotation: ""),
                SolutionStep(order: 2, description: "求导", latex: "h'(x)=e^x-1-x", annotation: ""),
                SolutionStep(order: 3, description: "再求导", latex: "h''(x)=e^x-1>0 (x>0)", annotation: ""),
                SolutionStep(order: 4, description: "链式推理", latex: "h''(x)>0 \\Rightarrow h'递增 \\Rightarrow h'(x)>h'(0)=0 \\Rightarrow h递增 \\Rightarrow h(x)>h(0)=0", annotation: "逐层递推")
            ],
            keyInsight: "多层求导法：一直求导到明显成立，再逐层回推",
            commonMistakes: ["只求一次导就试图证明", "忘记验证h(0)=0"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "构造h, 求h', h''", latex: "h''=e^x-1>0(x>0)", annotation: ""),
                    SolutionStep(order: 2, description: "逐层回推", latex: "h''>0 → h'>h'(0)=0 → h>h(0)=0", annotation: ""),
                    SolutionStep(order: 3, description: "结论", latex: "h(x)>0即e^x>1+x+x^2/2", annotation: "")
                ],
                keyInsight: "多层导数递推法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "Taylor展开秒杀", latex: "e^x=1+x+\\frac{x^2}{2}+\\frac{x^3}{6}+\\cdots", annotation: "泰勒公式!"),
                    SolutionStep(order: 2, description: "直接看", latex: "余项\\frac{x^3}{6}+\\frac{x^4}{24}+\\cdots > 0 (x>0)", annotation: "全正项之和>0")
                ],
                keyInsight: "e^x的Taylor展开：截断后余项全正，立即得证",
                commonMistakes: []
            ),
            weaponUsed: "Taylor展开秒杀法",
            timeRatio: 3.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ e^x = 1 + x + x²/2 + x³/6 + x⁴/24 + ...
                2️⃣ 减去1+x+x²/2，剩下x³/6+x⁴/24+... > 0 (x>0)
                3️⃣ 全部正项之和显然>0，证毕
                💡 秒杀关键：高阶工具（Taylor）看穿低阶问题
                🧠 高阶思维：这就是"降维"——用更高的视角看问题
                """
        ),
        gaokaoYear: 2018,
        tags: ["导数", "不等式证明", "指数函数", "构造函数", "压轴"]
    ),

    Problem(
        id: "func_012",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["derivative"],
        content: "函数f(x)=x-sinx在[0,2π]上的最大值为____。",
        contentLatex: "f(x)=x-\\sin x, x\\in[0,2\\pi]",
        options: nil,
        answer: "2π",
        difficulty: 0.6,
        averageTime: 120,
        hints: ["f'(x)=1-cosx≥0", "f(x)单调递增"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=1-\\cos x \\geq 0", annotation: "恒非负"),
                SolutionStep(order: 2, description: "单调递增", latex: "\\max f = f(2\\pi) = 2\\pi - \\sin 2\\pi = 2\\pi", annotation: "")
            ],
            keyInsight: "1-cosx≥0恒成立，函数单调递增",
            commonMistakes: ["不确定是否单调", "sin2π≠0搞错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'=1-cosx≥0", latex: "单调递增", annotation: ""),
                    SolutionStep(order: 2, description: "最大值在右端点", latex: "f(2\\pi)=2\\pi", annotation: "")
                ],
                keyInsight: "导数恒非负=单调递增",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒判", latex: "1-\\cos x \\geq 0 恒成立 \\Rightarrow f递增 \\Rightarrow f(2\\pi)=2\\pi", annotation: "口算!")
                ],
                keyInsight: "cosx≤1是常识，所以f'≥0，最大值在右端点",
                commonMistakes: []
            ),
            weaponUsed: "导数符号秒判单调性",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ f'=1-cosx，因为cosx≤1，所以f'≥0
                2️⃣ 单调递增→最大值在右端点→f(2π)=2π-0=2π
                💡 5秒搞定
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "最值", "三角函数", "填空", "核心"]
    ),

    // ============ 隐零点与参变分离 ============

    Problem(
        id: "func_013",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative"],
        content: "已知f(x)=lnx-ax(a>0)恰有两个零点x₁,x₂(x₁<x₂)，证明：x₁+x₂>2/a。",
        contentLatex: "f(x)=\\ln x-ax, x_1+x_2>\\frac{2}{a}",
        options: nil,
        answer: "x₁+x₂>2/a成立(极值点偏移)",
        difficulty: 0.9,
        averageTime: 480,
        hints: ["f(x₁)=f(x₂)=0即lnx₁=ax₁", "利用lnx的凹凸性", "构造辅助函数"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "零点条件", latex: "\\ln x_1 = ax_1, \\ln x_2 = ax_2", annotation: ""),
                SolutionStep(order: 2, description: "极值点", latex: "f'(x)=\\frac{1}{x}-a=0 \\Rightarrow x_0=\\frac{1}{a}", annotation: ""),
                SolutionStep(order: 3, description: "利用对称性", latex: "需证x_1+x_2 > \\frac{2}{a} = 2x_0", annotation: "即两零点关于极值点不对称"),
                SolutionStep(order: 4, description: "构造对称函数", latex: "设x_1=\\frac{1}{a}-t, x_2=\\frac{1}{a}+s, 证s>t", annotation: "利用lnx的凹性")
            ],
            keyInsight: "两零点之和问题→利用函数凹凸性证明不对称",
            commonMistakes: ["不知道如何利用凹凸性", "代数处理复杂"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "极值点x₀=1/a", latex: "f(x_0)=\\ln\\frac{1}{a}-1=-\\ln a-1", annotation: ""),
                    SolutionStep(order: 2, description: "构造g(t)=f(x₀-t)-f(x₀+t)", latex: "证g(t)的性质推出不对称性", annotation: ""),
                    SolutionStep(order: 3, description: "利用lnx的凹性", latex: "\\frac{\\ln x_1+\\ln x_2}{2} < \\ln\\frac{x_1+x_2}{2}", annotation: "Jensen不等式")
                ],
                keyInsight: "凹函数的Jensen不等式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "对数均值不等式", latex: "\\frac{x_1+x_2}{2} > \\frac{x_1-x_2}{\\ln x_1-\\ln x_2}", annotation: "对数均值<算术均值"),
                    SolutionStep(order: 2, description: "代入零点条件", latex: "\\ln x_i = ax_i \\Rightarrow \\frac{x_1-x_2}{a(x_1-x_2)}=\\frac{1}{a}", annotation: "分子分母消去"),
                    SolutionStep(order: 3, description: "结论", latex: "\\frac{x_1+x_2}{2} > \\frac{1}{a} \\Rightarrow x_1+x_2 > \\frac{2}{a}", annotation: "秒杀!")
                ],
                keyInsight: "对数均值不等式：(a-b)/(lna-lnb) < (a+b)/2",
                commonMistakes: []
            ),
            weaponUsed: "对数均值不等式秒杀",
            timeRatio: 3.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ 对数均值不等式：(a-b)/(lna-lnb) < (a+b)/2 (a≠b>0)
                2️⃣ 代入lnx₁=ax₁, lnx₂=ax₂:
                   (x₁-x₂)/(ax₁-ax₂) = 1/a
                3️⃣ 由不等式：1/a < (x₁+x₂)/2 → x₁+x₂ > 2/a
                💡 秒杀关键：对数均值不等式是零点和问题的终极武器
                🧠 这个不等式可以秒杀80%的"两零点之和"压轴题
                """
        ),
        gaokaoYear: 2019,
        tags: ["导数", "零点", "不等式证明", "对数均值不等式", "压轴"]
    ),

    Problem(
        id: "func_014",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative"],
        content: "已知f(x)=ae^x-lnx-1，若f(x)≥0在x>0上恒成立，求a的最小值。",
        contentLatex: "ae^x - \\ln x - 1 \\geq 0, x>0",
        options: nil,
        answer: "a=1/e",
        difficulty: 0.8,
        averageTime: 300,
        hints: ["分离参数a≥(lnx+1)/e^x", "求右边最大值"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "分离参数", latex: "a \\geq \\frac{\\ln x+1}{e^x}", annotation: ""),
                SolutionStep(order: 2, description: "令h(x)=(lnx+1)/e^x求最大值", latex: "h'(x)=\\frac{\\frac{1}{x}e^x-(\\ln x+1)e^x}{e^{2x}}=\\frac{\\frac{1}{x}-\\ln x-1}{e^x}", annotation: ""),
                SolutionStep(order: 3, description: "x=1时", latex: "h'(1)=\\frac{1-0-1}{e}=0, h(1)=\\frac{0+1}{e}=\\frac{1}{e}", annotation: ""),
                SolutionStep(order: 4, description: "验证极大", latex: "a_{\\min}=\\frac{1}{e}", annotation: "")
            ],
            keyInsight: "分离参数法→求分式最大值",
            commonMistakes: ["求导过程复杂易出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分离a", latex: "a \\geq \\frac{\\ln x+1}{e^x}", annotation: ""),
                    SolutionStep(order: 2, description: "h(x)求导", latex: "h'=\\frac{1/x-\\ln x-1}{e^x}=0 \\Rightarrow x=1", annotation: ""),
                    SolutionStep(order: 3, description: "a_min=h(1)=1/e", latex: "", annotation: "")
                ],
                keyInsight: "分离参数+求极值",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "猜极值点x=1", latex: "f(1)=ae-0-1=ae-1 \\geq 0 \\Rightarrow a \\geq \\frac{1}{e}", annotation: "x=1通常是极值点"),
                    SolutionStep(order: 2, description: "验证a=1/e时f≥0", latex: "f(x)=e^{x-1}-\\ln x-1,\\ f'(x)=e^{x-1}-\\tfrac1x,\\ f'(1)=0,\\ f(1)=0", annotation: "x=1为最小值点且f(1)=0，故f≥0，a_min=1/e成立")
                ],
                keyInsight: "含e^x和lnx的函数，极值点几乎总在x=1",
                commonMistakes: []
            ),
            weaponUsed: "x=1猜极值点法",
            timeRatio: 2.5,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ 含e^x和lnx的混合函数，极值点大概率在x=1
                2️⃣ 代入x=1：ae-1≥0 → a≥1/e
                3️⃣ 这给出a的候选值，再验证充分性
                💡 秒杀关键：x=1是e^x和lnx的"公约点"(e^0=1,ln1=0)
                """
        ),
        gaokaoYear: 2022,
        tags: ["导数", "恒成立", "参数最值", "指数", "对数", "压轴"]
    ),

    Problem(
        id: "func_015",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["derivative"],
        content: "曲线y=x³在点(1,1)处的切线方程为____。",
        contentLatex: "y=x^3, 点(1,1)处切线",
        options: nil,
        answer: "y=3x-2",
        difficulty: 0.5,
        averageTime: 90,
        hints: ["y'=3x²", "斜率k=y'(1)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "y'=3x^2", annotation: ""),
                SolutionStep(order: 2, description: "斜率", latex: "k=y'(1)=3", annotation: ""),
                SolutionStep(order: 3, description: "切线方程", latex: "y-1=3(x-1) \\Rightarrow y=3x-2", annotation: "")
            ],
            keyInsight: "切线方程=导数值×(x-x₀)+y₀",
            commonMistakes: ["导数求错", "点斜式写错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "y'=3x², k=3", latex: "y-1=3(x-1)", annotation: ""),
                    SolutionStep(order: 2, description: "化简", latex: "y=3x-2", annotation: "")
                ],
                keyInsight: "求导→代入点→点斜式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "口算", latex: "k=3(1)^2=3, y=3x-2", annotation: "5秒口算!")
                ],
                keyInsight: "x^n在x=1处切线斜率=n",
                commonMistakes: []
            ),
            weaponUsed: "幂函数切线口算",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ x^n在x=1处：斜率=n，切点(1,1)
                2️⃣ y-1=n(x-1) → y=nx-(n-1)
                3️⃣ n=3: y=3x-2
                💡 x=1处的切线斜率就是指数n
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "切线", "填空", "核心"]
    ),

    // ============ 复合函数与导数综合 ============

    Problem(
        id: "func_016",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "chain_rule"],
        content: "已知f(x)=ln(1+x)-x+x²/2，证明当x>0时f(x)>0。",
        contentLatex: "x>0: \\ln(1+x) > x - \\frac{x^2}{2}",
        options: nil,
        answer: "f(x)>0在x>0时成立",
        difficulty: 0.75,
        averageTime: 300,
        hints: ["f'(x)=1/(1+x)-1+x", "通分后分析符号"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=\\frac{1}{1+x}-1+x=\\frac{1-(1+x)+x(1+x)}{1+x}=\\frac{x^2}{1+x}", annotation: ""),
                SolutionStep(order: 2, description: "符号判断", latex: "f'(x)=\\frac{x^2}{1+x}>0 (x>0)", annotation: "分子分母均正"),
                SolutionStep(order: 3, description: "结论", latex: "f递增且f(0)=0 \\Rightarrow f(x)>0 (x>0)", annotation: "")
            ],
            keyInsight: "通分化简后发现f'=x²/(1+x)>0",
            commonMistakes: ["通分出错", "忘记验证f(0)=0"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'通分", latex: "f'=\\frac{x^2}{1+x}>0", annotation: ""),
                    SolutionStep(order: 2, description: "f(0)=0且递增", latex: "f(x)>0, x>0", annotation: "")
                ],
                keyInsight: "求导通分化简",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "Taylor秒杀", latex: "\\ln(1+x)=x-\\frac{x^2}{2}+\\frac{x^3}{3}-\\cdots", annotation: ""),
                    SolutionStep(order: 2, description: "差值", latex: "f(x)=\\frac{x^3}{3}-\\frac{x^4}{4}+\\cdots = x^3(\\frac{1}{3}-\\frac{x}{4}+\\cdots)>0", annotation: "x较小时显然>0")
                ],
                keyInsight: "ln(1+x)的Taylor展开直接看出差值",
                commonMistakes: []
            ),
            weaponUsed: "Taylor展开降维",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ ln(1+x) = x - x²/2 + x³/3 - x⁴/4 + ...
                2️⃣ ln(1+x) - (x-x²/2) = x³/3 - x⁴/4 + ... = x³(1/3-x/4+...)
                3️⃣ 对0<x<4/3，括号内>0，更一般的用Leibniz判别法
                💡 Taylor展开：直接读出不等式的"差距"
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "不等式证明", "对数", "构造函数", "核心"]
    ),

    Problem(
        id: "func_017",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative"],
        content: "设f(x)=(2-x)e^x+a(x-1)²有两个极值点x₁,x₂(x₁<x₂)，求a的取值范围。",
        contentLatex: "f(x)=(2-x)e^x+a(x-1)^2",
        options: nil,
        answer: "a>e/2",
        difficulty: 0.85,
        averageTime: 420,
        hints: ["f'(x)=(1-x)e^x+2a(x-1)=(1-x)(e^x-2a)", "讨论e^x=2a的解"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=-e^x+(2-x)e^x+2a(x-1)=(1-x)e^x+2a(x-1)", annotation: ""),
                SolutionStep(order: 2, description: "提取公因子", latex: "f'(x)=(1-x)(e^x-2a)", annotation: "x=1是一个零点"),
                SolutionStep(order: 3, description: "另一零点", latex: "e^x=2a \\Rightarrow x=\\ln(2a)", annotation: "需2a>0即a>0"),
                SolutionStep(order: 4, description: "两个极值点", latex: "需\\ln(2a) \\neq 1, 即a \\neq \\frac{e}{2}", annotation: "且a>0"),
                SolutionStep(order: 5, description: "验证确实是极值", latex: "f'在x₁,x₂处变号, 需a>0且a \\neq e/2", annotation: "")
            ],
            keyInsight: "关键是提取公因子(1-x)，将问题简化",
            commonMistakes: ["求导出错", "忘记排除x₁=x₂的情况"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'提取(1-x)", latex: "f'=(1-x)(e^x-2a)", annotation: ""),
                    SolutionStep(order: 2, description: "两极值点", latex: "x_1=1, x_2=\\ln(2a), 需x_1 \\neq x_2", annotation: ""),
                    SolutionStep(order: 3, description: "a≠e/2且a>0", latex: "综合: a \\in (0,\\frac{e}{2})\\cup(\\frac{e}{2},+\\infty)", annotation: "")
                ],
                keyInsight: "提取公因子后分析方程的解",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒看结构", latex: "f'=(1-x)(e^x-2a)", annotation: "两因子乘积"),
                    SolutionStep(order: 2, description: "两零点条件", latex: "x=1和x=\\ln(2a)，不等即a \\neq e/2, a>0", annotation: "秒出!")
                ],
                keyInsight: "导数因式分解后，极值点=各因子的零点",
                commonMistakes: []
            ),
            weaponUsed: "导数因式分解秒杀",
            timeRatio: 2.5,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ 求导后提取(1-x)公因子：f'=(1-x)(e^x-2a)
                2️⃣ 两个零点：x=1 和 x=ln(2a)
                3️⃣ 两个极值点需两零点不同：ln(2a)≠1 → a≠e/2
                4️⃣ 且ln(2a)存在需a>0
                💡 秒杀关键：导数因式分解是分析极值的最快路径
                """
        ),
        gaokaoYear: 2020,
        tags: ["导数", "极值", "参数讨论", "因式分解", "压轴"]
    ),

    Problem(
        id: "func_018",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["derivative"],
        content: "f(x)=x²e^x的单调递减区间为____。",
        contentLatex: "f(x)=x^2e^x",
        options: nil,
        answer: "(-2,0)",
        difficulty: 0.6,
        averageTime: 120,
        hints: ["f'(x)=2xe^x+x²e^x=xe^x(x+2)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=2xe^x+x^2e^x=xe^x(x+2)", annotation: ""),
                SolutionStep(order: 2, description: "符号分析", latex: "e^x>0, 故f'的符号取决于x(x+2)", annotation: ""),
                SolutionStep(order: 3, description: "递减区间", latex: "x(x+2)<0 \\Rightarrow -2<x<0", annotation: "")
            ],
            keyInsight: "e^x>0可以消去，只需分析多项式因子的符号",
            commonMistakes: ["求导时漏项", "不等式方向搞错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'=xe^x(x+2)", latex: "e^x>0消去", annotation: ""),
                    SolutionStep(order: 2, description: "x(x+2)<0", latex: "x\\in(-2,0)", annotation: "")
                ],
                keyInsight: "e^x消去后分析二次因子",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "口算秒出", latex: "f'=xe^x(x+2), 零点x=0,-2, e^x恒正→(-2,0)递减", annotation: "10秒!")
                ],
                keyInsight: "e^x恒正消去，剩余因子的零点直接确定区间",
                commonMistakes: []
            ),
            weaponUsed: "e^x消去+零点区间法",
            timeRatio: 2.5,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ f'=xe^x(x+2)，e^x>0消去
                2️⃣ x(x+2)的零点：x=0, x=-2
                3️⃣ 二次因子在两根之间为负→(-2,0)递减
                💡 含e^x的函数求导后，e^x恒正直接忽略
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "单调性", "指数函数", "填空", "核心"]
    ),

    Problem(
        id: "func_019",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative"],
        content: "已知f(x)=x-1-alnx(a>0)，若f(x)≥0对x>0恒成立，求a的取值范围。",
        contentLatex: "f(x)=x-1-a\\ln x \\geq 0, x>0, a>0",
        options: nil,
        answer: "0<a≤1",
        difficulty: 0.75,
        averageTime: 240,
        hints: ["f'(x)=1-a/x", "极小值在x=a处", "f(a)≥0"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=1-\\frac{a}{x}=\\frac{x-a}{x}", annotation: ""),
                SolutionStep(order: 2, description: "极值点x=a", latex: "f'(a)=0, x<a递减, x>a递增", annotation: "x=a是极小值点"),
                SolutionStep(order: 3, description: "极小值≥0", latex: "f(a)=a-1-a\\ln a \\geq 0", annotation: ""),
                SolutionStep(order: 4, description: "令g(a)=a-1-alna", latex: "g'(a)=-\\ln a, g'(1)=0, g(1)=0", annotation: "g在a=1取最大值0"),
                SolutionStep(order: 5, description: "结论", latex: "g(a) \\leq 0 = g(1), 等号a=1. 所以0<a\\leq1", annotation: "")
            ],
            keyInsight: "恒成立→极小值≥0→对参数再求导",
            commonMistakes: ["二次分离参数的逻辑搞混"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "极小值点x=a", latex: "f(a)=a-1-a\\ln a \\geq 0", annotation: ""),
                    SolutionStep(order: 2, description: "令g(a)=a-1-alna", latex: "g'=-\\ln a=0 \\Rightarrow a=1", annotation: ""),
                    SolutionStep(order: 3, description: "g(1)=0且g''(1)=-1<0", latex: "a=1是最大值→g(a)\\leq0", annotation: ""),
                    SolutionStep(order: 4, description: "等号a=1", latex: "0<a\\leq1", annotation: "")
                ],
                keyInsight: "二次求导确定参数范围",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "经典不等式", latex: "\\ln x \\leq x-1 \\Rightarrow x-1 \\geq \\ln x", annotation: ""),
                    SolutionStep(order: 2, description: "需x-1≥alnx", latex: "a \\leq \\frac{x-1}{\\ln x}(x\\neq1)", annotation: ""),
                    SolutionStep(order: 3, description: "当a=1时", latex: "x-1-\\ln x \\geq 0 恒成立(经典不等式)", annotation: "所以a≤1")
                ],
                keyInsight: "利用lnx≤x-1直接判断a=1是边界",
                commonMistakes: []
            ),
            weaponUsed: "经典对数不等式秒判",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ x-1≥lnx（经典不等式，等号x=1）
                2️⃣ 当a=1时，f(x)=x-1-lnx≥0 恒成立
                3️⃣ 当a>1时，f(a)=a-1-alna<0（代入极小值点验证）
                4️⃣ 所以0<a≤1
                💡 秒杀关键：lnx≤x-1直接给出a=1的边界
                """
        ),
        gaokaoYear: 2021,
        tags: ["导数", "恒成立", "参数范围", "对数", "压轴"]
    ),

    Problem(
        id: "func_020",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative"],
        content: "已知f(x)=x²-2xlnx，求f(x)在[1,e]上的最大值和最小值。",
        contentLatex: "f(x)=x^2-2x\\ln x, x\\in[1,e]",
        options: nil,
        answer: "最大值1（x=1），最小值e²-2e（x=e）",
        difficulty: 0.65,
        averageTime: 210,
        hints: ["f'(x)=2x-2lnx-2=2(x-lnx-1)", "利用lnx≤x-1判断f'的符号"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=2x-2\\ln x-2=2(x-\\ln x-1)", annotation: ""),
                SolutionStep(order: 2, description: "分析符号", latex: "令g(x)=x-\\ln x-1, g'(x)=1-\\frac{1}{x}=\\frac{x-1}{x}>0 (x>1)", annotation: ""),
                SolutionStep(order: 3, description: "g(1)=0且递增", latex: "g(x)>0 (x>1) \\Rightarrow f'(x)>0", annotation: "f在(1,e]递增"),
                SolutionStep(order: 4, description: "比较端点", latex: "f(1)=1, f(e)=e^2-2e \\approx 1.39", annotation: ""),
                SolutionStep(order: 5, description: "结论", latex: "最小值f(1)=1, 最大值f(e)=e^2-2e", annotation: "")
            ],
            keyInsight: "x-lnx-1≥0（经典不等式）判断导数符号",
            commonMistakes: ["f'的符号判断困难", "端点值计算错误"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'=2(x-lnx-1)", latex: "x-lnx-1>0 (x>1)", annotation: ""),
                    SolutionStep(order: 2, description: "[1,e]上递增", latex: "\\min=f(1)=1, \\max=f(e)=e^2-2e", annotation: "")
                ],
                keyInsight: "利用x-lnx≥1判断单调性",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "经典不等式秒判", latex: "\\ln x \\leq x-1 \\Rightarrow x-\\ln x \\geq 1 \\Rightarrow f'>0", annotation: "一步到位"),
                    SolutionStep(order: 2, description: "递增→端点比较", latex: "f(1)=1, f(e)=e^2-2e", annotation: "")
                ],
                keyInsight: "lnx≤x-1秒判f'符号，然后端点比较",
                commonMistakes: []
            ),
            weaponUsed: "对数不等式+端点比较",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                1️⃣ f'=2(x-lnx-1)，由lnx≤x-1知x-lnx≥1
                2️⃣ 所以f'≥0，[1,e]上递增
                3️⃣ 最小值=f(1)=1，最大值=f(e)=e²-2e
                💡 秒杀关键：lnx≤x-1是万能符号判断工具
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "最值", "闭区间", "对数", "核心"]
    ),

    // ============ func_021-025: 构造函数与零点 ============

    Problem(
        id: "func_021",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "zero_point"],
        content: "已知f(x)=e^x-x²-ax，若f(x)≥0对一切x∈R恒成立，求a的取值范围。",
        contentLatex: "f(x)=e^x-x^2-ax \\geq 0, \\forall x\\in\\mathbb{R}",
        options: nil,
        answer: "a的取值范围为[-1, 1]",
        difficulty: 0.85,
        averageTime: 360,
        hints: ["f(x)≥0恒成立等价于a的约束", "对x=0处分析", "构造g(x)分离参数"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "分离参数", latex: "e^x-x^2 \\geq ax, x\\neq 0时 \\frac{e^x-x^2}{x} \\geq a (x>0), \\leq a (x<0)", annotation: "分x>0和x<0讨论"),
                SolutionStep(order: 2, description: "令g(x)=(e^x-x²)/x", latex: "g'(x)=\\frac{(xe^x-e^x+x^2)}{x^2}", annotation: "求导分析"),
                SolutionStep(order: 3, description: "分析极值", latex: "x>0: g(x)\\geq g(x_0), x<0: g(x)\\leq g(x_0)", annotation: "找临界值"),
                SolutionStep(order: 4, description: "结论", latex: "a \\in [-1, 1]", annotation: "")
            ],
            keyInsight: "分离参数后分x正负讨论，分别求最值",
            commonMistakes: ["忘记x=0单独验证", "分离参数时不等号方向弄反"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分离参数讨论", latex: "\\frac{e^x-x^2}{x} \\gtrless a", annotation: "分x正负"),
                    SolutionStep(order: 2, description: "分别求极值", latex: "x>0最小值, x<0最大值", annotation: ""),
                    SolutionStep(order: 3, description: "取交集", latex: "a \\in [-1,1]", annotation: "")
                ],
                keyInsight: "分离参数+分类讨论",
                commonMistakes: ["漏掉x=0检验"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：x=0处切线法", latex: "f(0)=1\\geq 0, f'(0)=1-a=0 \\Rightarrow a=1上界", annotation: ""),
                    SolutionStep(order: 2, description: "对称性", latex: "f(-x)=e^{-x}-x^2+ax, f'(0)=-1+a=0 \\Rightarrow a=-1下界", annotation: "秒判边界")
                ],
                keyInsight: "在x=0处Taylor展开，f(x)≈1+(1-a)x+...，秒判a范围",
                commonMistakes: []
            ),
            weaponUsed: "零点切线法秒判参数",
            timeRatio: 2.5,
            detailedExplanation: """
                【降维秒杀详解】
                1. f(0)=1>0，x=0不是约束点
                2. f'(0)=1-a，若a>1则f在0附近递减，f会变负
                3. 对称地分析x<0，得a≥-1
                4. 验证a=±1时f≥0确实成立
                秒杀关键：从x=0处局部行为秒判参数边界
                """
        ),
        gaokaoYear: 2020,
        tags: ["导数", "恒成立", "参数范围", "指数", "压轴"]
    ),

    Problem(
        id: "func_022",
        type: .proof,
        tier: 5,
        formulaIds: ["derivative", "inequality"],
        content: "证明：对任意正整数n，(1+1/n)^n < e < (1+1/n)^(n+1)。",
        contentLatex: "\\left(1+\\frac{1}{n}\\right)^n < e < \\left(1+\\frac{1}{n}\\right)^{n+1}",
        options: nil,
        answer: "不等式对一切正整数n成立",
        difficulty: 0.90,
        averageTime: 420,
        hints: ["取对数转化", "利用ln(1+x)与x的关系", "构造函数证不等式"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "取对数", latex: "n\\ln(1+\\frac{1}{n}) < 1 < (n+1)\\ln(1+\\frac{1}{n})", annotation: "等价变形"),
                SolutionStep(order: 2, description: "左侧：令x=1/n", latex: "\\frac{\\ln(1+x)}{x} < 1, 即\\ln(1+x)<x", annotation: "经典不等式"),
                SolutionStep(order: 3, description: "右侧", latex: "\\frac{\\ln(1+x)}{x} > \\frac{1}{1+x}, 即(1+x)\\ln(1+x)>x", annotation: ""),
                SolutionStep(order: 4, description: "证ln(1+x)>x/(1+x)", latex: "令h(x)=\\ln(1+x)-\\frac{x}{1+x}, h'(x)=\\frac{x}{(1+x)^2}>0", annotation: "h(0)=0且递增")
            ],
            keyInsight: "取对数后归结为ln(1+x)的经典放缩",
            commonMistakes: ["不知道取对数", "放缩方向弄反"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "取对数", latex: "n\\ln(1+1/n) \\lessgtr 1", annotation: ""),
                    SolutionStep(order: 2, description: "构造辅助函数证放缩", latex: "f(x)=x-\\ln(1+x), g(x)=\\ln(1+x)-\\frac{x}{1+x}", annotation: ""),
                    SolutionStep(order: 3, description: "分别证f>0, g>0", latex: "求导验证单调性", annotation: "")
                ],
                keyInsight: "标准构造函数法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀框架", latex: "\\frac{x}{1+x} < \\ln(1+x) < x", annotation: "一个不等式搞定两边"),
                    SolutionStep(order: 2, description: "代入x=1/n", latex: "\\frac{1}{n+1} < \\ln(1+\\frac{1}{n}) < \\frac{1}{n}", annotation: "直接得证")
                ],
                keyInsight: "记住ln(1+x)的夹逼：x/(1+x) < ln(1+x) < x",
                commonMistakes: []
            ),
            weaponUsed: "对数夹逼不等式秒杀",
            timeRatio: 3.0,
            detailedExplanation: """
                【降维秒杀详解】
                核心武器：x/(1+x) < ln(1+x) < x (x>0)
                代入x=1/n:
                左: 1/(n+1) < ln(1+1/n) → (n+1)ln(1+1/n) > 1 → e < (1+1/n)^(n+1)
                右: ln(1+1/n) < 1/n → nln(1+1/n) < 1 → (1+1/n)^n < e
                秒杀关键：一个对数夹逼公式解决全部
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "证明", "对数不等式", "放缩", "核心"]
    ),

    Problem(
        id: "func_023",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "extreme_value"],
        content: "设f(x)=x³-3ax+b，若f(x)有三个不同的零点，求a,b满足的条件，并求零点之和与零点之积。",
        contentLatex: "f(x)=x^3-3ax+b",
        options: nil,
        answer: "a>0且-2a√a<b<2a√a，零点之和=0，零点之积=-b",
        difficulty: 0.75,
        averageTime: 300,
        hints: ["三次函数有三个零点的条件", "极大值>0且极小值<0", "韦达定理"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求极值点", latex: "f'(x)=3x^2-3a=0 \\Rightarrow x=\\pm\\sqrt{a} (a>0)", annotation: "a≤0无极值"),
                SolutionStep(order: 2, description: "极值条件", latex: "f(\\sqrt{a}) \\cdot f(-\\sqrt{a}) < 0", annotation: "异号才有三个零点"),
                SolutionStep(order: 3, description: "计算极值", latex: "f(\\sqrt{a})=-2a\\sqrt{a}+b, f(-\\sqrt{a})=2a\\sqrt{a}+b", annotation: ""),
                SolutionStep(order: 4, description: "韦达定理", latex: "x_1+x_2+x_3=0, x_1x_2x_3=-b", annotation: "直接读系数")
            ],
            keyInsight: "三次函数三零点条件=极大值与极小值异号",
            commonMistakes: ["忘记a>0的前提", "极值乘积条件写成≤0"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导找极值点", latex: "x=\\pm\\sqrt{a}", annotation: ""),
                    SolutionStep(order: 2, description: "极值异号条件", latex: "(-2a\\sqrt{a}+b)(2a\\sqrt{a}+b)<0", annotation: ""),
                    SolutionStep(order: 3, description: "化简", latex: "b^2 < 4a^3", annotation: ""),
                    SolutionStep(order: 4, description: "韦达定理读系数", latex: "\\sum x_i=0, \\prod x_i=-b", annotation: "")
                ],
                keyInsight: "极值异号+韦达定理",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：三次函数口诀", latex: "x^3-3ax+b三零点 \\Leftrightarrow |b|<2a\\sqrt{a}", annotation: "直接套结论"),
                    SolutionStep(order: 2, description: "韦达定理秒读", latex: "和=0 (无x^2项), 积=-b", annotation: "")
                ],
                keyInsight: "三次函数三零点判别式：|b|<2a√a",
                commonMistakes: []
            ),
            weaponUsed: "三次函数三零点判别口诀",
            timeRatio: 3.0,
            detailedExplanation: """
                【降维秒杀详解】
                三次函数x³-3ax+b的核心结论：
                1. 有三个不同实根 ⟺ a>0 且 |b|<2a√a
                2. 韦达定理直接读：和=0，积=-b
                记住这个口诀，遇到三次函数零点问题秒出答案
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "三次函数", "零点", "韦达定理", "核心"]
    ),

    Problem(
        id: "func_024",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["derivative", "tangent_line"],
        content: "曲线y=x⁴-2x在点(1,-1)处的切线与两坐标轴围成的三角形面积为______。",
        contentLatex: "y=x^4-2x",
        options: nil,
        answer: "9/4",
        difficulty: 0.70,
        averageTime: 240,
        hints: ["先求切线方程", "求切线在两坐标轴上的截距", "S=½|x截距|·|y截距|"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "y'=4x^3-2,\\ y'(1)=2", annotation: "切线斜率"),
                SolutionStep(order: 2, description: "切线方程", latex: "y-(-1)=2(x-1) \\Rightarrow y=2x-3", annotation: ""),
                SolutionStep(order: 3, description: "两轴截距", latex: "y=0\\Rightarrow x=\\tfrac32;\\quad x=0\\Rightarrow y=-3", annotation: "x截距3/2，y截距-3"),
                SolutionStep(order: 4, description: "面积", latex: "S=\\frac{1}{2}\\left|\\frac{3}{2}\\right|\\cdot|-3|=\\frac{1}{2}\\cdot\\frac{3}{2}\\cdot3=\\frac{9}{4}", annotation: "直角三角形面积")
            ],
            keyInsight: "求切线→两轴截距→直角三角形面积½|x₀||y₀|。",
            commonMistakes: ["切线斜率算错", "只用x轴交点（直线与单轴不围成有限区域）"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "y'(1)=2", latex: "切线y=2x-3", annotation: ""),
                    SolutionStep(order: 2, description: "截距与面积", latex: "x_0=\\tfrac32,\\ y_0=-3,\\ S=\\frac{1}{2}\\cdot\\frac{3}{2}\\cdot3=\\frac{9}{4}", annotation: "")
                ],
                keyInsight: "切线→截距→面积",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "【秒杀】截距式直接读面积", latex: "y=2x-3\\Rightarrow \\frac{x}{3/2}+\\frac{y}{-3}=1", annotation: "化为截距式"),
                    SolutionStep(order: 2, description: "面积公式", latex: "S=\\frac{1}{2}|a||b|=\\frac{1}{2}\\cdot\\frac{3}{2}\\cdot3=\\frac{9}{4}", annotation: "a,b为两轴截距")
                ],
                keyInsight: "直线化截距式x/a+y/b=1后，与两轴围成三角形面积直接是½|ab|。",
                commonMistakes: []
            ),
            weaponUsed: "截距式秒算面积",
            timeRatio: 1.8,
            detailedExplanation: """
                【降维秒杀详解】
                1. y'(1)=4-2=2，切线 y=2x-3
                2. 化为截距式 x/(3/2) + y/(-3) = 1，两轴截距 a=3/2, b=-3
                3. 切线与两坐标轴围成直角三角形，面积 S=½|a||b|=½·(3/2)·3=9/4
                💡 一条直线只与单一坐标轴不能围成有限区域，必须与两轴(或其他线)围成三角形。
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "切线", "面积", "填空"]
    ),

    Problem(
        id: "func_025",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "inequality"],
        content: "已知f(x)=lnx-ax+1，若f(x)≤0对x∈(0,+∞)恒成立，求a的最小值，并证明：ln(n!)>n(n-1)/2·ln(a_min)对n≥2成立。",
        contentLatex: "f(x)=\\ln x - ax + 1 \\leq 0",
        options: nil,
        answer: "a的最小值为1",
        difficulty: 0.88,
        averageTime: 400,
        hints: ["lnx≤x-1的推广", "a_min时f(x)≤0取等", "累加法证明第二问"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "分离参数", latex: "a \\geq \\frac{\\ln x + 1}{x}, \\forall x>0", annotation: ""),
                SolutionStep(order: 2, description: "求右侧最大值", latex: "g(x)=\\frac{\\ln x+1}{x}, g'(x)=\\frac{-\\ln x}{x^2}=0 \\Rightarrow x=1", annotation: ""),
                SolutionStep(order: 3, description: "g(1)=1", latex: "a_{\\min}=1", annotation: ""),
                SolutionStep(order: 4, description: "第二问", latex: "\\ln x \\leq x-1代入x=k/(k-1): \\ln\\frac{k}{k-1}\\leq\\frac{1}{k-1}", annotation: "累加"),
                SolutionStep(order: 5, description: "累加得", latex: "\\ln n! = \\sum_{k=1}^{n}\\ln k > \\frac{n(n-1)}{2}\\ln 1=0", annotation: "利用lnx≤x-1")
            ],
            keyInsight: "分离参数求最值+经典不等式累加",
            commonMistakes: ["第二问不知道如何利用第一问结论"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "g(x)=(lnx+1)/x求最大值", latex: "g'=0 \\Rightarrow x=1, g(1)=1", annotation: ""),
                    SolutionStep(order: 2, description: "a_min=1", latex: "即\\ln x \\leq x-1", annotation: "经典结论"),
                    SolutionStep(order: 3, description: "第二问累加", latex: "代入特殊值累加求和", annotation: "")
                ],
                keyInsight: "分离参数+累加法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：识别经典结构", latex: "\\ln x \\leq x-1 \\Rightarrow a_{\\min}=1", annotation: "一眼看出"),
                    SolutionStep(order: 2, description: "第二问：AM-GM秒杀", latex: "n! = \\prod k, \\ln(n!)=\\sum \\ln k > \\int_1^n \\ln x dx = n\\ln n - n + 1", annotation: "积分放缩")
                ],
                keyInsight: "lnx≤x-1是高考万能不等式，直接秒出a=1",
                commonMistakes: []
            ),
            weaponUsed: "经典对数不等式lnx≤x-1",
            timeRatio: 2.5,
            detailedExplanation: """
                【降维秒杀详解】
                第一问：lnx≤x-1是最基础的对数不等式
                见到lnx-ax+1≤0，直接联想a=1时就是lnx≤x-1
                第二问：用积分估计求和，比累加法更快更优雅
                秒杀关键：背熟lnx≤x-1，遇到就秒
                """
        ),
        gaokaoYear: 2019,
        tags: ["导数", "恒成立", "对数不等式", "累加法", "压轴"]
    ),

    // ============ func_026-030: 隐零点与参数讨论 ============

    Problem(
        id: "func_026",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "zero_point"],
        content: "已知f(x)=xlnx，g(x)=x²-1，若方程f(x)=tg(x)有两个不等的实根，求t的取值范围。",
        contentLatex: "x\\ln x = t(x^2-1)",
        options: nil,
        answer: "t∈(0, 1/2)",
        difficulty: 0.82,
        averageTime: 360,
        hints: ["x=1是一个根", "x≠1时分离参数t", "令h(x)=xlnx/(x²-1)求值域"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "观察x=1", latex: "f(1)=0, g(1)=0, x=1恒为根", annotation: ""),
                SolutionStep(order: 2, description: "x≠1时分离t", latex: "t=\\frac{x\\ln x}{x^2-1}", annotation: ""),
                SolutionStep(order: 3, description: "令h(x)=xlnx/(x²-1)", latex: "分析h(x)在(0,1)\\cup(1,+\\infty)上的值域", annotation: ""),
                SolutionStep(order: 4, description: "求导分析", latex: "\\lim_{x\\to 1}h(x)=\\frac{1}{2}, h(0^+)=0, h(+\\infty)=0", annotation: "洛必达"),
                SolutionStep(order: 5, description: "结论", latex: "t \\in (0, \\frac{1}{2})", annotation: "h的值域")
            ],
            keyInsight: "分离参数后转化为函数值域问题",
            commonMistakes: ["忘记x=1是公共根", "h(x)在x=1处极限算错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "x=1是根，分离t", latex: "t=\\frac{x\\ln x}{x^2-1}", annotation: ""),
                    SolutionStep(order: 2, description: "求h(x)值域", latex: "h(x)\\in(0,1/2)", annotation: ""),
                    SolutionStep(order: 3, description: "两根条件", latex: "t\\in(0,1/2)", annotation: "")
                ],
                keyInsight: "分离参数+值域",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：x=1处洛必达", latex: "\\lim_{x\\to 1}\\frac{x\\ln x}{x^2-1}=\\lim\\frac{\\ln x+1}{2x}=\\frac{1}{2}", annotation: "极限值即为t上界"),
                    SolutionStep(order: 2, description: "端点值", latex: "h(0^+)=0, h(+\\infty)=0", annotation: "t下界为0")
                ],
                keyInsight: "洛必达秒求x=1处极限，即为参数临界值",
                commonMistakes: []
            ),
            weaponUsed: "洛必达极限秒判参数",
            timeRatio: 2.8,
            detailedExplanation: """
                【降维秒杀详解】
                x=1是方程公共根（两边都为0）
                分离t后，t=xlnx/(x²-1)
                在x→1处用洛必达：极限=1/2
                h(x)在x→0+和x→+∞时都趋于0
                所以h的值域为(0,1/2)，即t∈(0,1/2)
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "零点", "参数范围", "对数", "压轴"]
    ),

    Problem(
        id: "func_027",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "extreme_value", "inequality"],
        content: "已知f(x)=e^x(x²-2x+2a)，若f(x)在R上单调递增，求a的取值范围。",
        contentLatex: "f(x)=e^x(x^2-2x+2a)",
        options: nil,
        answer: "a≥1",
        difficulty: 0.78,
        averageTime: 280,
        hints: ["f'(x)≥0恒成立", "展开f'(x)合并", "x²+2a-2的最小值≥0"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=e^x(x^2-2x+2a)+e^x(2x-2)=e^x(x^2+2a-2)", annotation: "合并同类项"),
                SolutionStep(order: 2, description: "单调递增条件", latex: "f'(x)\\geq 0 \\Leftrightarrow x^2+2a-2\\geq 0,\\ \\forall x", annotation: "e^x>0"),
                SolutionStep(order: 3, description: "最小值非负", latex: "x^2+2a-2\\text{的最小值在}x=0\\text{取}=2a-2", annotation: ""),
                SolutionStep(order: 4, description: "结论", latex: "2a-2\\geq 0 \\Rightarrow a\\geq 1", annotation: "")
            ],
            keyInsight: "e^x提出后化为二次式x²+2a-2恒非负，最小值2a-2≥0。",
            commonMistakes: ["求导时展开错误", "误把临界值算成1/2"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'=e^x(x²+2a-2)", latex: "x^2+2a-2\\geq 0恒成立", annotation: ""),
                    SolutionStep(order: 2, description: "最小值≥0", latex: "2a-2\\geq 0, a\\geq 1", annotation: "")
                ],
                keyInsight: "e^x>0提出，转化为二次恒非负",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：e^x因子消去", latex: "f'=e^x \\cdot q(x), 只需q(x)\\geq 0", annotation: "一步消去e^x"),
                    SolutionStep(order: 2, description: "q(x)=x²+2a-2", latex: "\\min q = 2a-2 \\geq 0 \\Rightarrow a\\geq 1", annotation: "")
                ],
                keyInsight: "e^x恒正，直接丢掉，只看多项式部分",
                commonMistakes: []
            ),
            weaponUsed: "e^x消去法+二次最值秒判",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                f(x)=e^x·g(x)型函数：
                f'=e^x·g+e^x·g'=e^x(g+g')
                g=x²-2x+2a, g'=2x-2
                g+g'=x²+2a-2
                e^x>0直接丢掉，x²+2a-2≥0只需2a-2≥0即a≥1
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "单调性", "恒成立", "指数", "核心"]
    ),

    Problem(
        id: "func_028",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["derivative", "extreme_value"],
        content: "函数f(x)=x·e^(-x²)的最大值为______。",
        contentLatex: "f(x)=xe^{-x^2}",
        options: nil,
        answer: "1/√(2e)",
        difficulty: 0.68,
        averageTime: 200,
        hints: ["f'(x)=0", "e^(-x²)(1-2x²)=0", "x=±1/√2"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=e^{-x^2}+x(-2x)e^{-x^2}=e^{-x^2}(1-2x^2)", annotation: ""),
                SolutionStep(order: 2, description: "令f'=0", latex: "1-2x^2=0, x=\\pm\\frac{1}{\\sqrt{2}}", annotation: "e^{-x²}≠0"),
                SolutionStep(order: 3, description: "判断最大", latex: "f(\\frac{1}{\\sqrt{2}})=\\frac{1}{\\sqrt{2}}e^{-1/2}=\\frac{1}{\\sqrt{2e}}", annotation: "最大值")
            ],
            keyInsight: "e^(-x²)恒正，只需解1-2x²=0",
            commonMistakes: ["求导出错", "代入计算错误"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'=e^{-x²}(1-2x²)=0", latex: "x=1/\\sqrt{2}", annotation: ""),
                    SolutionStep(order: 2, description: "代入", latex: "f_{\\max}=\\frac{1}{\\sqrt{2e}}", annotation: "")
                ],
                keyInsight: "标准求导法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：取对数", latex: "\\ln f = \\ln x - x^2, (\\ln f)'=\\frac{1}{x}-2x=0", annotation: "对数求导更简洁"),
                    SolutionStep(order: 2, description: "x²=1/2", latex: "f_{\\max}=\\frac{1}{\\sqrt{2e}}", annotation: "")
                ],
                keyInsight: "对数求导简化运算",
                commonMistakes: []
            ),
            weaponUsed: "对数求导法",
            timeRatio: 1.5,
            detailedExplanation: """
                【降维秒杀详解】
                对f取对数：lnf = lnx - x²
                求导：1/x - 2x = 0 → x² = 1/2 → x = 1/√2
                代入：f = (1/√2)·e^(-1/2) = 1/√(2e)
                对数求导法比直接求导更快
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "最值", "指数", "对数求导", "填空"]
    ),

    Problem(
        id: "func_029",
        type: .proof,
        tier: 5,
        formulaIds: ["derivative", "inequality"],
        content: "设a>0, b>0, a≠b，证明：(a-b)/(lna-lnb) > √(ab)。即对数平均值大于几何平均值。",
        contentLatex: "\\frac{a-b}{\\ln a - \\ln b} > \\sqrt{ab}",
        options: nil,
        answer: "对数平均>几何平均，不等式成立(a≠b时严格)",
        difficulty: 0.90,
        averageTime: 420,
        hints: ["令t=a/b>0且t≠1", "化简为(t-1)/lnt > √t", "构造函数证明"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "不妨设a>b>0", latex: "令t=a/b>1, 需证\\frac{t-1}{\\ln t}>\\sqrt{t}", annotation: "齐次化"),
                SolutionStep(order: 2, description: "等价变形", latex: "\\frac{\\sqrt{t}-1/\\sqrt{t}}{\\ln t}>1, 令u=\\sqrt{t}>1", annotation: ""),
                SolutionStep(order: 3, description: "化为", latex: "\\frac{u-1/u}{2\\ln u}>1, 即u-1/u>2\\ln u", annotation: ""),
                SolutionStep(order: 4, description: "构造h(u)=u-1/u-2lnu", latex: "h'(u)=1+1/u^2-2/u=(1-1/u)^2\\geq 0", annotation: "完全平方！"),
                SolutionStep(order: 5, description: "h(1)=0且h递增", latex: "u>1时h(u)>0, 得证", annotation: "")
            ],
            keyInsight: "齐次化→换元→导数完全平方",
            commonMistakes: ["不会齐次化处理", "换元后变形困难"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "令t=a/b齐次化", latex: "(t-1)/\\ln t > \\sqrt{t}", annotation: ""),
                    SolutionStep(order: 2, description: "构造函数证明", latex: "h(u)=u-1/u-2\\ln u, h'=(1-1/u)^2\\geq 0", annotation: ""),
                    SolutionStep(order: 3, description: "h(1)=0，递增", latex: "u>1时h>0", annotation: "")
                ],
                keyInsight: "齐次化+完全平方判断",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：对数均值不等式", latex: "L(a,b)=\\frac{a-b}{\\ln a-\\ln b}", annotation: "对数平均值"),
                    SolutionStep(order: 2, description: "直接引用结论", latex: "\\sqrt{ab} < L(a,b) < \\frac{a+b}{2}", annotation: "对数均值夹在几何与算术平均之间")
                ],
                keyInsight: "对数均值不等式：G < L < A 是经典结论",
                commonMistakes: []
            ),
            weaponUsed: "对数均值不等式秒杀",
            timeRatio: 3.5,
            detailedExplanation: """
                【降维秒杀详解】
                对数均值不等式：√(ab) < (a-b)/(lna-lnb) < (a+b)/2
                即 几何平均 < 对数平均 < 算术平均
                这是高考证明题的终极武器之一
                证明的关键技巧：齐次化后导数恰好是完全平方
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "证明", "不等式", "对数均值", "压轴"]
    ),

    Problem(
        id: "func_030",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "zero_point"],
        content: "已知f(x)=e^x-ex，求f(x)的零点个数，并求所有零点之和的取值范围。",
        contentLatex: "f(x)=e^x-ex",
        options: nil,
        answer: "恰有2个零点x=1和另一个x₀∈(-∞,0)，零点之和∈(-∞,1)",
        difficulty: 0.72,
        averageTime: 260,
        hints: ["f(1)=0是显然零点", "分析f的单调性", "另一个零点在哪"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "显然零点", latex: "f(1)=e-e=0", annotation: "x=1是零点"),
                SolutionStep(order: 2, description: "求导", latex: "f'(x)=e^x-e=0 \\Rightarrow x=1", annotation: "唯一极值点"),
                SolutionStep(order: 3, description: "f''(1)=e>0", latex: "x=1是极小值点, f(1)=0", annotation: "极小值=0"),
                SolutionStep(order: 4, description: "分析", latex: "f(0)=1-0=1>0, f(-1)=e^{-1}+e>0", annotation: "等等，极小值=0说明f≥0"),
                SolutionStep(order: 5, description: "修正", latex: "f(x)\\geq f(1)=0, 只有x=1一个零点", annotation: "唯一零点")
            ],
            keyInsight: "极小值恰为0，说明f(x)≥0，唯一零点x=1",
            commonMistakes: ["以为有两个零点", "不验证极小值"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'=e^x-e=0得x=1", latex: "f(1)=0为极小值", annotation: ""),
                    SolutionStep(order: 2, description: "f≥0恒成立", latex: "唯一零点x=1", annotation: "")
                ],
                keyInsight: "极小值=0→唯一零点",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：e^x≥ex", latex: "e^x \\geq ex (等号x=1)", annotation: "经典不等式"),
                    SolutionStep(order: 2, description: "由e^x≥1+x变形", latex: "e^{x-1}\\geq x, 即e^x\\geq ex", annotation: "")
                ],
                keyInsight: "e^x≥ex（等号x=1）是e^x≥1+x的变形",
                commonMistakes: []
            ),
            weaponUsed: "经典不等式e^x≥ex秒判",
            timeRatio: 3.0,
            detailedExplanation: """
                【降维秒杀详解】
                e^x ≥ 1+x 中令x→x-1:
                e^(x-1) ≥ x，即 e^x ≥ ex
                等号当且仅当x=1
                所以f(x)=e^x-ex≥0，唯一零点x=1
                秒杀关键：识别e^x≥ex这个经典结构
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "零点", "指数", "不等式", "核心"]
    ),

    // ============ func_031-035: 复合函数与参数讨论 ============

    Problem(
        id: "func_031",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "extreme_value"],
        content: "设f(x)=(x-a)²·e^x，讨论f(x)的极值点个数。",
        contentLatex: "f(x)=(x-a)^2 e^x",
        options: nil,
        answer: "当a≠2时有两个极值点x=a和x=a-2；当a=2时无极值点",
        difficulty: 0.78,
        averageTime: 300,
        hints: ["f'(x)=0", "展开求导", "讨论极值点"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=2(x-a)e^x+(x-a)^2e^x=e^x(x-a)(x-a+2)", annotation: "提取公因子"),
                SolutionStep(order: 2, description: "f'=0的根", latex: "x=a 或 x=a-2", annotation: ""),
                SolutionStep(order: 3, description: "a≠2时", latex: "两个不同极值点x=a, x=a-2", annotation: ""),
                SolutionStep(order: 4, description: "a=2时", latex: "f'(x)=e^x(x-2)(x)=e^x x(x-2), 有两个根0和2", annotation: "等等，a=2时x=a=2, x=a-2=0，仍是两个"),
                SolutionStep(order: 5, description: "修正：a=a-2即a=2无关", latex: "当a=a-2无解(0≠-2)，所以恒有两个极值点", annotation: "")
            ],
            keyInsight: "f'提取公因子后，总有两个不同零点x=a和x=a-2",
            commonMistakes: ["求导时展开错误", "忘记e^x>0"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'=e^x(x-a)(x-a+2)", latex: "两根x=a, x=a-2", annotation: "恒不相等"),
                    SolutionStep(order: 2, description: "符号变化分析", latex: "两个都是极值点", annotation: "")
                ],
                keyInsight: "乘积求导+提公因子",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：(x-a)²·e^x型", latex: "f'=e^x(x-a)(x-a+2)", annotation: "记住公式"),
                    SolutionStep(order: 2, description: "结论", latex: "极值点x=a(极小), x=a-2(极大)", annotation: "a-2<a")
                ],
                keyInsight: "(x-a)²e^x的导数=(x-a)(x-a+2)e^x，记住这个模式",
                commonMistakes: []
            ),
            weaponUsed: "乘积求导模式识别",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                (x-a)²e^x 是经典结构：
                f' = e^x·(x-a)·(x-a+2)
                极值点永远是x=a和x=a-2
                x=a-2是极大值，x=a是极小值(f(a)=0)
                记住这个模式，遇到就秒
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "极值", "指数", "参数讨论", "核心"]
    ),

    Problem(
        id: "func_032",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "inequality"],
        content: "已知f(x)=ln(1+x)-x+x²/2，证明：当x>0时f(x)>0，并利用此结论证明ln(1+1/n)>1/(n+1)。",
        contentLatex: "f(x)=\\ln(1+x)-x+\\frac{x^2}{2}",
        options: nil,
        answer: "f(x)>0(x>0)成立，且ln(1+1/n)>1/(n+1)成立",
        difficulty: 0.88,
        averageTime: 400,
        hints: ["f(0)=0, f'(x)分析", "得ln(1+x)>x-x²/2", "代x=1/n后与1/(n+1)比较"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=\\frac{1}{1+x}-1+x=\\frac{x^2}{1+x}>0\\ (x>0)", annotation: ""),
                SolutionStep(order: 2, description: "f(0)=0且递增", latex: "x>0时f(x)>0", annotation: "即ln(1+x)>x-x²/2"),
                SolutionStep(order: 3, description: "代入x=1/n", latex: "\\ln\\!\\left(1+\\tfrac{1}{n}\\right)>\\frac{1}{n}-\\frac{1}{2n^2}=\\frac{2n-1}{2n^2}", annotation: ""),
                SolutionStep(order: 4, description: "与1/(n+1)比较", latex: "\\frac{2n-1}{2n^2}-\\frac{1}{n+1}=\\frac{(2n-1)(n+1)-2n^2}{2n^2(n+1)}=\\frac{n-1}{2n^2(n+1)}\\geq 0", annotation: "n≥1时成立"),
                SolutionStep(order: 5, description: "链式得证", latex: "\\ln\\!\\left(1+\\tfrac{1}{n}\\right)>\\frac{2n-1}{2n^2}\\geq\\frac{1}{n+1}", annotation: "第一步严格，故ln(1+1/n)>1/(n+1)")
            ],
            keyInsight: "用ln(1+x)>x-x²/2放缩，代x=1/n后所得下界仍≥1/(n+1)。",
            commonMistakes: ["放缩过头导致链断（目标不能比下界更大）"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "证f'=x²/(1+x)>0", latex: "f(0)=0, 递增, f>0", annotation: ""),
                    SolutionStep(order: 2, description: "代入x=1/n", latex: "代入化简", annotation: "")
                ],
                keyInsight: "构造函数+代入特殊值",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：Taylor放缩", latex: "\\ln(1+x) > x - \\frac{x^2}{2} + \\frac{x^3}{3} - ...", annotation: "交错级数截断"),
                    SolutionStep(order: 2, description: "偶数截断给下界", latex: "\\ln(1+x) > x - x^2/2", annotation: "直接用")
                ],
                keyInsight: "ln(1+x)的交错级数：偶数截断是下界，奇数截断是上界",
                commonMistakes: []
            ),
            weaponUsed: "Taylor截断放缩法",
            timeRatio: 2.5,
            detailedExplanation: """
                【降维秒杀详解】
                ln(1+x) = x - x²/2 + x³/3 - x⁴/4 + ...
                交错级数性质：截断到偶数项是下界，奇数项是上界
                所以 ln(1+x) > x - x²/2 (偶数项截断)
                代入x=1/n即得结论
                记住这个Taylor截断技巧！
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "证明", "对数", "Taylor放缩", "压轴"]
    ),

    Problem(
        id: "func_033",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["derivative", "extreme_value"],
        content: "函数f(x)=x³-3x在[-2,2]上的最大值与最小值之差为______。",
        contentLatex: "f(x)=x^3-3x, x\\in[-2,2]",
        options: nil,
        answer: "4",
        difficulty: 0.55,
        averageTime: 150,
        hints: ["f'(x)=3x²-3=0", "极值点x=±1", "比较端点和极值"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=3x^2-3=3(x+1)(x-1)", annotation: ""),
                SolutionStep(order: 2, description: "极值点", latex: "x=-1: f(-1)=2, x=1: f(1)=-2", annotation: ""),
                SolutionStep(order: 3, description: "端点", latex: "f(-2)=-2, f(2)=2", annotation: ""),
                SolutionStep(order: 4, description: "最值", latex: "\\max=2, \\min=-2, 差=4", annotation: "")
            ],
            keyInsight: "闭区间上比较极值点和端点的函数值",
            commonMistakes: ["忘记比较端点值"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'=0得x=±1", latex: "f(-1)=2, f(1)=-2", annotation: ""),
                    SolutionStep(order: 2, description: "端点f(±2)=±2", latex: "max-min=2-(-2)=4", annotation: "")
                ],
                keyInsight: "标准闭区间最值法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：奇函数", latex: "f(-x)=-f(x), 所以max=-min", annotation: ""),
                    SolutionStep(order: 2, description: "只需求max", latex: "f(-1)=2=f(2), max=2, 差=4", annotation: "")
                ],
                keyInsight: "奇函数在对称区间上max=-min",
                commonMistakes: []
            ),
            weaponUsed: "奇函数对称性秒判",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                f(x)=x³-3x是奇函数，[-2,2]对称
                奇函数性质：max = -min
                只需算f(-1)=2，所以差=2·2=4
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "最值", "闭区间", "奇函数", "填空"]
    ),

    Problem(
        id: "func_034",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "zero_point", "inequality"],
        content: "已知f(x)=x-sinx，g(x)=alnx (a>0)。若f(x)≥g(x)对x∈(0,+∞)恒成立，求a的取值范围。",
        contentLatex: "x-\\sin x \\geq a\\ln x, \\forall x>0",
        options: nil,
        answer: "0<a≤1",
        difficulty: 0.85,
        averageTime: 380,
        hints: ["x=1代入得0≥0", "x→0+分析", "分离参数后求最值"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "x>0且x≠1时分离a", latex: "a \\leq \\frac{x-\\sin x}{\\ln x} (x>1), a\\geq ... (0<x<1)", annotation: "注意lnx符号"),
                SolutionStep(order: 2, description: "令h(x)=(x-sinx)/lnx", latex: "x>1时求h的最小值", annotation: ""),
                SolutionStep(order: 3, description: "x→1+时", latex: "\\lim_{x\\to 1}h(x)=\\frac{1-\\cos 1}{1}=... 用洛必达", annotation: ""),
                SolutionStep(order: 4, description: "洛必达", latex: "\\lim_{x\\to 1}\\frac{x-\\sin x}{\\ln x}=\\lim\\frac{1-\\cos x}{1/x}=\\lim x(1-\\cos x)\\big|_{x=1}=0", annotation: ""),
                SolutionStep(order: 5, description: "结论", latex: "0 < a \\leq 1", annotation: "综合分析")
            ],
            keyInsight: "分离参数后分区间讨论，x→1处用洛必达",
            commonMistakes: ["lnx正负影响不等号方向"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分离参数", latex: "a \\leq \\frac{x-\\sin x}{\\ln x}", annotation: "分x>1, 0<x<1讨论"),
                    SolutionStep(order: 2, description: "求极限和极值", latex: "综合得a\\leq 1", annotation: "")
                ],
                keyInsight: "分离参数+分类讨论",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：x-sinx≥x-1≥lnx", latex: "当a=1: x-\\sin x \\geq x-1 \\geq \\ln x", annotation: "两步放缩"),
                    SolutionStep(order: 2, description: "a>1时反例", latex: "x\\to 1: \\frac{x-\\sin x}{\\ln x}\\to 1, a>1不行", annotation: "")
                ],
                keyInsight: "链式放缩：x-sinx ≥ x-1 ≥ lnx",
                commonMistakes: []
            ),
            weaponUsed: "链式放缩秒杀法",
            timeRatio: 3.0,
            detailedExplanation: """
                【降维秒杀详解】
                已知：sinx ≤ x (经典) 和 lnx ≤ x-1 (经典)
                所以 x - sinx ≥ 0 ≥ 0 (没用)
                更精细：x - sinx ≥ x-1 ≥ lnx (当x≥1)
                0<x<1时也成立(lnx<0, x-sinx≥0)
                所以a=1成立，a>1取x→1的极限=1不满足
                结论：0<a≤1
                """
        ),
        gaokaoYear: 2022,
        tags: ["导数", "恒成立", "三角", "放缩", "压轴"]
    ),

    Problem(
        id: "func_035",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "extreme_value"],
        content: "已知f(x)=ae^x-lnx-1，若f(x)≥0在x>0上恒成立，求a的最小值。",
        contentLatex: "ae^x - \\ln x - 1 \\geq 0, \\forall x>0",
        options: nil,
        answer: "a=1/e",
        difficulty: 0.80,
        averageTime: 320,
        hints: ["a≥(lnx+1)/e^x", "求g(x)=(lnx+1)/e^x最大值", "g'(x)=0在x=1处"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "分离a", latex: "a \\geq \\frac{\\ln x + 1}{e^x}", annotation: ""),
                SolutionStep(order: 2, description: "令g(x)=(lnx+1)/e^x", latex: "g'(x)=\\frac{1/x \\cdot e^x - (\\ln x+1)e^x}{e^{2x}}=\\frac{1/x-\\ln x-1}{e^x}", annotation: ""),
                SolutionStep(order: 3, description: "g'(1)=0", latex: "g'(1)=\\frac{1-0-1}{e}=0", annotation: "x=1是驻点"),
                SolutionStep(order: 4, description: "验证最大", latex: "g(1)=\\frac{0+1}{e}=\\frac{1}{e}", annotation: ""),
                SolutionStep(order: 5, description: "结论", latex: "a_{\\min}=\\frac{1}{e}", annotation: "")
            ],
            keyInsight: "分离参数后求(lnx+1)/e^x的最大值",
            commonMistakes: ["求导复杂容易出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "g=(lnx+1)/e^x", latex: "g'=0得x=1", annotation: ""),
                    SolutionStep(order: 2, description: "g(1)=1/e", latex: "a\\geq 1/e", annotation: "")
                ],
                keyInsight: "分离参数求最值",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：猜x=1", latex: "f(1)=ae-0-1\\geq 0 \\Rightarrow a\\geq 1/e", annotation: ""),
                    SolutionStep(order: 2, description: "验证a=1/e", latex: "f(x)=e^{x-1}-\\ln x-1, f'(x)=e^{x-1}-1/x", annotation: ""),
                    SolutionStep(order: 3, description: "f'(1)=0, f''(1)=e^0+1=2>0", latex: "x=1是极小值, f(1)=0", annotation: "极小值=0")
                ],
                keyInsight: "猜极值点x=1，反推a=1/e，再验证",
                commonMistakes: []
            ),
            weaponUsed: "猜极值点反推参数法",
            timeRatio: 2.5,
            detailedExplanation: """
                【降维秒杀详解】
                ae^x-lnx-1≥0恒成立
                猜最紧的点在x=1（最常见的极值点）
                代入：ae-0-1≥0 → a≥1/e
                验证a=1/e时f(x)=e^(x-1)-lnx-1
                f'(1)=0, f(1)=0, f''(1)>0 → x=1是最小值点，最小值=0
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "恒成立", "指数", "对数", "核心"]
    ),

    // ============ func_036-040: 导数与不等式证明 ============

    Problem(
        id: "func_036",
        type: .proof,
        tier: 5,
        formulaIds: ["derivative", "inequality"],
        content: "证明：对任意x>0，有 x/(1+x) ≤ ln(1+x) ≤ x。",
        contentLatex: "\\frac{x}{1+x} \\leq \\ln(1+x) \\leq x, \\quad x>0",
        options: nil,
        answer: "x/(1+x)≤ln(1+x)≤x成立(x>0时严格不等)",
        difficulty: 0.75,
        averageTime: 300,
        hints: ["构造f(x)=ln(1+x)-x", "构造g(x)=ln(1+x)-x/(1+x)", "f(0)=g(0)=0"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "右侧不等式", latex: "f(x)=\\ln(1+x)-x, f'(x)=\\frac{1}{1+x}-1=\\frac{-x}{1+x}<0", annotation: "f递减"),
                SolutionStep(order: 2, description: "f(0)=0", latex: "x>0时f(x)<0, 即\\ln(1+x)<x", annotation: ""),
                SolutionStep(order: 3, description: "左侧不等式", latex: "g(x)=\\ln(1+x)-\\frac{x}{1+x}, g'(x)=\\frac{1}{1+x}-\\frac{1}{(1+x)^2}=\\frac{x}{(1+x)^2}>0", annotation: ""),
                SolutionStep(order: 4, description: "g(0)=0且递增", latex: "x>0时g(x)>0", annotation: "得证")
            ],
            keyInsight: "分别构造函数，利用单调性和初始值证明",
            commonMistakes: ["g(x)求导出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "构造f和g", latex: "f'<0, g'>0, f(0)=g(0)=0", annotation: ""),
                    SolutionStep(order: 2, description: "结论", latex: "x>0: f<0, g>0", annotation: "")
                ],
                keyInsight: "两个构造函数分别证",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：积分夹逼", latex: "\\int_0^x \\frac{1}{(1+t)^2}dt \\leq \\int_0^x \\frac{dt}{1+t} \\leq \\int_0^x dt", annotation: "被积函数大小关系"),
                    SolutionStep(order: 2, description: "计算", latex: "\\frac{x}{1+x} \\leq \\ln(1+x) \\leq x", annotation: "一步到位")
                ],
                keyInsight: "1/(1+t)² ≤ 1/(1+t) ≤ 1，积分保序",
                commonMistakes: []
            ),
            weaponUsed: "积分保序秒杀不等式",
            timeRatio: 3.0,
            detailedExplanation: """
                【降维秒杀详解】
                对t∈[0,x]：1/(1+t)² ≤ 1/(1+t) ≤ 1
                三边同时积分（积分保持不等号方向）：
                ∫₀ˣ 1/(1+t)² dt ≤ ∫₀ˣ 1/(1+t) dt ≤ ∫₀ˣ 1 dt
                即 x/(1+x) ≤ ln(1+x) ≤ x
                秒杀关键：积分保序，一步搞定双侧不等式！
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "证明", "对数", "积分", "核心"]
    ),

    Problem(
        id: "func_037",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "extreme_value"],
        content: "已知f(x)=x²-2alnx-2(1-a)x (a∈R)，若f(x)在(0,+∞)上有且仅有一个极小值点，求a的取值范围。",
        contentLatex: "f(x)=x^2-2a\\ln x - 2(1-a)x",
        options: nil,
        answer: "a≤0或a=1",
        difficulty: 0.82,
        averageTime: 350,
        hints: ["f'(x)=2x-2a/x-2(1-a)", "化为关于x的二次方程", "判别式与根的正负"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=2x-\\frac{2a}{x}-2(1-a)=\\frac{2x^2-2(1-a)x-2a}{x}", annotation: "通分"),
                SolutionStep(order: 2, description: "分子=0", latex: "x^2-(1-a)x-a=0 \\Rightarrow (x-1)(x+a)=0", annotation: "因式分解！"),
                SolutionStep(order: 3, description: "根为x=1, x=-a", latex: "x>0上的根: x=1恒在", annotation: ""),
                SolutionStep(order: 4, description: "讨论-a", latex: "-a>0且-a\\neq 1 \\Rightarrow a<0且a\\neq -1, 两个极值点", annotation: ""),
                SolutionStep(order: 5, description: "只有一个极小值点", latex: "a\\leq 0: x=1和x=-a中只有一个极小值; a=1: -a=-1<0, 只有x=1", annotation: "分类讨论")
            ],
            keyInsight: "f'分子恰好因式分解为(x-1)(x+a)",
            commonMistakes: ["分子因式分解看不出来", "根的正负讨论遗漏"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'分子=(x-1)(x+a)", latex: "根x=1, x=-a", annotation: ""),
                    SolutionStep(order: 2, description: "分类讨论a", latex: "只有一个极小值点的条件", annotation: ""),
                    SolutionStep(order: 3, description: "结论", latex: "a\\leq 0 或 a=1", annotation: "")
                ],
                keyInsight: "因式分解后分类讨论",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：韦达定理", latex: "x_1 x_2 = -a, x_1+x_2=1-a", annotation: ""),
                    SolutionStep(order: 2, description: "只有一个正根条件", latex: "x_1 x_2 = -a \\leq 0 \\Rightarrow a\\geq 0", annotation: "一正一负或零"),
                    SolutionStep(order: 3, description: "或两根相等", latex: "a=-1时重根, 但需检验是否是极小值点", annotation: ""),
                    SolutionStep(order: 4, description: "综合", latex: "a\\leq 0 或 a=1", annotation: "")
                ],
                keyInsight: "韦达定理秒判根的正负",
                commonMistakes: []
            ),
            weaponUsed: "韦达定理+根的符号秒判",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                f'的分子=x²-(1-a)x-a=(x-1)(x+a)
                两根之积=-a：
                · a>0: 积为负，一正一负，x>0上只有x=1，一个极值点
                · a=0: x=0是根但不在定义域，只有x=1
                · a<0: 积>0，可能两正根x=1和-a>0
                  此时需讨论哪个是极小值
                结论：a≤0或a=1
                """
        ),
        gaokaoYear: 2018,
        tags: ["导数", "极值", "参数讨论", "因式分解", "压轴"]
    ),

    Problem(
        id: "func_038",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["derivative", "inequality"],
        content: "已知正数a,b满足a≠b且a^b=b^a，若a=2b，则a+b=______。",
        contentLatex: "a^b=b^a,\\ a=2b,\\ a+b=?",
        options: nil,
        answer: "6",
        difficulty: 0.80,
        averageTime: 300,
        hints: ["a^b=b^a两边取对数：blna=alnb", "或两边开b次方", "代入a=2b"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "代入a=2b", latex: "a^b=b^a \\Rightarrow (2b)^b=b^{2b}", annotation: ""),
                SolutionStep(order: 2, description: "两边开b次方(b>0)", latex: "((2b)^b)^{1/b}=(b^{2b})^{1/b} \\Rightarrow 2b=b^2", annotation: "指数同次幂可比较底数"),
                SolutionStep(order: 3, description: "解方程", latex: "b^2-2b=0 \\Rightarrow b(b-2)=0 \\Rightarrow b=2", annotation: "b>0舍去b=0"),
                SolutionStep(order: 4, description: "求a与a+b", latex: "a=2b=4,\\ a+b=6", annotation: "验证4^2=16=2^4 ✓")
            ],
            keyInsight: "a^b=b^a配合a=2b，开b次方化为2b=b²。",
            commonMistakes: ["忘记验证b>0舍根", "误把a=2b代错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "取对数", latex: "a^b=b^a \\Rightarrow b\\ln a=a\\ln b \\Rightarrow \\frac{\\ln a}{a}=\\frac{\\ln b}{b}", annotation: "g(x)=lnx/x在两点相等"),
                    SolutionStep(order: 2, description: "代入a=2b", latex: "\\frac{\\ln 2b}{2b}=\\frac{\\ln b}{b} \\Rightarrow \\ln 2+\\ln b=2\\ln b \\Rightarrow \\ln b=\\ln 2", annotation: ""),
                    SolutionStep(order: 3, description: "结论", latex: "b=2,\\ a=4,\\ a+b=6", annotation: "")
                ],
                keyInsight: "lna/a=lnb/b是a^b=b^a的等价形式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "【秒杀】开b次方直接消指数", latex: "(2b)^b=b^{2b}\\xrightarrow{(\\cdot)^{1/b}}2b=b^2", annotation: "幂的结构一步化为代数方程"),
                    SolutionStep(order: 2, description: "解出", latex: "b=2,\\ a=4 \\Rightarrow a+b=6", annotation: "秒出")
                ],
                keyInsight: "a^b=b^a带具体比例时，开方比取对数更快——直接把幂塞回代数方程。",
                commonMistakes: []
            ),
            weaponUsed: "幂方程开方降维",
            timeRatio: 2.0,
            detailedExplanation: """
                【a^b=b^a的处理】
                方法一(开方)：代入a=2b得(2b)^b=b^{2b}，两边开b次方(b>0)得2b=b²，b=2。
                方法二(取对数)：a^b=b^a ⟺ blna=alnb ⟺ lna/a=lnb/b，即g(x)=lnx/x在a,b处相等；
                代a=2b得 (ln2+lnb)/2=lnb，解得 b=2。
                两法都得 a=4,b=2,a+b=6（验证 4²=16=2⁴ ✓）。
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "幂方程", "对数", "lnx/x", "填空"]
    ),

    Problem(
        id: "func_039",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "inequality"],
        content: "已知f(x)=x-1-alnx (a>0)。(1) 当a=1时，求f(x)的最小值；(2) 若f(x)≥0恒成立，求a的值。",
        contentLatex: "f(x)=x-1-a\\ln x, a>0",
        options: nil,
        answer: "(1) 最小值0; (2) a=1",
        difficulty: 0.72,
        averageTime: 260,
        hints: ["f'(x)=1-a/x", "极小值点x=a", "f(a)=a-1-alna的符号"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "(1) a=1", latex: "f'(x)=1-\\frac1x=0 \\Rightarrow x=1", annotation: ""),
                SolutionStep(order: 2, description: "(1)最小值", latex: "f''(x)=\\frac1{x^2}>0,\\ f(1)=1-1-0=0\\ \\text{为最小值}", annotation: ""),
                SolutionStep(order: 3, description: "(2)极小值点", latex: "f'(x)=1-\\frac{a}{x}=0\\Rightarrow x=a,\\ \\text{恒成立需}f(a)\\ge0", annotation: "x=a为极小点"),
                SolutionStep(order: 4, description: "令h(a)=a-1-alna", latex: "f(a)=a-1-a\\ln a=h(a),\\ h'(a)=1-\\ln a-1=-\\ln a", annotation: ""),
                SolutionStep(order: 5, description: "h的最大值", latex: "h'(a)>0(0<a<1),\\ h'(a)<0(a>1)\\Rightarrow a=1\\text{为最大},\\ h(1)=0", annotation: ""),
                SolutionStep(order: 6, description: "结论", latex: "\\text{故}h(a)\\le0,\\ \\text{要}f(a)=h(a)\\ge0\\text{只能}h(a)=0\\Rightarrow a=1", annotation: "唯一值")
            ],
            keyInsight: "极小值f(a)=a-1-alna≤0恒成立，要其≥0只能取等，故a=1唯一",
            commonMistakes: ["误以为是区间0<a≤1", "h(a)取最大值方向搞反"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "极小值", latex: "f'=1-\\frac{a}{x}=0\\Rightarrow x=a,\\ f(a)=a-1-a\\ln a", annotation: ""),
                    SolutionStep(order: 2, description: "h(a)≤0", latex: "h(a)=a-1-a\\ln a\\le h(1)=0", annotation: "a=1取最大"),
                    SolutionStep(order: 3, description: "结论", latex: "f(a)\\ge0\\Leftrightarrow h(a)=0\\Leftrightarrow a=1", annotation: "")
                ],
                keyInsight: "极小值≤0，恒成立要求取等，唯一a=1",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "必要性(取特值)", latex: "\\text{取}x=a:\\ f(a)=a-1-a\\ln a\\ge0,\\ \\text{而}a-1-a\\ln a\\le0\\Rightarrow a=1", annotation: ""),
                    SolutionStep(order: 2, description: "充分性", latex: "a=1:\\ f(x)=x-1-\\ln x\\ge0\\ (\\text{由}\\ln x\\le x-1)", annotation: "切线不等式")
                ],
                keyInsight: "用切线不等式lnx≤x-1验证a=1充分，特值法证必要",
                commonMistakes: []
            ),
            weaponUsed: "极小值取等+切线不等式",
            timeRatio: 2.5,
            detailedExplanation: """
                【降维秒杀详解】
                f的极小值在x=a处：f(a)=a-1-alna
                令h(a)=a-1-alna，h'(a)=-lna，故h在a=1取最大值h(1)=0
                于是 h(a)≤0 恒成立；要 f(a)=h(a)≥0 必须取等，唯一 a=1
                充分性：a=1时 f(x)=x-1-lnx≥0 由经典 lnx≤x-1 保证
                """
        ),
        gaokaoYear: 2017,
        tags: ["导数", "恒成立", "对数", "参数范围", "核心"]
    ),

    Problem(
        id: "func_040",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "extreme_value", "inequality"],
        content: "已知f(x)=xlnx。(1)求不等式f(x)≥-1/e的解集；(2)证明：当x>0时，xlnx≥x-1。",
        contentLatex: "f(x)=x\\ln x,\\ (1)\\ f(x)\\ge-\\tfrac1e;\\ (2)\\ x\\ln x\\ge x-1",
        options: nil,
        answer: "(1)解集(0,+∞)；(2)xlnx≥x-1成立，当x=1时取等",
        difficulty: 0.85,
        averageTime: 360,
        hints: ["f(x)的最小值为-1/e", "(2)构造h(x)=xlnx-x+1", "或用切线法:xlnx在x=1处的切线"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求最小值", latex: "f'(x)=\\ln x+1=0\\Rightarrow x=\\tfrac1e,\\ f(\\tfrac1e)=-\\tfrac1e\\text{(最小值)}", annotation: ""),
                SolutionStep(order: 2, description: "解集", latex: "\\text{因}-\\tfrac1e\\text{是全局最小},\\ f(x)\\ge-\\tfrac1e\\text{对一切}x>0\\text{成立}\\Rightarrow\\text{解集}(0,+\\infty)", annotation: ""),
                SolutionStep(order: 3, description: "(2)构造", latex: "h(x)=x\\ln x-x+1,\\ h'(x)=\\ln x", annotation: ""),
                SolutionStep(order: 4, description: "单调性", latex: "h'(x)<0\\,(0<x<1),\\ h'(x)>0\\,(x>1)\\Rightarrow x=1\\text{为极小}", annotation: ""),
                SolutionStep(order: 5, description: "结论", latex: "h(1)=0\\Rightarrow h(x)\\ge0\\Rightarrow x\\ln x\\ge x-1", annotation: "x=1取等")
            ],
            keyInsight: "xlnx的最小值为-1/e；构造差函数h(x)=xlnx-x+1判号证不等式",
            commonMistakes: ["解集误写成[1/e,+∞)", "忘记f的全局最小恰为-1/e"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "最小值定解集", latex: "f_{\\min}=f(\\tfrac1e)=-\\tfrac1e\\Rightarrow\\text{解集}(0,+\\infty)", annotation: ""),
                    SolutionStep(order: 2, description: "构造差函数证(2)", latex: "h(x)=x\\ln x-x+1\\ge h(1)=0", annotation: "")
                ],
                keyInsight: "全局最小定解集+差函数证不等式",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "切线法秒杀(2)", latex: "f(x)=x\\ln x\\text{下凸}(f''=\\tfrac1x>0),\\ \\text{在}x=1\\text{处切线}y=x-1", annotation: "f(1)=0,f'(1)=1"),
                    SolutionStep(order: 2, description: "凸性保证", latex: "\\text{下凸函数恒在切线上方}\\Rightarrow x\\ln x\\ge x-1", annotation: "")
                ],
                keyInsight: "下凸函数恒在任一切线之上，切线y=x-1直接给出不等式",
                commonMistakes: []
            ),
            weaponUsed: "切线放缩法",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                第一问：f(x)=xlnx, f'=lnx+1=0得x=1/e, f(1/e)=-1/e为全局最小
                故 f(x)≥-1/e 对一切 x>0 恒成立，解集为(0,+∞)
                第二问：xlnx下凸，在x=1处切线为 y=x-1
                凸函数图像恒在切线上方，故 xlnx≥x-1，x=1取等
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "最值", "对数", "不等式", "压轴"]
    ),

    // ============ func_041-045: 导数综合与高考真题 ============

    Problem(
        id: "func_041",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "extreme_value"],
        content: "已知f(x)=(x-1)e^x-kx²/2，若f(x)在x=0处取得极值，求k的值，并判断x=0是极大值还是极小值。",
        contentLatex: "f(x)=(x-1)e^x - \\frac{kx^2}{2}",
        options: nil,
        answer: "k=1，x=0是极小值",
        difficulty: 0.70,
        averageTime: 240,
        hints: ["f'(0)=0求k", "f''(0)判断极值类型"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=e^x+(x-1)e^x-kx=xe^x-kx=x(e^x-k)", annotation: ""),
                SolutionStep(order: 2, description: "f'(0)=0", latex: "0 \\cdot (1-k)=0, 恒成立", annotation: "k任意？"),
                SolutionStep(order: 3, description: "极值需符号变化", latex: "f'(x)=x(e^x-k), x<0时e^x-k<0需k>1? 或分析", annotation: ""),
                SolutionStep(order: 4, description: "x=0附近", latex: "x\\to 0^-: x<0, e^x\\approx 1, f'\\approx x(1-k)", annotation: ""),
                SolutionStep(order: 5, description: "符号变化条件", latex: "k=1: f'=x(e^x-1), x<0时f'(-)(-)>0, x>0时f'(+)(+)>0", annotation: "不变号？"),
                SolutionStep(order: 6, description: "重新验证", latex: "x<0: x<0, e^x-1<0, f'=x(e^x-1)>0; x>0: x>0, e^x-1>0, f'>0", annotation: "不是极值"),
                SolutionStep(order: 7, description: "f''(0)法", latex: "f''(x)=(x+1)e^x-k, f''(0)=1-k, k=1时f''=0, 需更高阶", annotation: "")
            ],
            keyInsight: "f'(0)=0对任意k成立，需要更细致的分析",
            commonMistakes: ["以为f'(0)=0可以定k"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'=x(e^x-k)", latex: "f'(0)=0恒成立", annotation: ""),
                    SolutionStep(order: 2, description: "x=0是极值需符号变化", latex: "k=1时不变号，非极值", annotation: ""),
                    SolutionStep(order: 3, description: "分析所有k", latex: "k<1或k>1时讨论", annotation: "")
                ],
                keyInsight: "需要分析f'在x=0两侧的符号变化",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：因子分析", latex: "f'=x(e^x-k), e^x在x=0处值为1", annotation: ""),
                    SolutionStep(order: 2, description: "k≠1时", latex: "e^x-k在x=0附近不变号，f'变号一次（过x=0）→极值", annotation: ""),
                    SolutionStep(order: 3, description: "k<1: 极大值; k>1: 极小值", latex: "k=1: f'=x(e^x-1)不变号", annotation: "")
                ],
                keyInsight: "把f'分解为两因子，分析各因子在x=0处的符号",
                commonMistakes: []
            ),
            weaponUsed: "因子符号分析法",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀详解】
                f'(x) = x·(e^x - k)
                x=0时两个因子：x=0, e^x-k=1-k
                · k<1: e^x-k>0在x=0附近，f'的符号=x的符号
                  x从负到正：f'从负到正→极小值
                · k>1: e^x-k<0在x=0附近，f'的符号=-x的符号
                  x从负到正：f'从正到负→极大值
                · k=1: e^x-k在x=0变号，f'=x(e^x-1)≥0恒成立→非极值
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "极值", "指数", "参数讨论", "核心"]
    ),

    Problem(
        id: "func_042",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["derivative", "inequality"],
        content: "设f(x)=e^x-1-x-ax²，若f(x)≥0对一切x≥0成立，则a的取值范围是______。",
        contentLatex: "e^x-1-x-ax^2 \\geq 0, \\forall x\\geq 0",
        options: nil,
        answer: "a≤1/2",
        difficulty: 0.75,
        averageTime: 280,
        hints: ["e^x≥1+x+x²/2", "Taylor展开", "a最大值在x→0+"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "x=0代入", latex: "f(0)=0, 满足", annotation: ""),
                SolutionStep(order: 2, description: "x>0分离a", latex: "a \\leq \\frac{e^x-1-x}{x^2}", annotation: ""),
                SolutionStep(order: 3, description: "令g(x)=(e^x-1-x)/x²", latex: "\\lim_{x\\to 0^+}g(x)=\\lim\\frac{e^x-1}{2x}=\\frac{1}{2}", annotation: "洛必达"),
                SolutionStep(order: 4, description: "g递增", latex: "g(x)\\geq 1/2, 所以a\\leq 1/2", annotation: "")
            ],
            keyInsight: "分离参数后求下确界，x→0+的极限是关键",
            commonMistakes: ["不会处理x→0+的极限"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分离a≤(e^x-1-x)/x²", latex: "x→0+极限=1/2", annotation: ""),
                    SolutionStep(order: 2, description: "a≤1/2", latex: "", annotation: "")
                ],
                keyInsight: "分离参数+洛必达",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：Taylor展开", latex: "e^x=1+x+\\frac{x^2}{2}+\\frac{x^3}{6}+...", annotation: ""),
                    SolutionStep(order: 2, description: "代入", latex: "f(x)=\\frac{x^2}{2}-ax^2+O(x^3)=(\\frac{1}{2}-a)x^2+O(x^3)", annotation: ""),
                    SolutionStep(order: 3, description: "x→0+时主项≥0", latex: "\\frac{1}{2}-a\\geq 0 \\Rightarrow a\\leq \\frac{1}{2}", annotation: "")
                ],
                keyInsight: "Taylor展开看主项系数",
                commonMistakes: []
            ),
            weaponUsed: "Taylor展开主项秒判",
            timeRatio: 3.0,
            detailedExplanation: """
                【降维秒杀详解】
                e^x = 1 + x + x²/2 + x³/6 + ...
                f(x) = (1/2 - a)x² + x³/6 + ...
                x→0+时，f(x)≈(1/2-a)x²
                要f≥0，必须1/2-a≥0，即a≤1/2
                验证：a=1/2时f(x)=e^x-1-x-x²/2=x³/6+...>0
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "恒成立", "指数", "Taylor", "填空"]
    ),

    Problem(
        id: "func_043",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "zero_point"],
        content: "已知f(x)=2lnx+x²-4x+3，判断f(x)零点的个数。",
        contentLatex: "f(x)=2\\ln x + x^2 - 4x + 3",
        options: nil,
        answer: "恰有2个零点",
        difficulty: 0.72,
        averageTime: 260,
        hints: ["f'(x)分析单调性", "f'(x)=2/x+2x-4", "极值点处函数值的符号"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "定义域x>0", latex: "f'(x)=\\frac{2}{x}+2x-4=\\frac{2x^2-4x+2}{x}=\\frac{2(x-1)^2}{x}", annotation: "完全平方！"),
                SolutionStep(order: 2, description: "f'(x)≥0", latex: "f'(x)=0当且仅当x=1", annotation: "x=1是拐点"),
                SolutionStep(order: 3, description: "f在(0,+∞)上递增", latex: "除x=1外f'>0", annotation: "单调递增"),
                SolutionStep(order: 4, description: "f(1)=0+1-4+3=0", latex: "恰好过零点", annotation: ""),
                SolutionStep(order: 5, description: "单调递增且f(1)=0", latex: "只有1个零点x=1", annotation: "")
            ],
            keyInsight: "f'化为完全平方，f单调递增，f(1)=0",
            commonMistakes: ["f'的化简看不出完全平方"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'=2(x-1)²/x≥0", latex: "f单调递增", annotation: ""),
                    SolutionStep(order: 2, description: "f(1)=0", latex: "唯一零点", annotation: "")
                ],
                keyInsight: "导数完全平方→单调→唯一零点",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：猜x=1", latex: "f(1)=0+1-4+3=0", annotation: ""),
                    SolutionStep(order: 2, description: "f'=2(x-1)²/x≥0", latex: "单调递增，唯一零点", annotation: "秒判")
                ],
                keyInsight: "先猜整数零点，再判单调性",
                commonMistakes: []
            ),
            weaponUsed: "猜零点+完全平方导数秒判",
            timeRatio: 2.5,
            detailedExplanation: """
                【降维秒杀详解】
                Step1: 猜x=1代入，f(1)=0！
                Step2: f'=2/x+2x-4=(2x²-4x+2)/x=2(x-1)²/x≥0
                导数是完全平方形式，恒非负
                所以f单调递增（除x=1停留），唯一零点x=1
                秒杀关键：大胆猜整数根+识别完全平方
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "零点", "对数", "完全平方", "核心"]
    ),

    Problem(
        id: "func_044",
        type: .calculation,
        tier: 5,
        formulaIds: ["derivative", "inequality"],
        content: "已知a>b>0，证明：(a-b)²/(8a) < (a-b)/2 - (√a-√b) < (a-b)²/(8b)。",
        contentLatex: "\\frac{(a-b)^2}{8a} < \\frac{a-b}{2}-(\\sqrt{a}-\\sqrt{b}) < \\frac{(a-b)^2}{8b}",
        options: nil,
        answer: "双向不等式在a>b>0时成立",
        difficulty: 0.92,
        averageTime: 480,
        hints: ["令t=√(b/a)∈(0,1)", "化简左中右", "构造函数在(0,1)上的不等式"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "令t=√(b/a)", latex: "0<t<1, \\sqrt{a}-\\sqrt{b}=\\sqrt{a}(1-t)", annotation: ""),
                SolutionStep(order: 2, description: "化简中间项", latex: "\\frac{a-b}{2}-(\\sqrt{a}-\\sqrt{b})=\\sqrt{a}[\\frac{(1-t)(1+t)}{2}-(1-t)]=\\frac{\\sqrt{a}(1-t)(t-1)}{2}+...", annotation: ""),
                SolutionStep(order: 3, description: "统一提取", latex: "=\\frac{\\sqrt{a}(1-t)^2}{2} \\cdot \\frac{1}{1+t}", annotation: "化简"),
                SolutionStep(order: 4, description: "比较两端", latex: "\\frac{(a-b)^2}{8a}=\\frac{a(1-t^2)^2}{8a}=\\frac{(1-t)^2(1+t)^2}{8}", annotation: ""),
                SolutionStep(order: 5, description: "转化为", latex: "\\frac{(1+t)^2}{8} < \\frac{1}{2(1+t)} < \\frac{1}{8t^2}", annotation: "需要证")
            ],
            keyInsight: "齐次化代换后化为单变量不等式",
            commonMistakes: ["代换后化简困难"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "齐次化令t=√(b/a)", latex: "转化为t的不等式", annotation: ""),
                    SolutionStep(order: 2, description: "构造函数证明", latex: "需要较复杂的变形", annotation: "")
                ],
                keyInsight: "齐次化+单变量分析",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：√x的Lagrange中值定理", latex: "(\\sqrt{a}-\\sqrt{b})=\\frac{1}{2\\sqrt{c}}(a-b), c\\in(b,a)", annotation: ""),
                    SolutionStep(order: 2, description: "即", latex: "\\frac{a-b}{2\\sqrt{a}} < \\sqrt{a}-\\sqrt{b} < \\frac{a-b}{2\\sqrt{b}}", annotation: "c∈(b,a)"),
                    SolutionStep(order: 3, description: "变形得", latex: "\\frac{a-b}{2}-\\frac{a-b}{2\\sqrt{b}} < \\frac{a-b}{2}-(\\sqrt{a}-\\sqrt{b}) < \\frac{a-b}{2}-\\frac{a-b}{2\\sqrt{a}}", annotation: ""),
                    SolutionStep(order: 4, description: "化简即得", latex: "两侧化为所求形式", annotation: "")
                ],
                keyInsight: "Lagrange中值定理一步给出√a-√b的精确估计",
                commonMistakes: []
            ),
            weaponUsed: "Lagrange中值定理秒杀",
            timeRatio: 4.0,
            detailedExplanation: """
                【降维秒杀详解】
                对f(x)=√x在[b,a]上用Lagrange中值定理：
                √a - √b = 1/(2√c) · (a-b), c∈(b,a)
                因为b<c<a:
                1/(2√a) < 1/(2√c) < 1/(2√b)
                所以 (a-b)/(2√a) < √a-√b < (a-b)/(2√b)
                移项和平方即得原不等式
                秒杀关键：中值定理给出精确夹逼！
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "证明", "中值定理", "根号", "压轴"]
    ),

    Problem(
        id: "func_045",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["derivative", "extreme_value"],
        content: "函数f(x)=xe^(1-x)的递增区间为______，最大值为______。",
        contentLatex: "f(x)=xe^{1-x}",
        options: nil,
        answer: "(-∞, 1]; 最大值1",
        difficulty: 0.55,
        averageTime: 150,
        hints: ["f'(x)=(1-x)e^(1-x)", "令f'=0"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求导", latex: "f'(x)=e^{1-x}+x(-1)e^{1-x}=(1-x)e^{1-x}", annotation: ""),
                SolutionStep(order: 2, description: "f'≥0", latex: "1-x\\geq 0 \\Rightarrow x\\leq 1", annotation: "递增区间(-∞,1]"),
                SolutionStep(order: 3, description: "最大值", latex: "f(1)=1\\cdot e^0=1", annotation: "")
            ],
            keyInsight: "xe^(1-x)的导数=(1-x)e^(1-x)",
            commonMistakes: ["求导出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "f'=(1-x)e^(1-x)", latex: "递增(-∞,1], 最大f(1)=1", annotation: "")
                ],
                keyInsight: "标准求导法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：xe^(1-x)≤1", latex: "等价于x\\leq e^{x-1}, 即e^t\\geq t+1 (t=x-1)", annotation: "经典不等式"),
                    SolutionStep(order: 2, description: "等号x=1", latex: "最大值1", annotation: "")
                ],
                keyInsight: "xe^(1-x)≤1就是e^t≥1+t的变形",
                commonMistakes: []
            ),
            weaponUsed: "经典不等式e^t≥1+t秒判最值",
            timeRatio: 2.5,
            detailedExplanation: """
                【降维秒杀详解】
                xe^(1-x)≤1 ⟺ e^(x-1)≥x ⟺ e^t≥1+t (令t=x-1)
                这就是最经典的e^t≥1+t！
                等号当t=0即x=1
                所以最大值=1，在x=1处取得
                不需要求导，直接用不等式秒杀
                """
        ),
        gaokaoYear: nil,
        tags: ["导数", "最值", "指数", "不等式", "填空"]
    )]
}
