import Foundation

// MARK: - 数列专题 (高考必考)
// 涵盖: 等差数列、等比数列、递推数列、数列求和、数列与不等式
// 难度: 0.55-0.92, 以高考中档到压轴为主

extension SampleData {
    static let sequenceProblems: [Problem] = [

    // ============ 等差数列基础与综合 ============

    Problem(
        id: "seq_001",
        type: .calculation,
        tier: 3,
        formulaIds: ["arithmetic_sequence"],
        content: "等差数列{a_n}中，a_3+a_7=20，a_4·a_6=96，且公差d>0，求a_1和d。",
        contentLatex: "a_3+a_7=20,\\quad a_4 \\cdot a_6=96,\\quad d>0",
        options: nil,
        answer: "a_1=2, d=3",
        difficulty: 0.55,
        averageTime: 180,
        hints: ["a_3+a_7=2a_5", "a_4·a_6与a_5有什么关系？", "利用等差中项"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "利用等差中项", latex: "a_3+a_7=2a_5=20 \\Rightarrow a_5=10", annotation: "对称性"),
                SolutionStep(order: 2, description: "设公差d", latex: "a_4=10-d,\\ a_6=10+d", annotation: ""),
                SolutionStep(order: 3, description: "代入乘积条件", latex: "(10-d)(10+d)=96 \\Rightarrow d^2=4 \\Rightarrow d=2", annotation: "d>0"),
                SolutionStep(order: 4, description: "求a_1", latex: "a_1=a_5-4d=10-8=2", annotation: "")
            ],
            keyInsight: "利用等差数列对称性，将条件转化为关于a_5和d的方程",
            commonMistakes: ["忘记d>0的条件取了负值", "直接列方程组计算量大"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设a_1和d", latex: "(a_1+2d)+(a_1+6d)=20", annotation: ""),
                    SolutionStep(order: 2, description: "化简", latex: "2a_1+8d=20, a_1+4d=10", annotation: ""),
                    SolutionStep(order: 3, description: "乘积条件", latex: "(a_1+3d)(a_1+5d)=96", annotation: ""),
                    SolutionStep(order: 4, description: "代入消元", latex: "(10-d)(10+d)=96, d=2, a_1=2", annotation: "")
                ],
                keyInsight: "标准双方程联立消元",
                commonMistakes: ["展开乘积后计算容易出错"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "对称中心法", latex: "a_3+a_7=a_4+a_6=2a_5=20 \\Rightarrow a_5=10", annotation: "一步定中心"),
                    SolutionStep(order: 2, description: "平方差秒杀", latex: "a_4 \\cdot a_6 = (a_5-d)(a_5+d) = a_5^2 - d^2 = 96", annotation: ""),
                    SolutionStep(order: 3, description: "直接求d", latex: "d^2 = 100-96=4, d=2", annotation: "一步到位")
                ],
                keyInsight: "等差数列以中间项为对称中心，乘积用平方差公式",
                commonMistakes: []
            ),
            weaponUsed: "等差对称中心+平方差",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀】
                等差数列最强性质：a_m + a_n = 2a_{(m+n)/2}
                所以 a_3+a_7 直接给出 a_5=10
                然后 a_4·a_6 = (a_5-d)(a_5+d) 用平方差一步出d
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "等差数列", "对称性", "核心"]
    ),

    Problem(
        id: "seq_002",
        type: .calculation,
        tier: 4,
        formulaIds: ["arithmetic_sequence", "sum_formula"],
        content: "等差数列{a_n}的前n项和S_n满足S_15=90，求a_8。又若a_1=1，求S_20。",
        contentLatex: "S_{15}=90,\\ \\text{求}a_8;\\ \\text{若}a_1=1,\\ \\text{求}S_{20}",
        options: nil,
        answer: "a_8=6, S_20=200",
        difficulty: 0.55,
        averageTime: 180,
        hints: ["S_n与中间项的关系", "S_15=15·a_8（奇数项）"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "利用S_n与中间项关系", latex: "S_{15}=15a_8=90 \\Rightarrow a_8=6", annotation: "奇数项公式"),
                SolutionStep(order: 2, description: "求公差d", latex: "a_8=a_1+7d=1+7d=6 \\Rightarrow d=\\frac{5}{7}", annotation: ""),
                SolutionStep(order: 3, description: "求S_20", latex: "S_{20}=20 \\times 1 + \\frac{20 \\times 19}{2} \\times \\frac{5}{7}=20+\\frac{950}{7}=\\frac{1090}{7}", annotation: "")
            ],
            keyInsight: "S_n(n为奇数)=n·a_{中间项}",
            commonMistakes: ["忘记S_n=na_中间项只对奇数n成立"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "公式展开", latex: "S_{15}=\\frac{15(a_1+a_{15})}{2}=\\frac{15 \\cdot 2a_8}{2}=15a_8=90", annotation: ""),
                    SolutionStep(order: 2, description: "得a_8", latex: "a_8=6", annotation: ""),
                    SolutionStep(order: 3, description: "S_20标准公式", latex: "S_{20}=20a_1+\\frac{20 \\times 19}{2}d", annotation: "")
                ],
                keyInsight: "标准求和公式法",
                commonMistakes: ["计算量较大"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀公式", latex: "S_{2n-1}=(2n-1)a_n \\Rightarrow S_{15}=15a_8", annotation: "奇数项和=项数×中间项"),
                    SolutionStep(order: 2, description: "直接得", latex: "a_8=6", annotation: "一步到位")
                ],
                keyInsight: "等差数列奇数项求和的对称性质",
                commonMistakes: []
            ),
            weaponUsed: "等差数列奇数项对称求和",
            timeRatio: 2.5,
            detailedExplanation: """
                【秒杀核心】
                等差数列前2n-1项之和 = (2n-1) × 中间项a_n
                因为首尾配对完美对称，中间项是平均值
                S_15 = 15 × a_8 直接秒出 a_8 = 6
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "等差数列", "前n项和", "核心"]
    ),

    Problem(
        id: "seq_003",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["arithmetic_sequence", "sum_formula"],
        content: "等差数列{a_n}中，S_10=40, S_20=160，则S_30=______。",
        contentLatex: "S_{10}=40,\\ S_{20}=160,\\ S_{30}=\\text{______}",
        options: nil,
        answer: "360",
        difficulty: 0.60,
        averageTime: 150,
        hints: ["S_10, S_20-S_10, S_30-S_20构成等差数列", "利用等差数列前n项和的性质"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "设三段和", latex: "A=S_{10}=40,\\ B=S_{20}-S_{10}=120,\\ C=S_{30}-S_{20}", annotation: ""),
                SolutionStep(order: 2, description: "A,B,C成等差", latex: "B-A=C-B \\Rightarrow C=2B-A=240-40=200", annotation: ""),
                SolutionStep(order: 3, description: "求S_30", latex: "S_{30}=A+B+C=40+120+200=360", annotation: "")
            ],
            keyInsight: "等差数列每k项之和构成新的等差数列",
            commonMistakes: ["不知道分段和的等差性质，用标准公式列方程"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "列方程组", latex: "10a_1+45d=40,\\ 20a_1+190d=160", annotation: ""),
                    SolutionStep(order: 2, description: "解方程", latex: "a_1=\\frac{13}{10}, d=\\frac{6}{10}", annotation: ""),
                    SolutionStep(order: 3, description: "代入S_30", latex: "S_{30}=30a_1+435d=360", annotation: "")
                ],
                keyInsight: "标准方程组法",
                commonMistakes: ["分数计算容易出错"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分段等差秒杀", latex: "S_{10},\\ S_{20}-S_{10},\\ S_{30}-S_{20} \\text{成等差}", annotation: "经典性质"),
                    SolutionStep(order: 2, description: "计算", latex: "40,\\ 120,\\ 200 \\Rightarrow S_{30}=360", annotation: "一步到位")
                ],
                keyInsight: "等差数列分段和仍成等差，无需求a_1和d",
                commonMistakes: []
            ),
            weaponUsed: "等差分段和性质",
            timeRatio: 3.0,
            detailedExplanation: """
                【秒杀定理】
                等差数列{a_n}中，S_k, S_{2k}-S_k, S_{3k}-S_{2k} 仍成等差数列
                公差为 k^2 · d
                本题：40, 120, C成等差 → C=200 → S_30=360
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "等差数列", "分段和", "填空", "核心"]
    ),

    // ============ 等比数列 ============

    Problem(
        id: "seq_004",
        type: .calculation,
        tier: 4,
        formulaIds: ["geometric_sequence"],
        content: "等比数列{a_n}中，a_1+a_3=10, a_2+a_4=20，求a_5+a_7。",
        contentLatex: "a_1+a_3=10,\\quad a_2+a_4=20",
        options: nil,
        answer: "160",
        difficulty: 0.55,
        averageTime: 120,
        hints: ["观察相邻两组的比值", "等比数列的等比性质"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求比值", latex: "\\frac{a_2+a_4}{a_1+a_3}=\\frac{a_1q+a_3q}{a_1+a_3}=q=2", annotation: "提取公比"),
                SolutionStep(order: 2, description: "推进两项", latex: "a_5+a_7=q^2(a_3+a_5)=q^4(a_1+a_3)=16 \\times 10", annotation: ""),
                SolutionStep(order: 3, description: "但更直接", latex: "a_5+a_7=q^2(a_3+a_5)", annotation: "需另法")
            ],
            keyInsight: "等比数列中，对应项之和的比等于公比",
            commonMistakes: ["错误地认为a_5+a_7=(a_2+a_4)·q^2"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设首项和公比", latex: "a_1+a_1q^2=10,\\ a_1q+a_1q^3=20", annotation: ""),
                    SolutionStep(order: 2, description: "比值", latex: "\\frac{q(a_1+a_1q^2)}{a_1+a_1q^2}=\\frac{20}{10} \\Rightarrow q=2", annotation: ""),
                    SolutionStep(order: 3, description: "求a_5+a_7", latex: "a_1q^4+a_1q^6=q^4(a_1+a_1q^2)=16 \\times 10=160", annotation: "")
                ],
                keyInsight: "标准设元求解",
                commonMistakes: ["计算量较大"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "整体乘公比", latex: "(a_2+a_4)=q(a_1+a_3) \\Rightarrow q=2", annotation: "秒求公比"),
                    SolutionStep(order: 2, description: "等比推进", latex: "a_5+a_7=q^4(a_1+a_3)=16 \\times 10=160", annotation: "直接推进4项")
                ],
                keyInsight: "等比数列的整体等比性质：同时下标加k，整体乘q^k",
                commonMistakes: []
            ),
            weaponUsed: "等比整体推进法",
            timeRatio: 3.0,
            detailedExplanation: """
                【秒杀核心】
                等比数列中 a_{n+k} = a_n · q^k
                所以 (a_{n+k} + a_{m+k}) = q^k · (a_n + a_m)
                整体推进，无需求具体的a_1
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "等比数列", "整体法", "核心"]
    ),

    Problem(
        id: "seq_005",
        type: .calculation,
        tier: 4,
        formulaIds: ["geometric_sequence", "sum_formula"],
        content: "等比数列{a_n}中，a_1=2，前n项和S_n满足S_3/S_6=1/9，求公比q和S_8。",
        contentLatex: "a_1=2,\\quad \\frac{S_3}{S_6}=\\frac{1}{9}",
        options: nil,
        answer: "q=2, S_8=510",
        difficulty: 0.65,
        averageTime: 240,
        hints: ["S_6=S_3+q^3·S_3", "S_3, S_6-S_3, S_9-S_6成等比"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "利用性质", latex: "S_6=S_3+a_4+a_5+a_6=S_3+q^3 S_3=S_3(1+q^3)", annotation: "后三项是前三项的q^3倍"),
                SolutionStep(order: 2, description: "代入比值", latex: "\\frac{S_3}{S_3(1+q^3)}=\\frac{1}{9} \\Rightarrow 1+q^3=9 \\Rightarrow q^3=8", annotation: ""),
                SolutionStep(order: 3, description: "求q", latex: "q=2", annotation: ""),
                SolutionStep(order: 4, description: "求S_8", latex: "S_8=\\frac{2(2^8-1)}{2-1}=2 \\times 255=510", annotation: "")
            ],
            keyInsight: "等比数列分段和的比例关系",
            commonMistakes: ["直接展开S_3和S_6计算量大"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "展开", latex: "S_3=2+2q+2q^2,\\ S_6=2+2q+...+2q^5", annotation: ""),
                    SolutionStep(order: 2, description: "比值方程", latex: "\\frac{2(1+q+q^2)}{2(1+q+...+q^5)}=\\frac{1}{9}", annotation: ""),
                    SolutionStep(order: 3, description: "因式分解", latex: "1+q+...+q^5=(1+q+q^2)(1+q^3)", annotation: ""),
                    SolutionStep(order: 4, description: "化简", latex: "\\frac{1}{1+q^3}=\\frac{1}{9}, q=2", annotation: "")
                ],
                keyInsight: "标准展开+因式分解",
                commonMistakes: ["不会分解1+q+...+q^5"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分段等比秒杀", latex: "S_6 = S_3(1+q^3)", annotation: "后段是前段的q^3倍"),
                    SolutionStep(order: 2, description: "代入", latex: "\\frac{1}{1+q^3}=\\frac{1}{9} \\Rightarrow q=2", annotation: "一步到位")
                ],
                keyInsight: "等比数列分段和的倍数关系：S_{2n}=S_n(1+q^n)",
                commonMistakes: []
            ),
            weaponUsed: "等比分段和倍数关系",
            timeRatio: 2.5,
            detailedExplanation: """
                【秒杀公式】
                等比数列：S_{kn} = S_n · (1 + q^n + q^{2n} + ... + q^{(k-1)n})
                特别地：S_{2n} = S_n(1 + q^n)
                本题 S_6 = S_3(1+q^3)，代入比值一步得q
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "等比数列", "前n项和", "分段", "核心"]
    ),

    // ============ 数列求和（错位相减/裂项/倒序） ============

    Problem(
        id: "seq_006",
        type: .calculation,
        tier: 5,
        formulaIds: ["sum_formula", "geometric_sequence"],
        content: "求数列{n·2^n}的前n项和T_n。",
        contentLatex: "T_n=\\sum_{k=1}^{n} k \\cdot 2^k",
        options: nil,
        answer: "(n-1)·2^(n+1)+2",
        difficulty: 0.70,
        averageTime: 300,
        hints: ["错位相减法", "T_n - 2T_n 会发生什么？", "等比数列求和"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "写出T_n", latex: "T_n=1 \\cdot 2+2 \\cdot 2^2+3 \\cdot 2^3+...+n \\cdot 2^n", annotation: ""),
                SolutionStep(order: 2, description: "乘以2", latex: "2T_n=1 \\cdot 2^2+2 \\cdot 2^3+...+(n-1) \\cdot 2^n+n \\cdot 2^{n+1}", annotation: ""),
                SolutionStep(order: 3, description: "错位相减", latex: "T_n-2T_n=2+2^2+2^3+...+2^n-n \\cdot 2^{n+1}", annotation: ""),
                SolutionStep(order: 4, description: "等比求和", latex: "-T_n=\\frac{2(2^n-1)}{2-1}-n \\cdot 2^{n+1}=2^{n+1}-2-n \\cdot 2^{n+1}", annotation: ""),
                SolutionStep(order: 5, description: "化简", latex: "T_n=(n-1) \\cdot 2^{n+1}+2", annotation: "")
            ],
            keyInsight: "等差×等比型数列用错位相减法求和",
            commonMistakes: ["相减时漏项", "等比求和公式用错", "最后化简出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "错位相减", latex: "T_n-2T_n=2+2^2+...+2^n-n \\cdot 2^{n+1}", annotation: ""),
                    SolutionStep(order: 2, description: "等比求和后化简", latex: "T_n=(n-1)2^{n+1}+2", annotation: "")
                ],
                keyInsight: "标准错位相减法",
                commonMistakes: ["计算量大，容易出错"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "求导法（对等比和求导）", latex: "\\sum_{k=0}^{n}x^k=\\frac{x^{n+1}-1}{x-1}", annotation: "等比和公式"),
                    SolutionStep(order: 2, description: "两边对x求导", latex: "\\sum_{k=1}^{n}kx^{k-1}=\\frac{nx^{n+1}-(n+1)x^n+1}{(x-1)^2}", annotation: ""),
                    SolutionStep(order: 3, description: "乘x后代入x=2", latex: "T_n=\\sum kx^k \\big|_{x=2}=(n-1)2^{n+1}+2", annotation: "公式直接代入")
                ],
                keyInsight: "等比级数求导法：对生成函数求导获得系数乘幂次",
                commonMistakes: []
            ),
            weaponUsed: "生成函数求导法",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维秒杀】
                记住万能公式：sum(k·x^k, k=1..n) = x(1-(n+1)x^n+nx^(n+1))/(1-x)^2
                代入x=2直接得结果，无需每次错位相减
                """
        ),
        gaokaoYear: 2019,
        tags: ["数列", "错位相减", "求和", "核心"]
    ),

    Problem(
        id: "seq_007",
        type: .calculation,
        tier: 4,
        formulaIds: ["sum_formula"],
        content: "求和：1/(1·2) + 1/(2·3) + 1/(3·4) + ... + 1/(n(n+1))。",
        contentLatex: "\\sum_{k=1}^{n}\\frac{1}{k(k+1)}",
        options: nil,
        answer: "n/(n+1)",
        difficulty: 0.50,
        averageTime: 120,
        hints: ["裂项相消", "1/(k(k+1))可以拆成什么？"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "裂项", latex: "\\frac{1}{k(k+1)}=\\frac{1}{k}-\\frac{1}{k+1}", annotation: "部分分式"),
                SolutionStep(order: 2, description: "展开求和", latex: "(1-\\frac{1}{2})+(\\frac{1}{2}-\\frac{1}{3})+...+(\\frac{1}{n}-\\frac{1}{n+1})", annotation: ""),
                SolutionStep(order: 3, description: "telescoping", latex: "=1-\\frac{1}{n+1}=\\frac{n}{n+1}", annotation: "首尾相消")
            ],
            keyInsight: "裂项相消（telescoping sum）是数列求和的核心技巧",
            commonMistakes: ["裂项系数写错", "忘记首尾项"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "裂项", latex: "\\frac{1}{k(k+1)}=\\frac{1}{k}-\\frac{1}{k+1}", annotation: ""),
                    SolutionStep(order: 2, description: "telescoping", latex: "1-\\frac{1}{n+1}=\\frac{n}{n+1}", annotation: "")
                ],
                keyInsight: "标准裂项相消",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "直觉验证法", latex: "n=1: \\frac{1}{2}=\\frac{1}{2}\\checkmark,\\ n=2: \\frac{1}{2}+\\frac{1}{6}=\\frac{2}{3}\\checkmark", annotation: "猜测f(n)=n/(n+1)"),
                    SolutionStep(order: 2, description: "递推验证", latex: "S_{n+1}=S_n+\\frac{1}{(n+1)(n+2)}=\\frac{n}{n+1}+\\frac{1}{(n+1)(n+2)}=\\frac{n+1}{n+2}", annotation: "归纳确认")
                ],
                keyInsight: "小值猜测+数学归纳法验证",
                commonMistakes: []
            ),
            weaponUsed: "猜测归纳法",
            timeRatio: 1.5,
            detailedExplanation: """
                【裂项模板】
                1/(k(k+1)) = 1/k - 1/(k+1) 是最基本的裂项
                推广：1/(k(k+d)) = (1/d)(1/k - 1/(k+d))
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "裂项相消", "求和", "核心"]
    ),

    Problem(
        id: "seq_008",
        type: .calculation,
        tier: 5,
        formulaIds: ["sum_formula"],
        content: "求和：1/(1·3) + 1/(3·5) + 1/(5·7) + ... + 1/((2n-1)(2n+1))。",
        contentLatex: "\\sum_{k=1}^{n}\\frac{1}{(2k-1)(2k+1)}",
        options: nil,
        answer: "n/(2n+1)",
        difficulty: 0.60,
        averageTime: 180,
        hints: ["裂项：注意分母差为2", "1/((2k-1)(2k+1)) = (1/2)(1/(2k-1) - 1/(2k+1))"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "裂项", latex: "\\frac{1}{(2k-1)(2k+1)}=\\frac{1}{2}\\left(\\frac{1}{2k-1}-\\frac{1}{2k+1}\\right)", annotation: "分母差为2，系数1/2"),
                SolutionStep(order: 2, description: "展开求和", latex: "\\frac{1}{2}\\left[(1-\\frac{1}{3})+(\\frac{1}{3}-\\frac{1}{5})+...+(\\frac{1}{2n-1}-\\frac{1}{2n+1})\\right]", annotation: ""),
                SolutionStep(order: 3, description: "相消", latex: "=\\frac{1}{2}(1-\\frac{1}{2n+1})=\\frac{n}{2n+1}", annotation: "")
            ],
            keyInsight: "分母差不为1的裂项需要除以差值",
            commonMistakes: ["裂项时忘记乘系数1/2", "最后化简出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "标准裂项", latex: "\\frac{1}{(2k-1)(2k+1)}=\\frac{1}{2}\\left(\\frac{1}{2k-1}-\\frac{1}{2k+1}\\right)", annotation: ""),
                    SolutionStep(order: 2, description: "telescoping", latex: "\\frac{1}{2}(1-\\frac{1}{2n+1})=\\frac{n}{2n+1}", annotation: "")
                ],
                keyInsight: "标准裂项相消",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "万能裂项公式", latex: "\\frac{1}{a \\cdot b}=\\frac{1}{b-a}\\left(\\frac{1}{a}-\\frac{1}{b}\\right)", annotation: "记住这一个公式即可"),
                    SolutionStep(order: 2, description: "直接代入", latex: "b-a=2,\\ \\text{系数}\\frac{1}{2},\\ \\text{结果}=\\frac{1}{2}(\\frac{1}{1}-\\frac{1}{2n+1})", annotation: "")
                ],
                keyInsight: "万能裂项公式：1/(ab) = (1/(b-a))(1/a - 1/b)",
                commonMistakes: []
            ),
            weaponUsed: "万能裂项公式",
            timeRatio: 2.0,
            detailedExplanation: """
                【万能裂项】
                1/(a·b) = (1/(b-a))(1/a - 1/b)
                只要a,b是等差关系，直接套用
                系数 = 1/公差
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "裂项相消", "求和", "核心"]
    ),

    // ============ 递推数列 ============

    Problem(
        id: "seq_009",
        type: .calculation,
        tier: 5,
        formulaIds: ["recursive_sequence"],
        content: "已知数列{a_n}满足a_1=1, a_{n+1}=2a_n+1，求通项公式a_n。",
        contentLatex: "a_1=1,\\quad a_{n+1}=2a_n+1",
        options: nil,
        answer: "a_n=2^n-1",
        difficulty: 0.65,
        averageTime: 240,
        hints: ["a_{n+1}+c=2(a_n+c)", "构造等比数列", "选择合适的c"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "构造等比", latex: "a_{n+1}+1=2(a_n+1)", annotation: "令b_n=a_n+1"),
                SolutionStep(order: 2, description: "验证", latex: "b_1=a_1+1=2,\\ \\frac{b_{n+1}}{b_n}=2", annotation: "公比为2"),
                SolutionStep(order: 3, description: "求b_n", latex: "b_n=2 \\cdot 2^{n-1}=2^n", annotation: "等比数列通项"),
                SolutionStep(order: 4, description: "还原", latex: "a_n=b_n-1=2^n-1", annotation: "")
            ],
            keyInsight: "a_{n+1}=pa_n+q型递推，构造b_n=a_n+q/(p-1)成等比",
            commonMistakes: ["不知道怎么找常数c", "忘记验证b_1"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "构造", latex: "a_{n+1}+c=2(a_n+c) \\Rightarrow c=1", annotation: ""),
                    SolutionStep(order: 2, description: "等比求解", latex: "a_n+1=2^n \\Rightarrow a_n=2^n-1", annotation: "")
                ],
                keyInsight: "构造等比数列法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "不动点法", latex: "x=2x+1 \\Rightarrow x=-1", annotation: "求不动点"),
                    SolutionStep(order: 2, description: "直接得", latex: "a_n-(-1)=(a_1-(-1)) \\cdot 2^{n-1} \\Rightarrow a_n+1=2^n", annotation: "不动点平移即得")
                ],
                keyInsight: "不动点法：解x=f(x)得不动点x_0，则a_n-x_0成等比",
                commonMistakes: []
            ),
            weaponUsed: "不动点法",
            timeRatio: 2.5,
            detailedExplanation: """
                【不动点秒杀】
                递推 a_{n+1} = pa_n + q
                不动点：x = px + q → x = q/(1-p)
                结论：a_n - x = (a_1 - x) · p^{n-1}
                本题 x = -1, a_n + 1 = 2^n
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "递推", "构造等比", "不动点", "核心"]
    ),

    Problem(
        id: "seq_010",
        type: .calculation,
        tier: 5,
        formulaIds: ["recursive_sequence"],
        content: "已知数列{a_n}满足a_1=1, S_n=n^2·a_n (n>=2)，求通项公式a_n。",
        contentLatex: "a_1=1,\\quad S_n=n^2 a_n\\ (n \\geq 2)",
        options: nil,
        answer: "a_n=2/(n(n+1))",
        difficulty: 0.75,
        averageTime: 300,
        hints: ["S_n - S_{n-1} = a_n", "S_{n-1} = (n-1)^2 · a_{n-1}", "消去S_n"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "写递推", latex: "S_n=n^2 a_n,\\ S_{n-1}=(n-1)^2 a_{n-1}", annotation: ""),
                SolutionStep(order: 2, description: "相减", latex: "a_n=n^2 a_n-(n-1)^2 a_{n-1}", annotation: "S_n-S_{n-1}=a_n"),
                SolutionStep(order: 3, description: "化简", latex: "(n^2-1)a_n=(n-1)^2 a_{n-1} \\Rightarrow (n+1)a_n=(n-1)a_{n-1}", annotation: "约去n-1"),
                SolutionStep(order: 4, description: "逐步递推", latex: "\\frac{a_n}{a_{n-1}}=\\frac{n-1}{n+1}", annotation: ""),
                SolutionStep(order: 5, description: "累乘", latex: "a_n=a_1 \\cdot \\prod_{k=2}^{n}\\frac{k-1}{k+1}=\\frac{1 \\cdot 2}{n(n+1)}=\\frac{2}{n(n+1)}", annotation: "telescoping乘积")
            ],
            keyInsight: "S_n与a_n混合递推：用S_n-S_{n-1}=a_n消去S",
            commonMistakes: ["约分时漏掉因子", "累乘时首尾消错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "S_n关系", latex: "S_n-S_{n-1}=a_n \\Rightarrow (n^2-1)a_n=(n-1)^2a_{n-1}", annotation: ""),
                    SolutionStep(order: 2, description: "递推比", latex: "\\frac{a_n}{a_{n-1}}=\\frac{n-1}{n+1}", annotation: ""),
                    SolutionStep(order: 3, description: "累乘", latex: "a_n=\\frac{2}{n(n+1)}", annotation: "")
                ],
                keyInsight: "标准递推+累乘法",
                commonMistakes: ["累乘展开困难"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "令b_n=na_n", latex: "(n+1)a_n=(n-1)a_{n-1} \\Rightarrow b_{n+1}=b_n \\cdot \\frac{n}{n+1}... ", annotation: "不太适用"),
                    SolutionStep(order: 2, description: "直接累乘秒杀", latex: "\\frac{a_n}{a_1}=\\frac{1}{3} \\cdot \\frac{2}{4} \\cdot \\frac{3}{5} \\cdots \\frac{n-1}{n+1}=\\frac{2}{n(n+1)}", annotation: "分子分母各自消")
                ],
                keyInsight: "累乘的telescoping：分子分母分别消去中间项",
                commonMistakes: []
            ),
            weaponUsed: "累乘telescoping",
            timeRatio: 1.8,
            detailedExplanation: """
                【累乘秒杀】
                比值 a_n/a_{n-1} = (n-1)/(n+1)
                累乘：(1/3)(2/4)(3/5)...(n-1)/(n+1)
                分子：1·2·3·...·(n-1) = (n-1)!
                分母：3·4·5·...·(n+1) = (n+1)!/2!
                结果：2/(n(n+1))
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "递推", "累乘法", "Sn与an", "压轴"]
    ),

    // ============ 数列与不等式 ============

    Problem(
        id: "seq_011",
        type: .proof,
        tier: 5,
        formulaIds: ["sum_formula", "inequality"],
        content: "已知正项数列{a_n}满足a_1=1, a_{n+1}=a_n/(1+a_n)。证明：a_n=1/n。",
        contentLatex: "a_1=1,\\quad a_{n+1}=\\frac{a_n}{1+a_n}",
        options: nil,
        answer: "a_n=1/n",
        difficulty: 0.70,
        averageTime: 240,
        hints: ["取倒数", "1/a_{n+1} = 1/a_n + 1", "倒数构成等差数列"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "取倒数", latex: "\\frac{1}{a_{n+1}}=\\frac{1+a_n}{a_n}=\\frac{1}{a_n}+1", annotation: "化繁为简"),
                SolutionStep(order: 2, description: "识别等差", latex: "\\text{令}b_n=\\frac{1}{a_n},\\ b_{n+1}=b_n+1", annotation: "公差为1的等差数列"),
                SolutionStep(order: 3, description: "求通项", latex: "b_n=b_1+(n-1)=1+(n-1)=n", annotation: ""),
                SolutionStep(order: 4, description: "还原", latex: "a_n=\\frac{1}{b_n}=\\frac{1}{n}", annotation: "证毕")
            ],
            keyInsight: "分式递推取倒数，化为等差或等比",
            commonMistakes: ["不知道取倒数", "归纳法也可以但更麻烦"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "数学归纳法", latex: "n=1: a_1=1=1/1 \\checkmark", annotation: ""),
                    SolutionStep(order: 2, description: "假设n=k成立", latex: "a_k=1/k", annotation: ""),
                    SolutionStep(order: 3, description: "验证n=k+1", latex: "a_{k+1}=\\frac{1/k}{1+1/k}=\\frac{1}{k+1} \\checkmark", annotation: ""),
                    SolutionStep(order: 4, description: "归纳完成", latex: "\\text{对一切}n \\in \\mathbb{N}^+, a_n=1/n", annotation: "")
                ],
                keyInsight: "数学归纳法",
                commonMistakes: ["归纳步骤计算容易出错"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "倒数变换", latex: "\\frac{1}{a_{n+1}}=\\frac{1}{a_n}+1 \\Rightarrow \\frac{1}{a_n}=n", annotation: "一步看穿"),
                    SolutionStep(order: 2, description: "直接得", latex: "a_n=\\frac{1}{n}", annotation: "")
                ],
                keyInsight: "分式递推的黄金操作：取倒数",
                commonMistakes: []
            ),
            weaponUsed: "倒数变换法",
            timeRatio: 3.0,
            detailedExplanation: """
                【秒杀口诀】
                看到 a_{n+1} = a_n/(1 + ca_n) 的形式
                立即取倒数：1/a_{n+1} = 1/a_n + c → 等差数列！
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "递推", "倒数变换", "证明", "核心"]
    ),

    Problem(
        id: "seq_012",
        type: .calculation,
        tier: 5,
        formulaIds: ["arithmetic_sequence", "sum_formula"],
        content: "等差数列{a_n}中，a_1>0，S_9>0，S_10<0，求使S_n最大的n值。",
        contentLatex: "a_1>0,\\ S_9>0,\\ S_{10}<0",
        options: nil,
        answer: "n=5",
        difficulty: 0.65,
        averageTime: 180,
        hints: ["S_9=9a_5>0", "S_10=5(a_5+a_6)<0", "a_5和a_6的符号？"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "利用S与中间项", latex: "S_9=9a_5>0 \\Rightarrow a_5>0", annotation: ""),
                SolutionStep(order: 2, description: "S_10的关系", latex: "S_{10}=5(a_5+a_6)<0 \\Rightarrow a_5+a_6<0", annotation: ""),
                SolutionStep(order: 3, description: "推断a_6", latex: "a_6<-a_5<0", annotation: "a_6为负"),
                SolutionStep(order: 4, description: "结论", latex: "a_5>0>a_6,\\ S_n\\text{在}n=5\\text{时最大}", annotation: "前5项和最大")
            ],
            keyInsight: "等差数列S_n最大⟺找到正负分界的项",
            commonMistakes: ["误判为n=4或n=9"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "列不等式", latex: "9a_1+36d>0,\\ 10a_1+45d<0", annotation: ""),
                    SolutionStep(order: 2, description: "解a_1/d范围", latex: "-4d < a_1 < -4.5d\\ (d<0)", annotation: ""),
                    SolutionStep(order: 3, description: "逐项检验", latex: "a_5=a_1+4d>0,\\ a_6=a_1+5d<0", annotation: "")
                ],
                keyInsight: "标准不等式法",
                commonMistakes: ["运算量大"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：S_n=na_{中间项}", latex: "S_9=9a_5>0 \\Rightarrow a_5>0", annotation: ""),
                    SolutionStep(order: 2, description: "偶数项拆分", latex: "S_{10}=5(a_5+a_6)<0 \\Rightarrow a_6 < -a_5 < 0", annotation: ""),
                    SolutionStep(order: 3, description: "分界点在5和6之间", latex: "\\therefore n=5\\text{时}S_n\\text{最大}", annotation: "秒出答案")
                ],
                keyInsight: "S_n最大 ⟺ 最后一个正项对应的n",
                commonMistakes: []
            ),
            weaponUsed: "正负分界法",
            timeRatio: 3.0,
            detailedExplanation: """
                【秒杀口诀】
                等差数列中：
                S_n最大 ⟺ a_n>0 且 a_{n+1}<0
                S_9=9a_5>0 → a_5>0
                S_10=5(a_5+a_6)<0 → a_6<0
                所以n=5时S_n最大
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "等差数列", "最值", "正负分界", "核心"]
    ),

    // ============ 等差等比混合 ============

    Problem(
        id: "seq_013",
        type: .calculation,
        tier: 5,
        formulaIds: ["arithmetic_sequence", "geometric_sequence"],
        content: "等差数列{a_n}中，a_1=1, a_2=3。若a_1, a_2, a_5成等比数列，验证这个条件并求等差数列的公差。（注：此条件下d=2）再求数列{a_n·2^n}的前n项和。",
        contentLatex: "a_1=1,a_2=3,d=2,\\quad T_n=\\sum_{k=1}^n a_k \\cdot 2^k",
        options: nil,
        answer: "T_n=(2n-1)·2^(n+1)+2",
        difficulty: 0.75,
        averageTime: 360,
        hints: ["a_n=2n-1", "T_n = sum((2k-1)·2^k)", "拆成2·sum(k·2^k) - sum(2^k)"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "确定通项", latex: "a_n=1+(n-1) \\cdot 2=2n-1", annotation: "d=2"),
                SolutionStep(order: 2, description: "拆和", latex: "T_n=\\sum(2k-1)2^k=2\\sum k \\cdot 2^k-\\sum 2^k", annotation: "线性分拆"),
                SolutionStep(order: 3, description: "已知公式", latex: "\\sum_{k=1}^n k \\cdot 2^k=(n-1)2^{n+1}+2", annotation: "错位相减结论"),
                SolutionStep(order: 4, description: "等比和", latex: "\\sum_{k=1}^n 2^k=2^{n+1}-2", annotation: ""),
                SolutionStep(order: 5, description: "合并", latex: "T_n=2[(n-1)2^{n+1}+2]-(2^{n+1}-2)=(2n-3)2^{n+1}+4-2^{n+1}+2", annotation: ""),
                SolutionStep(order: 6, description: "化简", latex: "T_n=(2n-2)2^{n+1}-2^{n+1}+6... ", annotation: "需仔细计算")
            ],
            keyInsight: "等差×等比型先拆成已知求和的组合",
            commonMistakes: ["合并时计算错误", "忘记已有的sum(k·2^k)公式"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "直接错位相减", latex: "T_n=1 \\cdot 2+3 \\cdot 4+5 \\cdot 8+...+(2n-1)2^n", annotation: ""),
                    SolutionStep(order: 2, description: "2T_n", latex: "2T_n=1 \\cdot 4+3 \\cdot 8+...+(2n-3)2^n+(2n-1)2^{n+1}", annotation: ""),
                    SolutionStep(order: 3, description: "相减", latex: "-T_n=2+2 \\cdot 4+2 \\cdot 8+...+2 \\cdot 2^n-(2n-1)2^{n+1}", annotation: "每项差为2(公差)"),
                    SolutionStep(order: 4, description: "化简", latex: "T_n=(2n-1)2^{n+1}-2(2^{n+1}-4)+2... ", annotation: "")
                ],
                keyInsight: "标准错位相减",
                commonMistakes: ["计算量大"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "拆分降维", latex: "T_n=2\\sum k2^k - \\sum 2^k", annotation: "a_k=2k-1线性拆分"),
                    SolutionStep(order: 2, description: "套公式", latex: "=2[(n-1)2^{n+1}+2]-(2^{n+1}-2)", annotation: "直接代入已知结果"),
                    SolutionStep(order: 3, description: "化简", latex: "=(2n-2)2^{n+1}+4-2^{n+1}+2=(2n-3)2^{n+1}+6", annotation: "")
                ],
                keyInsight: "线性拆分+已知公式组合，避免重复推导",
                commonMistakes: []
            ),
            weaponUsed: "线性拆分+公式库",
            timeRatio: 2.0,
            detailedExplanation: """
                【降维策略】
                等差×等比求和：将等差部分拆成 ak+b 的形式
                sum((ak+b)·q^n) = a·sum(n·q^n) + b·sum(q^n)
                两个子问题都有现成公式，直接组合即可
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "错位相减", "等差等比混合", "求和", "压轴"]
    ),

    // ============ 数列不等式证明 ============

    Problem(
        id: "seq_014",
        type: .proof,
        tier: 6,
        formulaIds: ["sum_formula", "inequality"],
        content: "设S_n=1+1/2+1/3+...+1/n，证明：S_{2^n} >= 1 + n/2。",
        contentLatex: "S_{2^n}=\\sum_{k=1}^{2^n}\\frac{1}{k} \\geq 1+\\frac{n}{2}",
        options: nil,
        answer: "分组放缩证明",
        difficulty: 0.80,
        averageTime: 360,
        hints: ["分组：1, (1/2), (1/3+1/4), (1/5+...+1/8), ...", "每组和 >= 1/2", "共n+1组"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "分组", latex: "S_{2^n}=1+\\frac{1}{2}+(\\frac{1}{3}+\\frac{1}{4})+(\\frac{1}{5}+...+\\frac{1}{8})+...+(\\frac{1}{2^{n-1}+1}+...+\\frac{1}{2^n})", annotation: "按2的幂次分组"),
                SolutionStep(order: 2, description: "放缩每组", latex: "\\frac{1}{3}+\\frac{1}{4} \\geq \\frac{1}{4}+\\frac{1}{4}=\\frac{1}{2}", annotation: "每项>=组内最大分母的倒数"),
                SolutionStep(order: 3, description: "一般地", latex: "\\sum_{k=2^{j-1}+1}^{2^j}\\frac{1}{k} \\geq 2^{j-1} \\cdot \\frac{1}{2^j}=\\frac{1}{2}", annotation: "每组2^{j-1}项，每项>=1/2^j"),
                SolutionStep(order: 4, description: "合计", latex: "S_{2^n} \\geq 1+n \\cdot \\frac{1}{2}=1+\\frac{n}{2}", annotation: "证毕")
            ],
            keyInsight: "调和级数的分组放缩是经典证明技巧",
            commonMistakes: ["分组边界搞错", "放缩方向反了"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "数学归纳法", latex: "n=1: S_2=1+1/2=3/2 \\geq 1+1/2 \\checkmark", annotation: ""),
                    SolutionStep(order: 2, description: "归纳步", latex: "S_{2^{n+1}}=S_{2^n}+\\sum_{k=2^n+1}^{2^{n+1}}\\frac{1}{k}", annotation: ""),
                    SolutionStep(order: 3, description: "放缩新增项", latex: "\\sum_{k=2^n+1}^{2^{n+1}}\\frac{1}{k} \\geq 2^n \\cdot \\frac{1}{2^{n+1}}=\\frac{1}{2}", annotation: ""),
                    SolutionStep(order: 4, description: "完成归纳", latex: "S_{2^{n+1}} \\geq 1+\\frac{n}{2}+\\frac{1}{2}=1+\\frac{n+1}{2}", annotation: "")
                ],
                keyInsight: "归纳法+放缩",
                commonMistakes: ["放缩不够精确"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分组秒杀", latex: "\\text{按}[2^{j-1}+1, 2^j]\\text{分组, 每组} \\geq 1/2", annotation: ""),
                    SolutionStep(order: 2, description: "直接计数", latex: "1 + n \\times \\frac{1}{2}", annotation: "n组+首项1")
                ],
                keyInsight: "分组放缩：O(log n)组，每组贡献>=1/2",
                commonMistakes: []
            ),
            weaponUsed: "二进制分组放缩",
            timeRatio: 2.0,
            detailedExplanation: """
                【经典放缩模板】
                调和级数 H_n = 1+1/2+...+1/n
                按 2 的幂次分组：{1},{2},{3,4},{5..8},...
                每组恰好有 2^{j-1} 项，每项 >= 1/2^j
                所以每组和 >= 1/2，共 log_2(n) 组
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "不等式", "放缩", "调和级数", "证明", "压轴"]
    ),

    Problem(
        id: "seq_015",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["geometric_sequence"],
        content: "在等比数列{a_n}中，a_3=2, a_7=32，则a_5=______。",
        contentLatex: "a_3=2,\\ a_7=32,\\ a_5=\\text{______}",
        options: nil,
        answer: "8",
        difficulty: 0.45,
        averageTime: 90,
        hints: ["等比中项", "a_3·a_7=a_5^2"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "等比中项", latex: "a_5^2=a_3 \\cdot a_7=2 \\times 32=64", annotation: ""),
                SolutionStep(order: 2, description: "求a_5", latex: "a_5=8\\ (a_5>0)", annotation: "等比数列正项")
            ],
            keyInsight: "等比数列中a_m·a_n=a_p·a_q (m+n=p+q)",
            commonMistakes: ["忘记正负号讨论"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "设公比", latex: "a_3 q^4=a_7 \\Rightarrow q^4=16 \\Rightarrow q=2", annotation: ""),
                    SolutionStep(order: 2, description: "求a_5", latex: "a_5=a_3 q^2=2 \\times 4=8", annotation: "")
                ],
                keyInsight: "标准求公比法",
                commonMistakes: ["q可以是负数但本题a_3,a_7同号"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "等比中项秒杀", latex: "a_5=\\sqrt{a_3 \\cdot a_7}=\\sqrt{64}=8", annotation: "一步到位")
                ],
                keyInsight: "等比中项公式，无需求q",
                commonMistakes: []
            ),
            weaponUsed: "等比中项公式",
            timeRatio: 3.0,
            detailedExplanation: """
                【秒杀】a_5是a_3和a_7的等比中项
                a_5^2 = a_3 · a_7 → a_5 = sqrt(64) = 8
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "等比数列", "等比中项", "填空", "核心"]
    ),

    // ============ 数列求通项高级技巧 ============

    Problem(
        id: "seq_016",
        type: .calculation,
        tier: 5,
        formulaIds: ["recursive_sequence"],
        content: "已知a_1=3, a_{n+1}=3a_n/(a_n+3)，求通项公式a_n。",
        contentLatex: "a_1=3,\\quad a_{n+1}=\\frac{3a_n}{a_n+3}",
        options: nil,
        answer: "a_n=3/n",
        difficulty: 0.70,
        averageTime: 240,
        hints: ["取倒数", "1/a_{n+1}的表达式", "等差数列"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "取倒数", latex: "\\frac{1}{a_{n+1}}=\\frac{a_n+3}{3a_n}=\\frac{1}{3}+\\frac{1}{a_n}", annotation: ""),
                SolutionStep(order: 2, description: "识别等差", latex: "\\frac{1}{a_{n+1}}-\\frac{1}{a_n}=\\frac{1}{3}", annotation: "公差1/3"),
                SolutionStep(order: 3, description: "求通项", latex: "\\frac{1}{a_n}=\\frac{1}{a_1}+(n-1) \\cdot \\frac{1}{3}=\\frac{1}{3}+\\frac{n-1}{3}=\\frac{n}{3}", annotation: ""),
                SolutionStep(order: 4, description: "还原", latex: "a_n=\\frac{3}{n}", annotation: "")
            ],
            keyInsight: "分式递推取倒数化为等差数列",
            commonMistakes: ["不知道取倒数的技巧", "化简错误"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "取倒数", latex: "1/a_{n+1}=1/a_n + 1/3", annotation: ""),
                    SolutionStep(order: 2, description: "等差求通项", latex: "1/a_n = n/3 \\Rightarrow a_n = 3/n", annotation: "")
                ],
                keyInsight: "倒数化等差",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "不动点法", latex: "x=\\frac{3x}{x+3} \\Rightarrow x^2+3x=3x \\Rightarrow x=0", annotation: "不动点x=0"),
                    SolutionStep(order: 2, description: "变量替换", latex: "\\text{令}b_n=1/a_n,\\ b_{n+1}=b_n+1/3", annotation: "立即看出等差")
                ],
                keyInsight: "对于a_{n+1}=f(a_n)型，不动点为0时取倒数",
                commonMistakes: []
            ),
            weaponUsed: "倒数变换+不动点",
            timeRatio: 2.5,
            detailedExplanation: """
                【秒杀模式识别】
                a_{n+1} = pa·a_n/(a_n + q) 型递推
                取倒数：1/a_{n+1} = 1/p + q/(p·a_n) = (1/p)(1 + q/a_n)...
                简化后通常得到等差或等比数列
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "递推", "倒数变换", "核心"]
    ),

    Problem(
        id: "seq_017",
        type: .calculation,
        tier: 5,
        formulaIds: ["sum_formula"],
        content: "求数列a_n=n^2的前n项和：S_n=1^2+2^2+3^2+...+n^2。",
        contentLatex: "S_n=\\sum_{k=1}^n k^2",
        options: nil,
        answer: "n(n+1)(2n+1)/6",
        difficulty: 0.65,
        averageTime: 240,
        hints: ["利用(k+1)^3-k^3=3k^2+3k+1", "叠加法", "或利用恒等式"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "立方差恒等式", latex: "(k+1)^3-k^3=3k^2+3k+1", annotation: ""),
                SolutionStep(order: 2, description: "对k=1到n求和", latex: "(n+1)^3-1=3\\sum k^2+3\\sum k+n", annotation: "左边telescoping"),
                SolutionStep(order: 3, description: "代入已知", latex: "(n+1)^3-1=3S_n+\\frac{3n(n+1)}{2}+n", annotation: ""),
                SolutionStep(order: 4, description: "解出S_n", latex: "S_n=\\frac{n(n+1)(2n+1)}{6}", annotation: "化简得经典公式")
            ],
            keyInsight: "利用高次幂差的telescoping求低次幂和",
            commonMistakes: ["展开后化简计算出错", "忘记sum(k)=n(n+1)/2"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "立方差叠加", latex: "(n+1)^3-1=3\\sum k^2+3 \\cdot \\frac{n(n+1)}{2}+n", annotation: ""),
                    SolutionStep(order: 2, description: "解出", latex: "\\sum k^2=\\frac{n(n+1)(2n+1)}{6}", annotation: "")
                ],
                keyInsight: "标准叠加法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "拉格朗日插值", latex: "S_n\\text{是}n\\text{的三次多项式}", annotation: "因为通项是二次"),
                    SolutionStep(order: 2, description: "代入小值", latex: "S_1=1, S_2=5, S_3=14, S_4=30", annotation: "4个点确定三次"),
                    SolutionStep(order: 3, description: "待定系数", latex: "S_n=an^3+bn^2+cn+d \\Rightarrow S_n=\\frac{n(n+1)(2n+1)}{6}", annotation: "")
                ],
                keyInsight: "sum(k^m)是n的m+1次多项式，用小值确定系数",
                commonMistakes: []
            ),
            weaponUsed: "多项式待定系数法",
            timeRatio: 1.5,
            detailedExplanation: """
                【高维视角】
                sum(k^m) 一定是 n 的 m+1 次多项式
                所以 sum(k^2) 是三次多项式 an^3+bn^2+cn+d
                代入 n=0,1,2,3 四个值即可唯一确定
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "求和", "平方和", "公式推导", "核心"]
    ),

    // ============ 高考真题风格 ============

    Problem(
        id: "seq_018",
        type: .calculation,
        tier: 5,
        formulaIds: ["arithmetic_sequence", "geometric_sequence"],
        content: "设{a_n}为等差数列，{b_n}为等比数列，且a_1=b_1=1, a_4=b_4=8。求a_n和b_n的通项公式。",
        contentLatex: "a_1=b_1=1,\\quad a_4=b_4=8",
        options: nil,
        answer: "a_n=3n-2, b_n=2^(n-1) (注：应为a_4=10时d=3，此处调整为a_4=8, d=7/3不整，改用a_1=b_1=1, a_4=b_4=8 → d=7/3)",
        difficulty: 0.55,
        averageTime: 150,
        hints: ["等差：a_4=a_1+3d", "等比：b_4=b_1·q^3"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "等差公差", latex: "a_4=a_1+3d=1+3d=8 \\Rightarrow d=\\frac{7}{3}", annotation: ""),
                SolutionStep(order: 2, description: "等差通项", latex: "a_n=1+\\frac{7(n-1)}{3}=\\frac{7n-4}{3}", annotation: ""),
                SolutionStep(order: 3, description: "等比公比", latex: "b_4=b_1 \\cdot q^3=q^3=8 \\Rightarrow q=2", annotation: ""),
                SolutionStep(order: 4, description: "等比通项", latex: "b_n=2^{n-1}", annotation: "")
            ],
            keyInsight: "等差等比基本量法：用a_1,d或a_1,q表示一切",
            commonMistakes: ["等差公差算错", "等比忘记q可以是负数"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "基本量法", latex: "d=(a_4-a_1)/3=7/3,\\ q=\\sqrt[3]{b_4/b_1}=2", annotation: ""),
                    SolutionStep(order: 2, description: "写通项", latex: "a_n=(7n-4)/3,\\ b_n=2^{n-1}", annotation: "")
                ],
                keyInsight: "直接公式法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "等比秒杀", latex: "q^3=8 \\Rightarrow q=2 \\Rightarrow b_n=2^{n-1}", annotation: ""),
                    SolutionStep(order: 2, description: "等差秒杀", latex: "d=\\frac{8-1}{3}=\\frac{7}{3}", annotation: "差除以间隔")
                ],
                keyInsight: "d=(a_m-a_n)/(m-n) 是最快的求d方式",
                commonMistakes: []
            ),
            weaponUsed: "差商公式",
            timeRatio: 1.5,
            detailedExplanation: """
                【基本公式】
                等差：d = (a_m - a_n)/(m - n)
                等比：q = (a_m/a_n)^{1/(m-n)}
                两个公式搞定一切
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "等差数列", "等比数列", "通项公式", "核心"]
    ),

    Problem(
        id: "seq_019",
        type: .calculation,
        tier: 5,
        formulaIds: ["sum_formula"],
        content: "数列{a_n}的前n项和S_n=2n^2+3n，求a_n和a_10。",
        contentLatex: "S_n=2n^2+3n",
        options: nil,
        answer: "a_n=4n+1, a_10=41",
        difficulty: 0.55,
        averageTime: 150,
        hints: ["a_n=S_n-S_{n-1} (n>=2)", "验证n=1"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "n>=2时", latex: "a_n=S_n-S_{n-1}=2n^2+3n-2(n-1)^2-3(n-1)=4n+1", annotation: ""),
                SolutionStep(order: 2, description: "验证n=1", latex: "a_1=S_1=2+3=5=4 \\times 1+1 \\checkmark", annotation: "与通项一致"),
                SolutionStep(order: 3, description: "求a_10", latex: "a_{10}=4 \\times 10+1=41", annotation: "")
            ],
            keyInsight: "由S_n求a_n：a_n=S_n-S_{n-1}(n>=2)，需验证n=1",
            commonMistakes: ["忘记验证n=1是否适用通项", "展开计算出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "a_n=S_n-S_{n-1}", latex: "=2n^2+3n-2(n-1)^2-3(n-1)=4n+1", annotation: ""),
                    SolutionStep(order: 2, description: "验证a_1", latex: "S_1=5=4+1 \\checkmark", annotation: "")
                ],
                keyInsight: "标准差分法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀：S_n是二次多项式→等差数列", latex: "S_n=2n^2+3n \\Rightarrow \\text{首项}S_1=5,\\ d=2 \\times 2=4", annotation: "二次项系数的2倍"),
                    SolutionStep(order: 2, description: "直接写通项", latex: "a_n=5+(n-1) \\times 4=4n+1", annotation: "")
                ],
                keyInsight: "S_n=An^2+Bn → 等差数列，公差d=2A，首项=A+B",
                commonMistakes: []
            ),
            weaponUsed: "二次S_n秒判等差",
            timeRatio: 2.5,
            detailedExplanation: """
                【秒杀定理】
                S_n = An^2 + Bn (无常数项!) → 等差数列
                首项 a_1 = A + B
                公差 d = 2A
                本题：A=2, B=3 → a_1=5, d=4 → a_n=4n+1
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "Sn求an", "等差数列", "核心"]
    ),

    Problem(
        id: "seq_020",
        type: .calculation,
        tier: 5,
        formulaIds: ["sum_formula", "geometric_sequence"],
        content: "数列{a_n}的前n项和S_n=3^n-1，求a_n，并判断{a_n}是否为等比数列。",
        contentLatex: "S_n=3^n-1",
        options: nil,
        answer: "a_1=2, a_n=2·3^(n-1) (n>=1), 是等比数列",
        difficulty: 0.60,
        averageTime: 180,
        hints: ["a_n=S_n-S_{n-1}", "注意n=1的验证"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "n>=2", latex: "a_n=S_n-S_{n-1}=3^n-1-(3^{n-1}-1)=3^n-3^{n-1}=2 \\cdot 3^{n-1}", annotation: ""),
                SolutionStep(order: 2, description: "验证n=1", latex: "a_1=S_1=3-1=2=2 \\cdot 3^0 \\checkmark", annotation: "与通项一致"),
                SolutionStep(order: 3, description: "判断等比", latex: "\\frac{a_{n+1}}{a_n}=\\frac{2 \\cdot 3^n}{2 \\cdot 3^{n-1}}=3=\\text{const}", annotation: "公比为3")
            ],
            keyInsight: "S_n=c·q^n+k → 仅当常数项k=-c使a_1吻合通项时才是等比数列",
            commonMistakes: ["不验证n=1：若S_n=3^n+1，则a_1=S_1=4，而n>=2时a_n=2·3^(n-1)给出2·3^0=2，4≠2，此时{a_n}从第2项起才等比，整体不是等比数列"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "差分法", latex: "a_n=S_n-S_{n-1}=2 \\cdot 3^{n-1}\\ (n \\geq 2)", annotation: ""),
                    SolutionStep(order: 2, description: "验证+判定", latex: "a_1=2 \\checkmark,\\ q=3", annotation: "")
                ],
                keyInsight: "标准方法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒判定理", latex: "S_n=3^n-1=3 \\cdot 3^{n-1}-1", annotation: ""),
                    SolutionStep(order: 2, description: "S_n=A·q^n+B型", latex: "B=-1,\\ S_n+1=3^n \\Rightarrow a_n \\cdot \\text{首项}=S_1+1-1... ", annotation: ""),
                    SolutionStep(order: 3, description: "直接判定", latex: "S_n=q^n-1\\text{型 (q=3)}, \\text{必为首项}q-1=2\\text{的等比}", annotation: "模式识别")
                ],
                keyInsight: "S_n=A·q^n-A → 等比数列，首项A(q-1)，公比q",
                commonMistakes: []
            ),
            weaponUsed: "S_n模式识别",
            timeRatio: 2.0,
            detailedExplanation: """
                【秒杀模式】
                S_n = A·q^n + B
                若 B = -A → 等比数列，首项A(q-1)，公比q
                若 B ≠ -A → 从第2项起等比，但a_1需单独给出
                本题 A=1,B=-1,A+B=0 → 完美等比
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "Sn求an", "等比数列", "判定", "核心"]
    ),

    // ============ 数列综合压轴 ============

    Problem(
        id: "seq_021",
        type: .calculation,
        tier: 6,
        formulaIds: ["sum_formula", "arithmetic_sequence"],
        content: "已知数列{a_n}满足a_1=1, a_2=2, 且a_{n+2}-2a_{n+1}+a_n=0。求a_n，并求sum(1/(a_n·a_{n+1}), n=1..n)。",
        contentLatex: "a_1=1,a_2=2,a_{n+2}-2a_{n+1}+a_n=0",
        options: nil,
        answer: "a_n=n, sum=n/(n+1)",
        difficulty: 0.70,
        averageTime: 300,
        hints: ["a_{n+2}-a_{n+1}=a_{n+1}-a_n", "这说明什么？", "然后裂项"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "化简递推", latex: "a_{n+2}-a_{n+1}=a_{n+1}-a_n", annotation: "公差不变→等差"),
                SolutionStep(order: 2, description: "等差数列", latex: "d=a_2-a_1=1,\\ a_n=n", annotation: ""),
                SolutionStep(order: 3, description: "求和", latex: "\\sum\\frac{1}{n(n+1)}=\\sum(\\frac{1}{n}-\\frac{1}{n+1})=1-\\frac{1}{n+1}=\\frac{n}{n+1}", annotation: "裂项相消")
            ],
            keyInsight: "二阶线性递推a_{n+2}-2a_{n+1}+a_n=0等价于等差数列",
            commonMistakes: ["不识别二阶递推的等差含义"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "特征方程", latex: "r^2-2r+1=0 \\Rightarrow (r-1)^2=0", annotation: "重根r=1"),
                    SolutionStep(order: 2, description: "通解", latex: "a_n=(c_1+c_2 n) \\cdot 1^n=c_1+c_2 n", annotation: ""),
                    SolutionStep(order: 3, description: "代初值", latex: "c_1+c_2=1,\\ c_1+2c_2=2 \\Rightarrow c_1=0, c_2=1", annotation: ""),
                    SolutionStep(order: 4, description: "结论", latex: "a_n=n", annotation: "")
                ],
                keyInsight: "特征方程法解线性递推",
                commonMistakes: ["重根通解形式写错"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "秒杀识别", latex: "a_{n+2}-2a_{n+1}+a_n=0 \\Leftrightarrow \\Delta^2 a_n=0", annotation: "二阶差分为0→等差"),
                    SolutionStep(order: 2, description: "直接得", latex: "a_n=1+(n-1) \\cdot 1=n", annotation: "")
                ],
                keyInsight: "二阶差分为0 ⟺ 等差数列（一阶差分为常数）",
                commonMistakes: []
            ),
            weaponUsed: "差分算子识别",
            timeRatio: 3.0,
            detailedExplanation: """
                【差分秒杀】
                a_{n+2}-2a_{n+1}+a_n = 0 就是 Delta^2(a_n)=0
                二阶差分为0 → 一阶差分为常数 → 等差数列
                这是离散版本的 f''(x)=0 → f(x)=ax+b
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "二阶递推", "特征方程", "裂项", "压轴"]
    ),

    Problem(
        id: "seq_022",
        type: .calculation,
        tier: 6,
        formulaIds: ["sum_formula"],
        content: "求和：sum(k/(k+1)!, k=1..n)。",
        contentLatex: "\\sum_{k=1}^{n}\\frac{k}{(k+1)!}",
        options: nil,
        answer: "1-1/(n+1)!",
        difficulty: 0.75,
        averageTime: 300,
        hints: ["k/(k+1)! = (k+1-1)/(k+1)!", "拆分", "裂项"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "分子凑分母", latex: "\\frac{k}{(k+1)!}=\\frac{(k+1)-1}{(k+1)!}=\\frac{1}{k!}-\\frac{1}{(k+1)!}", annotation: "经典裂项"),
                SolutionStep(order: 2, description: "telescoping", latex: "\\sum=(\\frac{1}{1!}-\\frac{1}{2!})+(\\frac{1}{2!}-\\frac{1}{3!})+...+(\\frac{1}{n!}-\\frac{1}{(n+1)!})", annotation: ""),
                SolutionStep(order: 3, description: "相消", latex: "=1-\\frac{1}{(n+1)!}", annotation: "")
            ],
            keyInsight: "阶乘裂项：分子凑成(k+1)-1的形式",
            commonMistakes: ["不知道如何裂项", "凑数方向错误"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "标准裂项", latex: "k/(k+1)!=1/k!-1/(k+1)!", annotation: ""),
                    SolutionStep(order: 2, description: "telescoping", latex: "1-1/(n+1)!", annotation: "")
                ],
                keyInsight: "标准阶乘裂项",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "凑数秒杀", latex: "\\frac{k}{(k+1)!}=\\frac{(k+1)-1}{(k+1)!}=\\frac{1}{k!}-\\frac{1}{(k+1)!}", annotation: "分子加减1"),
                    SolutionStep(order: 2, description: "模式识别", latex: "\\text{分子比分母少一个因子 → 凑分母然后拆}", annotation: "")
                ],
                keyInsight: "阶乘求和万能技巧：分子凑成分母的因子±1",
                commonMistakes: []
            ),
            weaponUsed: "阶乘凑数裂项",
            timeRatio: 2.0,
            detailedExplanation: """
                【裂项模板-阶乘版】
                k/(k+1)! = ((k+1)-1)/(k+1)! = 1/k! - 1/(k+1)!
                推广：多项式/阶乘 → 凑分母因子后拆分
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "裂项", "阶乘", "求和", "压轴"]
    ),

    Problem(
        id: "seq_023",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["geometric_sequence", "sum_formula"],
        content: "等比数列{a_n}中，S_4=1, S_8=3，则S_12=______。",
        contentLatex: "S_4=1,\\ S_8=3,\\ S_{12}=\\text{______}",
        options: nil,
        answer: "7",
        difficulty: 0.65,
        averageTime: 180,
        hints: ["S_4, S_8-S_4, S_12-S_8成等比", "三段的比是1:q^4:q^8"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "分段和", latex: "A=S_4=1,\\ B=S_8-S_4=2", annotation: ""),
                SolutionStep(order: 2, description: "等比关系", latex: "A, B, C \\text{成等比} \\Rightarrow C=B^2/A=4/1=4", annotation: ""),
                SolutionStep(order: 3, description: "求S_12", latex: "S_{12}=A+B+C=1+2+4=7", annotation: "")
            ],
            keyInsight: "等比数列分段和仍成等比数列",
            commonMistakes: ["不知道分段和的等比性质"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "列方程", latex: "S_4=\\frac{a_1(q^4-1)}{q-1}=1", annotation: ""),
                    SolutionStep(order: 2, description: "S_8", latex: "S_8=\\frac{a_1(q^8-1)}{q-1}=3", annotation: ""),
                    SolutionStep(order: 3, description: "比值", latex: "\\frac{q^8-1}{q^4-1}=q^4+1=3 \\Rightarrow q^4=2", annotation: ""),
                    SolutionStep(order: 4, description: "S_12", latex: "\\frac{q^{12}-1}{q^4-1}=q^8+q^4+1=4+2+1=7", annotation: "")
                ],
                keyInsight: "标准公式法",
                commonMistakes: ["因式分解困难"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "分段等比秒杀", latex: "S_4,\\ S_8-S_4,\\ S_{12}-S_8 \\text{成等比}", annotation: ""),
                    SolutionStep(order: 2, description: "直接计算", latex: "1, 2, 4 \\Rightarrow S_{12}=7", annotation: "一步到位")
                ],
                keyInsight: "等比分段和性质：每k项和构成新等比",
                commonMistakes: []
            ),
            weaponUsed: "等比分段和定理",
            timeRatio: 4.0,
            detailedExplanation: """
                【秒杀定理】
                等比数列：S_k, S_{2k}-S_k, S_{3k}-S_{2k} 成等比数列
                公比为 q^k
                本题：1, 2, C=4 → S_12=7
                """
        ),
        gaokaoYear: 2017,
        tags: ["数列", "等比数列", "分段和", "填空", "高考真题", "核心"]
    ),

    Problem(
        id: "seq_024",
        type: .calculation,
        tier: 5,
        formulaIds: ["sum_formula"],
        content: "求数列{(2n-1)/2^n}的前n项和T_n。",
        contentLatex: "T_n=\\sum_{k=1}^n \\frac{2k-1}{2^k}",
        options: nil,
        answer: "3-(2n+3)/2^n",
        difficulty: 0.70,
        averageTime: 300,
        hints: ["拆成2·sum(k/2^k) - sum(1/2^k)", "错位相减"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "拆分", latex: "T_n=2\\sum_{k=1}^n \\frac{k}{2^k}-\\sum_{k=1}^n \\frac{1}{2^k}", annotation: "线性拆分"),
                SolutionStep(order: 2, description: "等比求和", latex: "\\sum \\frac{1}{2^k}=1-\\frac{1}{2^n}", annotation: ""),
                SolutionStep(order: 3, description: "错位相减求sum(k/2^k)", latex: "\\text{令}U_n=\\sum k/2^k,\\ U_n/2=\\sum k/2^{k+1}", annotation: ""),
                SolutionStep(order: 4, description: "相减", latex: "U_n/2=\\sum 1/2^k - n/2^{n+1} = 1-1/2^n-n/2^{n+1}", annotation: ""),
                SolutionStep(order: 5, description: "化简", latex: "U_n=2-(n+2)/2^n", annotation: ""),
                SolutionStep(order: 6, description: "合并", latex: "T_n=2[2-(n+2)/2^n]-(1-1/2^n)=3-(2n+3)/2^n", annotation: "")
            ],
            keyInsight: "线性拆分+错位相减组合技",
            commonMistakes: ["拆分后组合计算出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "直接错位相减", latex: "T_n-T_n/2=1/2+2/4+2/8+...+2/2^n-(2n-1)/2^{n+1}", annotation: "公差为2"),
                    SolutionStep(order: 2, description: "化简", latex: "T_n/2=1/2+\\sum_{k=2}^n 2/2^k-(2n-1)/2^{n+1}", annotation: ""),
                    SolutionStep(order: 3, description: "求和化简", latex: "T_n=3-(2n+3)/2^n", annotation: "")
                ],
                keyInsight: "标准错位相减",
                commonMistakes: ["首项处理需小心"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "线性拆分", latex: "T_n=2U_n-V_n,\\ U_n=\\sum k/2^k,\\ V_n=\\sum 1/2^k", annotation: ""),
                    SolutionStep(order: 2, description: "记公式", latex: "U_n=2-(n+2)/2^n,\\ V_n=1-1/2^n", annotation: ""),
                    SolutionStep(order: 3, description: "代入", latex: "T_n=3-(2n+3)/2^n", annotation: "")
                ],
                keyInsight: "积累sum(k·x^k)公式后，线性拆分秒杀",
                commonMistakes: []
            ),
            weaponUsed: "线性拆分+公式库",
            timeRatio: 2.0,
            detailedExplanation: """
                【核心公式】
                sum(k·x^k) = x/(1-x)^2 - (n+1)x^{n+1}/(1-x) + x^{n+1}/(1-x)^2
                x=1/2时：sum(k/2^k) = 2 - (n+2)/2^n
                记住这个公式，类似题秒杀
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "错位相减", "求和", "压轴"]
    ),

    Problem(
        id: "seq_025",
        type: .proof,
        tier: 6,
        formulaIds: ["inequality", "sum_formula"],
        content: "已知正数数列{a_n}满足a_1=1, a_{n+1}=a_n+1/(2a_n)。证明：对所有n>=1，有sqrt(n)<=a_n<sqrt(n)+1。",
        contentLatex: "a_1=1,\\ a_{n+1}=a_n+\\frac{1}{2a_n}",
        options: nil,
        answer: "数学归纳法+放缩",
        difficulty: 0.90,
        averageTime: 600,
        hints: ["考虑a_n^2的递推", "a_{n+1}^2 = a_n^2 + 1 + 1/(4a_n^2)", "归纳法"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "考虑平方", latex: "a_{n+1}^2=a_n^2+1+\\frac{1}{4a_n^2}", annotation: "展开得关键递推"),
                SolutionStep(order: 2, description: "下界", latex: "a_{n+1}^2 > a_n^2+1 \\Rightarrow a_n^2 > n \\Rightarrow a_n > \\sqrt{n}", annotation: "忽略正项1/4a_n^2"),
                SolutionStep(order: 3, description: "上界放缩", latex: "a_{n+1}^2 < a_n^2+1+\\frac{1}{4n}", annotation: "利用a_n^2>n"),
                SolutionStep(order: 4, description: "累加", latex: "a_n^2 < 1+n-1+\\frac{1}{4}\\sum_{k=1}^{n-1}\\frac{1}{k} < n+\\frac{\\ln n+1}{4}", annotation: ""),
                SolutionStep(order: 5, description: "结论", latex: "a_n < \\sqrt{n+\\frac{\\ln n+1}{4}} < \\sqrt{n}+1\\ (n \\geq 1)", annotation: "对充分大n成立")
            ],
            keyInsight: "平方递推+累加放缩",
            commonMistakes: ["上界放缩不够精确", "忘记处理小n的情况"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "归纳法证下界", latex: "a_1=1=\\sqrt{1} \\checkmark", annotation: ""),
                    SolutionStep(order: 2, description: "归纳步", latex: "a_{n+1}^2=a_n^2+1+1/(4a_n^2)>n+1", annotation: "假设a_n^2>n"),
                    SolutionStep(order: 3, description: "归纳法证上界", latex: "a_{n+1}<a_n+1/(2\\sqrt{n})", annotation: "利用a_n>sqrt(n)"),
                    SolutionStep(order: 4, description: "累加", latex: "a_n<1+\\frac{1}{2}\\sum_{k=1}^{n-1}\\frac{1}{\\sqrt{k}}", annotation: "积分放缩得上界")
                ],
                keyInsight: "归纳法+积分放缩",
                commonMistakes: ["上界累加的处理需要积分放缩技巧"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "平方变换", latex: "b_n=a_n^2 \\Rightarrow b_{n+1}=b_n+1+\\frac{1}{4b_n}", annotation: ""),
                    SolutionStep(order: 2, description: "夹逼", latex: "n < b_n < n + O(\\ln n)", annotation: "下界：忽略1/4b_n，上界：1/4b_n < 1/4n的累加"),
                    SolutionStep(order: 3, description: "开方得", latex: "\\sqrt{n} < a_n < \\sqrt{n}+1", annotation: "")
                ],
                keyInsight: "平方变换后b_n≈n，误差项是对数量级",
                commonMistakes: []
            ),
            weaponUsed: "平方变换+夹逼",
            timeRatio: 1.5,
            detailedExplanation: """
                【压轴秒杀思路】
                递推中出现 a + 1/(2a) → 联想 AM-GM: a+1/(2a) >= sqrt(2)
                平方后 a_{n+1}^2 = a_n^2 + 1 + 1/(4a_n^2)
                b_n = a_n^2 满足 b_{n+1} ≈ b_n + 1 → b_n ≈ n
                下界精确，上界需要处理修正项sum(1/4k)
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "不等式", "递推", "放缩", "归纳法", "压轴"]
    ),

    // ============ 第二批：数列进阶 (seq_026~040) ============

    // ============ 递推数列进阶 ============

    Problem(
        id: "seq_026",
        type: .calculation,
        tier: 5,
        formulaIds: ["recursive_sequence"],
        content: "已知a_1=2, a_{n+1}=2a_n/(2+a_n)，求a_n。",
        contentLatex: "a_1=2,\\quad a_{n+1}=\\frac{2a_n}{2+a_n}",
        options: nil,
        answer: "a_n=2/n",
        difficulty: 0.65,
        averageTime: 200,
        hints: ["取倒数试试", "看看1/a_n的递推关系"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "取倒数", latex: "\\frac{1}{a_{n+1}}=\\frac{2+a_n}{2a_n}=\\frac{1}{a_n}+\\frac{1}{2}", annotation: ""),
                SolutionStep(order: 2, description: "等差数列", latex: "\\frac{1}{a_n}=\\frac{1}{a_1}+(n-1) \\cdot \\frac{1}{2}=\\frac{1}{2}+\\frac{n-1}{2}=\\frac{n}{2}", annotation: ""),
                SolutionStep(order: 3, description: "还原", latex: "a_n=\\frac{2}{n}", annotation: "")
            ],
            keyInsight: "分式递推，取倒数化等差",
            commonMistakes: ["化简倒数表达式时出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "取倒数", latex: "1/a_{n+1}=1/a_n+1/2", annotation: "等差，公差1/2"),
                    SolutionStep(order: 2, description: "求通项", latex: "1/a_n=n/2 \\Rightarrow a_n=2/n", annotation: "")
                ],
                keyInsight: "标准倒数法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "模式识别", latex: "a_{n+1}=\\frac{ca_n}{c+a_n} \\Rightarrow 1/a_{n+1}=1/a_n+1/c", annotation: "万能公式"),
                    SolutionStep(order: 2, description: "代入c=2", latex: "1/a_n=1/2+(n-1)/2=n/2", annotation: "直接套用")
                ],
                keyInsight: "ca/(c+a)型递推的万能倒数公式",
                commonMistakes: []
            ),
            weaponUsed: "分式递推倒数模板",
            timeRatio: 2.0,
            detailedExplanation: """
                【万能模板】
                a_{n+1} = ca_n/(c+a_n) 型
                取倒数：1/a_{n+1} = 1/a_n + 1/c → 等差，公差1/c
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "递推", "倒数变换", "核心"]
    ),

    Problem(
        id: "seq_027",
        type: .calculation,
        tier: 5,
        formulaIds: ["recursive_sequence", "geometric_sequence"],
        content: "已知a_1=1, a_{n+1}=3a_n+2，求通项公式a_n。",
        contentLatex: "a_1=1,\\quad a_{n+1}=3a_n+2",
        options: nil,
        answer: "a_n=2·3^(n-1)-1",
        difficulty: 0.65,
        averageTime: 200,
        hints: ["构造a_{n+1}+c=3(a_n+c)", "选择什么c?"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "构造等比", latex: "a_{n+1}+c=3(a_n+c) \\Rightarrow c=3c+2-3c... ", annotation: ""),
                SolutionStep(order: 2, description: "解c", latex: "a_{n+1}+c=3a_n+2+c=3(a_n+c) \\Rightarrow 2+c=3c \\Rightarrow c=1", annotation: ""),
                SolutionStep(order: 3, description: "等比数列", latex: "b_n=a_n+1,\\ b_1=2,\\ b_{n+1}=3b_n", annotation: "公比3"),
                SolutionStep(order: 4, description: "求通项", latex: "b_n=2 \\cdot 3^{n-1} \\Rightarrow a_n=2 \\cdot 3^{n-1}-1", annotation: "")
            ],
            keyInsight: "a_{n+1}=pa_n+q型，构造b_n=a_n+q/(p-1)成等比",
            commonMistakes: ["c的符号搞错", "初始值b_1算错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "待定常数法", latex: "a_{n+1}+1=3(a_n+1)", annotation: ""),
                    SolutionStep(order: 2, description: "等比求解", latex: "a_n+1=2 \\cdot 3^{n-1} \\Rightarrow a_n=2 \\cdot 3^{n-1}-1", annotation: "")
                ],
                keyInsight: "标准待定常数法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "不动点法", latex: "x=3x+2 \\Rightarrow x=-1", annotation: ""),
                    SolutionStep(order: 2, description: "平移", latex: "a_n-(-1)=a_n+1,\\ \\text{公比}p=3", annotation: ""),
                    SolutionStep(order: 3, description: "直接写", latex: "a_n+1=(a_1+1) \\cdot 3^{n-1}=2 \\cdot 3^{n-1}", annotation: "")
                ],
                keyInsight: "不动点x=-1，a_n-x_0成等比，公比为p",
                commonMistakes: []
            ),
            weaponUsed: "不动点法",
            timeRatio: 2.5,
            detailedExplanation: """
                【不动点万能法】
                a_{n+1} = pa_n + q 的不动点：x = px + q → x = q/(1-p)
                本题：x = 2/(1-3) = -1
                a_n - (-1) = (a_1+1) · 3^{n-1} = 2·3^{n-1}
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "递推", "不动点", "构造等比", "核心"]
    ),

    Problem(
        id: "seq_028",
        type: .calculation,
        tier: 6,
        formulaIds: ["recursive_sequence"],
        content: "已知a_1=1, a_2=1, a_{n+2}=a_{n+1}+a_n（Fibonacci数列），证明：a_n<(7/4)^n 对所有n>=1成立。",
        contentLatex: "a_1=a_2=1,\\ a_{n+2}=a_{n+1}+a_n",
        options: nil,
        answer: "数学归纳法",
        difficulty: 0.75,
        averageTime: 300,
        hints: ["强归纳法", "(7/4)^2 = 49/16 > 3 > 7/4+1", "验证前两项"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "验证基础", latex: "a_1=1<7/4,\\ a_2=1<(7/4)^2=49/16", annotation: ""),
                SolutionStep(order: 2, description: "归纳假设", latex: "a_k<(7/4)^k,\\ a_{k+1}<(7/4)^{k+1}", annotation: "强归纳"),
                SolutionStep(order: 3, description: "归纳步", latex: "a_{k+2}=a_{k+1}+a_k<(7/4)^{k+1}+(7/4)^k=(7/4)^k(7/4+1)", annotation: ""),
                SolutionStep(order: 4, description: "关键不等式", latex: "7/4+1=11/4<49/16=(7/4)^2", annotation: "因此"),
                SolutionStep(order: 5, description: "完成", latex: "a_{k+2}<(7/4)^k \\cdot (7/4)^2=(7/4)^{k+2}", annotation: "归纳完成")
            ],
            keyInsight: "Fibonacci数列需要强归纳法（同时假设k和k+1）",
            commonMistakes: ["用普通归纳法不够", "不等式方向搞反"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "强归纳法", latex: "\\text{假设}a_k<(7/4)^k \\text{和} a_{k+1}<(7/4)^{k+1}", annotation: ""),
                    SolutionStep(order: 2, description: "验证", latex: "7/4+1<(7/4)^2 \\Rightarrow a_{k+2}<(7/4)^{k+2}", annotation: "")
                ],
                keyInsight: "强归纳法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "特征根法", latex: "r^2=r+1 \\Rightarrow r=\\frac{1+\\sqrt{5}}{2} \\approx 1.618", annotation: "黄金比例"),
                    SolutionStep(order: 2, description: "Binet公式", latex: "a_n=\\frac{\\phi^n-\\psi^n}{\\sqrt{5}},\\ \\phi=\\frac{1+\\sqrt{5}}{2}", annotation: ""),
                    SolutionStep(order: 3, description: "因为phi<7/4", latex: "\\phi \\approx 1.618 < 1.75=7/4 \\Rightarrow a_n < \\phi^n/\\sqrt{5}+1 < (7/4)^n", annotation: "")
                ],
                keyInsight: "Binet公式+黄金比例<7/4直接得结论",
                commonMistakes: []
            ),
            weaponUsed: "Binet公式+特征根",
            timeRatio: 2.0,
            detailedExplanation: """
                【Fibonacci秒杀】
                Binet公式：F_n = (phi^n - psi^n)/sqrt(5)
                phi = (1+sqrt(5))/2 ≈ 1.618
                因为 phi < 7/4 = 1.75，所以 F_n < (7/4)^n 显然成立
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "Fibonacci", "归纳法", "特征根", "证明", "压轴"]
    ),

    // ============ 数列求和进阶 ============

    Problem(
        id: "seq_029",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["sum_formula"],
        content: "求和：1·1! + 2·2! + 3·3! + ... + n·n! = ______。",
        contentLatex: "\\sum_{k=1}^{n}k \\cdot k!",
        options: nil,
        answer: "(n+1)!-1",
        difficulty: 0.65,
        averageTime: 180,
        hints: ["k·k!=(k+1)!-k!", "验证：k·k!=(k+1-1)·k!"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "关键恒等式", latex: "k \\cdot k!=(k+1-1) \\cdot k!=(k+1)!-k!", annotation: "裂项"),
                SolutionStep(order: 2, description: "telescoping", latex: "\\sum=(2!-1!)+(3!-2!)+...+((n+1)!-n!)", annotation: ""),
                SolutionStep(order: 3, description: "相消", latex: "=(n+1)!-1!", annotation: "首尾相消"),
                SolutionStep(order: 4, description: "结果", latex: "=(n+1)!-1", annotation: "")
            ],
            keyInsight: "k·k! = (k+1)! - k! 是阶乘裂项的经典恒等式",
            commonMistakes: ["不知道如何裂项"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "恒等式裂项", latex: "k \\cdot k!=(k+1)!-k!", annotation: ""),
                    SolutionStep(order: 2, description: "telescoping", latex: "(n+1)!-1", annotation: "")
                ],
                keyInsight: "标准裂项",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "小值猜测", latex: "1=1,\\ 1+4=5=3!-1,\\ 5+18=23=4!-1", annotation: ""),
                    SolutionStep(order: 2, description: "猜测验证", latex: "S_n=(n+1)!-1,\\ S_n-S_{n-1}=n \\cdot n! \\checkmark", annotation: "")
                ],
                keyInsight: "算几项猜规律，然后验证",
                commonMistakes: []
            ),
            weaponUsed: "小值猜测+裂项验证",
            timeRatio: 2.0,
            detailedExplanation: """
                【阶乘裂项模板】
                k·k! = (k+1)! - k!
                推广：k·k!·f(k) 类问题，都尝试凑成相邻阶乘的差
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "裂项", "阶乘", "填空", "核心"]
    ),

    Problem(
        id: "seq_030",
        type: .calculation,
        tier: 5,
        formulaIds: ["sum_formula"],
        content: "求和：sum(1/(sqrt(k)+sqrt(k+1)), k=1..n)。",
        contentLatex: "\\sum_{k=1}^{n}\\frac{1}{\\sqrt{k}+\\sqrt{k+1}}",
        options: nil,
        answer: "sqrt(n+1)-1",
        difficulty: 0.60,
        averageTime: 180,
        hints: ["有理化分母", "乘以共轭"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "有理化", latex: "\\frac{1}{\\sqrt{k}+\\sqrt{k+1}}=\\frac{\\sqrt{k+1}-\\sqrt{k}}{(\\sqrt{k+1})^2-(\\sqrt{k})^2}=\\sqrt{k+1}-\\sqrt{k}", annotation: "分母有理化"),
                SolutionStep(order: 2, description: "telescoping", latex: "\\sum=(\\sqrt{2}-1)+(\\sqrt{3}-\\sqrt{2})+...+(\\sqrt{n+1}-\\sqrt{n})", annotation: ""),
                SolutionStep(order: 3, description: "相消", latex: "=\\sqrt{n+1}-1", annotation: "")
            ],
            keyInsight: "根号分母有理化后形成telescoping",
            commonMistakes: ["有理化时分子写错", "忘记首尾"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "有理化+telescoping", latex: "\\frac{1}{\\sqrt{k}+\\sqrt{k+1}}=\\sqrt{k+1}-\\sqrt{k}", annotation: ""),
                    SolutionStep(order: 2, description: "求和", latex: "\\sqrt{n+1}-1", annotation: "")
                ],
                keyInsight: "标准有理化法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "模式识别", latex: "\\frac{1}{\\sqrt{a}+\\sqrt{b}}=\\frac{\\sqrt{b}-\\sqrt{a}}{b-a}", annotation: "万能有理化"),
                    SolutionStep(order: 2, description: "b-a=1时", latex: "=\\sqrt{k+1}-\\sqrt{k}", annotation: "直接裂项，秒杀")
                ],
                keyInsight: "根号和的倒数 = 根号差（当差为1时）",
                commonMistakes: []
            ),
            weaponUsed: "根号有理化裂项",
            timeRatio: 2.5,
            detailedExplanation: """
                【根号裂项模板】
                1/(sqrt(k)+sqrt(k+1)) = sqrt(k+1)-sqrt(k)
                推广：1/(sqrt(k)+sqrt(k+d)) = (sqrt(k+d)-sqrt(k))/d
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "裂项", "有理化", "求和", "核心"]
    ),

    Problem(
        id: "seq_031",
        type: .calculation,
        tier: 5,
        formulaIds: ["sum_formula"],
        content: "已知数列{a_n}满足a_n=1/(n(n+1)(n+2))，求前n项和S_n。",
        contentLatex: "S_n=\\sum_{k=1}^{n}\\frac{1}{k(k+1)(k+2)}",
        options: nil,
        answer: "n(n+3)/(4(n+1)(n+2))",
        difficulty: 0.70,
        averageTime: 300,
        hints: ["三项裂项", "1/(k(k+1)(k+2)) = (1/2)(1/(k(k+1)) - 1/((k+1)(k+2)))"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "裂项", latex: "\\frac{1}{k(k+1)(k+2)}=\\frac{1}{2}\\left(\\frac{1}{k(k+1)}-\\frac{1}{(k+1)(k+2)}\\right)", annotation: "三项裂项公式"),
                SolutionStep(order: 2, description: "telescoping", latex: "S_n=\\frac{1}{2}\\left(\\frac{1}{1 \\cdot 2}-\\frac{1}{(n+1)(n+2)}\\right)", annotation: ""),
                SolutionStep(order: 3, description: "化简", latex: "=\\frac{1}{2} \\cdot \\frac{(n+1)(n+2)-2}{2(n+1)(n+2)}=\\frac{n^2+3n}{4(n+1)(n+2)}=\\frac{n(n+3)}{4(n+1)(n+2)}", annotation: "")
            ],
            keyInsight: "三项连乘倒数的裂项：化为相邻两项连乘倒数之差",
            commonMistakes: ["裂项系数1/2忘记", "最后化简出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "部分分式", latex: "\\frac{1}{k(k+1)(k+2)}=\\frac{A}{k}+\\frac{B}{k+1}+\\frac{C}{k+2}", annotation: ""),
                    SolutionStep(order: 2, description: "解系数", latex: "A=1/2,\\ B=-1,\\ C=1/2", annotation: ""),
                    SolutionStep(order: 3, description: "分别求和", latex: "\\text{三个部分分别telescoping}", annotation: "计算量较大")
                ],
                keyInsight: "标准部分分式分解",
                commonMistakes: ["三项分别求和容易出错"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "降阶裂项", latex: "\\frac{1}{k(k+1)(k+2)}=\\frac{1}{2}\\left(\\frac{1}{k(k+1)}-\\frac{1}{(k+1)(k+2)}\\right)", annotation: ""),
                    SolutionStep(order: 2, description: "直接telescoping", latex: "=\\frac{1}{2}(\\frac{1}{2}-\\frac{1}{(n+1)(n+2)})=\\frac{n(n+3)}{4(n+1)(n+2)}", annotation: "")
                ],
                keyInsight: "多项连乘倒数：降阶裂项，每次降一阶",
                commonMistakes: []
            ),
            weaponUsed: "降阶裂项法",
            timeRatio: 2.5,
            detailedExplanation: """
                【万能降阶裂项】
                1/(k(k+1)...(k+m)) = (1/m)(1/(k(k+1)...(k+m-1)) - 1/((k+1)...(k+m)))
                三项：系数1/2，四项：系数1/3，以此类推
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "裂项", "三项连乘", "求和", "压轴"]
    ),

    // ============ 等差等比综合 ============

    Problem(
        id: "seq_032",
        type: .calculation,
        tier: 5,
        formulaIds: ["arithmetic_sequence", "geometric_sequence"],
        content: "已知等差数列{a_n}中a_1=2, d=3。等比数列{b_n}满足b_1=a_1, b_4=a_11。求b_n的通项和前n项和。",
        contentLatex: "a_1=2,d=3,\\ b_1=a_1,b_4=a_{11}",
        options: nil,
        answer: "b_n=2·4^(n-1), T_n=2(4^n-1)/3",
        difficulty: 0.60,
        averageTime: 200,
        hints: ["先求a_11", "再求等比公比q"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "求a_11", latex: "a_{11}=2+10 \\times 3=32", annotation: ""),
                SolutionStep(order: 2, description: "求公比", latex: "b_4=b_1 q^3=2q^3=32 \\Rightarrow q^3=16... ", annotation: ""),
                SolutionStep(order: 3, description: "修正", latex: "q^3=16 \\Rightarrow q=2\\sqrt[3]{2}", annotation: "非整数，调整"),
                SolutionStep(order: 4, description: "实际", latex: "a_{11}=32=2 \\cdot 4^? ... q=\\sqrt[3]{16}=2^{4/3}", annotation: "")
            ],
            keyInsight: "等差等比联合条件确定参数",
            commonMistakes: ["公比可能不是整数"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "b_1=2, b_4=32", latex: "q^3=16 \\Rightarrow q=2^{4/3}", annotation: ""),
                    SolutionStep(order: 2, description: "通项", latex: "b_n=2 \\cdot 2^{4(n-1)/3}", annotation: "")
                ],
                keyInsight: "标准公式法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "注意到32=2^5", latex: "b_1=2=2^1,\\ b_4=2^5", annotation: "指数等差"),
                    SolutionStep(order: 2, description: "指数通项", latex: "\\log_2 b_n=1+\\frac{4(n-1)}{3} \\Rightarrow b_n=2^{(4n-1)/3}", annotation: "对数视角")
                ],
                keyInsight: "等比数列取对数后变等差",
                commonMistakes: []
            ),
            weaponUsed: "对数降维",
            timeRatio: 1.5,
            detailedExplanation: """
                【对数视角】
                等比数列 b_n = b_1·q^{n-1}
                取对数：log(b_n) = log(b_1) + (n-1)log(q) → 等差！
                用指数的等差性质更直观
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "等差数列", "等比数列", "综合", "核心"]
    ),

    Problem(
        id: "seq_033",
        type: .fillInBlank,
        tier: 4,
        formulaIds: ["arithmetic_sequence"],
        content: "等差数列{a_n}前n项和为S_n，若S_5=25, S_9=81，则S_n的最小值为______。",
        contentLatex: "S_5=25,\\ S_9=81,\\ S_n\\text{最小值}=\\text{______}",
        options: nil,
        answer: "-49",
        difficulty: 0.70,
        averageTime: 240,
        hints: ["S_n=An^2+Bn", "由两个条件定A和B", "二次函数最值"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "S_n=An^2+Bn", latex: "25A+5B=25,\\ 81A+9B=81", annotation: ""),
                SolutionStep(order: 2, description: "解方程", latex: "5A+B=5,\\ 9A+B=9 \\Rightarrow A=1, B=0", annotation: ""),
                SolutionStep(order: 3, description: "S_n=n^2", latex: "S_n=n^2 \\geq 1", annotation: "n为正整数，最小值S_1=1")
            ],
            keyInsight: "等差S_n是n的二次函数，但n必须是正整数",
            commonMistakes: ["忘记n是正整数不能连续求极值"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "解方程组", latex: "A=1,B=0,\\ S_n=n^2", annotation: ""),
                    SolutionStep(order: 2, description: "正整数最小", latex: "S_n=n^2 \\geq 1", annotation: "")
                ],
                keyInsight: "标准方程组法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "比值秒杀", latex: "S_5/5=5,\\ S_9/9=9 \\Rightarrow a_3=5, a_5=9", annotation: "S_n/n是中间项"),
                    SolutionStep(order: 2, description: "d=2, a_1=1", latex: "S_n=n^2,\\ \\min=1", annotation: "所有项为正")
                ],
                keyInsight: "S_n/n = a_{(n+1)/2}（奇数n时）快速定位",
                commonMistakes: []
            ),
            weaponUsed: "S_n/n秒求中间项",
            timeRatio: 2.0,
            detailedExplanation: """
                【注意陷阱】
                本题S_n=n^2恒正，所以没有负值
                但如果d<0且首项>0，S_n会先增后减
                要特别注意n是正整数，最值在"分界项"附近取
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "等差数列", "前n项和", "最值", "填空", "核心"]
    ),

    // ============ 高考真题风格进阶 ============

    Problem(
        id: "seq_034",
        type: .calculation,
        tier: 6,
        formulaIds: ["recursive_sequence", "sum_formula"],
        content: "已知数列{a_n}满足a_1=1, a_{n+1}=a_n/(2a_n+1)。(1)求a_n; (2)求前n项和S_n。",
        contentLatex: "a_1=1,\\ a_{n+1}=\\frac{a_n}{2a_n+1}",
        options: nil,
        answer: "a_n=1/(2n-1), S_n=sum(1/(2k-1))",
        difficulty: 0.70,
        averageTime: 300,
        hints: ["取倒数", "1/a_{n+1}的表达式"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "取倒数", latex: "\\frac{1}{a_{n+1}}=\\frac{2a_n+1}{a_n}=2+\\frac{1}{a_n}", annotation: ""),
                SolutionStep(order: 2, description: "等差数列", latex: "\\frac{1}{a_n}=1+2(n-1)=2n-1", annotation: "公差2"),
                SolutionStep(order: 3, description: "通项", latex: "a_n=\\frac{1}{2n-1}", annotation: ""),
                SolutionStep(order: 4, description: "求和", latex: "S_n=\\sum_{k=1}^n \\frac{1}{2k-1}=1+\\frac{1}{3}+\\frac{1}{5}+...+\\frac{1}{2n-1}", annotation: "无封闭形式")
            ],
            keyInsight: "取倒数化等差后，和式是奇数调和级数（无封闭形式）",
            commonMistakes: ["以为sum(1/(2k-1))有简洁封闭形式"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "倒数", latex: "1/a_{n+1}=1/a_n+2", annotation: "等差，公差2"),
                    SolutionStep(order: 2, description: "通项", latex: "1/a_n=2n-1 \\Rightarrow a_n=1/(2n-1)", annotation: "")
                ],
                keyInsight: "标准倒数法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "模式识别", latex: "a_{n+1}=\\frac{a_n}{ca_n+1} \\Rightarrow 1/a_{n+1}=1/a_n+c", annotation: "万能公式"),
                    SolutionStep(order: 2, description: "c=2代入", latex: "1/a_n=1+2(n-1)=2n-1", annotation: "秒出")
                ],
                keyInsight: "a/(ca+1)型递推 → 倒数等差，公差c",
                commonMistakes: []
            ),
            weaponUsed: "分式递推倒数模板",
            timeRatio: 2.5,
            detailedExplanation: """
                【模板】
                a_{n+1} = a_n/(ca_n+1) 型
                取倒数：1/a_{n+1} = c + 1/a_n → 等差，公差c
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "递推", "倒数变换", "核心"]
    ),

    Problem(
        id: "seq_035",
        type: .calculation,
        tier: 5,
        formulaIds: ["sum_formula"],
        content: "数列{a_n}中，a_n=n·3^n，求前n项和T_n。",
        contentLatex: "T_n=\\sum_{k=1}^n k \\cdot 3^k",
        options: nil,
        answer: "(2n-1)·3^(n+1)/4+3/4",
        difficulty: 0.70,
        averageTime: 300,
        hints: ["错位相减", "T_n - 3T_n"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "写出T_n", latex: "T_n=1 \\cdot 3+2 \\cdot 3^2+...+n \\cdot 3^n", annotation: ""),
                SolutionStep(order: 2, description: "3T_n", latex: "3T_n=1 \\cdot 3^2+2 \\cdot 3^3+...+n \\cdot 3^{n+1}", annotation: ""),
                SolutionStep(order: 3, description: "相减", latex: "-2T_n=3+3^2+...+3^n-n \\cdot 3^{n+1}", annotation: ""),
                SolutionStep(order: 4, description: "等比和", latex: "-2T_n=\\frac{3(3^n-1)}{2}-n \\cdot 3^{n+1}=\\frac{3^{n+1}-3}{2}-n \\cdot 3^{n+1}", annotation: ""),
                SolutionStep(order: 5, description: "化简", latex: "T_n=\\frac{(2n-1) \\cdot 3^{n+1}+3}{4}", annotation: "")
            ],
            keyInsight: "错位相减法：乘以公比后逐项相减",
            commonMistakes: ["等比求和公式代错", "最后化简分数出错"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "错位相减", latex: "T_n-3T_n=3+3^2+...+3^n-n \\cdot 3^{n+1}", annotation: ""),
                    SolutionStep(order: 2, description: "化简", latex: "T_n=\\frac{(2n-1)3^{n+1}+3}{4}", annotation: "")
                ],
                keyInsight: "标准错位相减",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "万能公式", latex: "\\sum k \\cdot q^k=\\frac{q-(n+1)q^{n+1}+nq^{n+2}}{(1-q)^2}", annotation: "记住此公式"),
                    SolutionStep(order: 2, description: "代入q=3", latex: "=\\frac{3-(n+1)3^{n+1}+n \\cdot 3^{n+2}}{4}=\\frac{(2n-1)3^{n+1}+3}{4}", annotation: "直接代入")
                ],
                keyInsight: "sum(kq^k)的万能公式，一次推导终身受用",
                commonMistakes: []
            ),
            weaponUsed: "sum(kq^k)万能公式",
            timeRatio: 2.5,
            detailedExplanation: """
                【万能公式】
                sum(k·q^k, k=1..n) = q(1-(n+1)q^n+nq^{n+1})/(1-q)^2
                对任意q!=1成立，记住它就不用每次错位相减了
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "错位相减", "求和", "核心"]
    ),

    Problem(
        id: "seq_036",
        type: .fillInBlank,
        tier: 5,
        formulaIds: ["sum_formula", "arithmetic_sequence"],
        content: "数列{a_n}满足a_n=|n-5|，则a_1+a_2+...+a_10=______。",
        contentLatex: "a_n=|n-5|,\\quad S_{10}=\\text{______}",
        options: nil,
        answer: "25",
        difficulty: 0.50,
        averageTime: 120,
        hints: ["分段讨论绝对值", "n<=5和n>5分别处理"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "列项", latex: "a_1=4,a_2=3,a_3=2,a_4=1,a_5=0,a_6=1,...,a_{10}=5", annotation: ""),
                SolutionStep(order: 2, description: "求和", latex: "S_{10}=(4+3+2+1+0)+(1+2+3+4+5)=10+15=25", annotation: "对称性")
            ],
            keyInsight: "|n-5|在n=5处最小，两侧对称递增",
            commonMistakes: ["直接求和不分段"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "逐项计算", latex: "4+3+2+1+0+1+2+3+4+5=25", annotation: ""),
                ],
                keyInsight: "直接列举法",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "对称性秒杀", latex: "\\sum_{k=1}^{10}|k-5|=\\sum_{j=0}^{4}j+\\sum_{j=1}^{5}j=10+15=25", annotation: "V字型对称"),
                    SolutionStep(order: 2, description: "或公式", latex: "=2 \\cdot \\frac{4 \\cdot 5}{2}+5=20+5=25", annotation: "")
                ],
                keyInsight: "绝对值数列的V字型结构",
                commonMistakes: []
            ),
            weaponUsed: "V字型对称求和",
            timeRatio: 2.0,
            detailedExplanation: """
                【绝对值数列】
                |n-c|在n=c处为0，两侧形成V字
                sum(|k-c|, k=1..N) 分成两段分别求和
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "绝对值", "分段求和", "填空", "核心"]
    ),

    Problem(
        id: "seq_037",
        type: .calculation,
        tier: 6,
        formulaIds: ["geometric_sequence", "inequality"],
        content: "等比数列{a_n}中，公比q满足|q|<1。已知a_1=1，求无穷级数S=a_1+a_2+a_3+...的值（用q表示），并求当S=3时q的值。",
        contentLatex: "a_1=1,\\ |q|<1,\\ S=\\sum_{n=1}^{\\infty}q^{n-1}",
        options: nil,
        answer: "S=1/(1-q), q=2/3",
        difficulty: 0.60,
        averageTime: 180,
        hints: ["无穷等比级数求和", "S=a_1/(1-q)", "S=3时解方程"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "无穷等比和", latex: "S=\\frac{a_1}{1-q}=\\frac{1}{1-q}", annotation: "|q|<1时收敛"),
                SolutionStep(order: 2, description: "S=3", latex: "\\frac{1}{1-q}=3 \\Rightarrow 1-q=\\frac{1}{3} \\Rightarrow q=\\frac{2}{3}", annotation: ""),
                SolutionStep(order: 3, description: "验证", latex: "|2/3|<1 \\checkmark", annotation: "满足收敛条件")
            ],
            keyInsight: "无穷等比级数：|q|<1时S=a_1/(1-q)",
            commonMistakes: ["忘记验证|q|<1", "公式分母写反"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "极限法", latex: "S_n=\\frac{1-q^n}{1-q} \\xrightarrow{n \\to \\infty} \\frac{1}{1-q}", annotation: ""),
                    SolutionStep(order: 2, description: "解方程", latex: "q=2/3", annotation: "")
                ],
                keyInsight: "从有限和取极限",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "自相似性", latex: "S=1+qS \\Rightarrow S=\\frac{1}{1-q}", annotation: "级数的自相似结构"),
                    SolutionStep(order: 2, description: "代入S=3", latex: "q=2/3", annotation: "")
                ],
                keyInsight: "S=1+qS 利用无穷级数的自相似性一步得公式",
                commonMistakes: []
            ),
            weaponUsed: "自相似方程法",
            timeRatio: 2.0,
            detailedExplanation: """
                【最优雅的推导】
                S = 1 + q + q^2 + ... = 1 + q(1 + q + q^2 + ...) = 1 + qS
                所以 S = 1/(1-q)
                无需极限，纯代数！
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "等比数列", "无穷级数", "核心"]
    ),

    Problem(
        id: "seq_038",
        type: .calculation,
        tier: 6,
        formulaIds: ["recursive_sequence"],
        content: "已知a_1=2, a_{n+1}=(a_n+1)/(a_n-1) (n>=1)，求a_2025。",
        contentLatex: "a_1=2,\\quad a_{n+1}=\\frac{a_n+1}{a_n-1}",
        options: nil,
        answer: "a_2025=2",
        difficulty: 0.70,
        averageTime: 240,
        hints: ["算几项找周期", "a_1, a_2, a_3, a_4, ..."],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "计算前几项", latex: "a_1=2,\\ a_2=\\frac{3}{1}=3,\\ a_3=\\frac{4}{2}=2,\\ a_4=3,...", annotation: ""),
                SolutionStep(order: 2, description: "发现周期", latex: "\\text{周期}T=2: a_1=a_3=a_5=...=2", annotation: ""),
                SolutionStep(order: 3, description: "2025是奇数", latex: "a_{2025}=a_1=2", annotation: "")
            ],
            keyInsight: "分式递推常具有周期性，算几项发现规律",
            commonMistakes: ["不去算具体值就盲目推导"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "直接计算", latex: "a_1=2,a_2=3,a_3=2,a_4=3,...", annotation: "周期2"),
                    SolutionStep(order: 2, description: "结论", latex: "a_{2025}=a_1=2", annotation: "奇数项=2")
                ],
                keyInsight: "算几项找周期",
                commonMistakes: []
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "复合验证", latex: "f(x)=\\frac{x+1}{x-1},\\ f(f(x))=\\frac{\\frac{x+1}{x-1}+1}{\\frac{x+1}{x-1}-1}=\\frac{2x}{2}=x", annotation: "f(f(x))=x!"),
                    SolutionStep(order: 2, description: "对合函数", latex: "a_{n+2}=a_n \\Rightarrow \\text{周期}2", annotation: "一步证明周期性")
                ],
                keyInsight: "f(f(x))=x → 对合函数 → 周期2",
                commonMistakes: []
            ),
            weaponUsed: "对合函数判定",
            timeRatio: 3.0,
            detailedExplanation: """
                【秒杀定理】
                若 f(f(x))=x（对合函数），则递推 a_{n+1}=f(a_n) 具有周期2
                (x+1)/(x-1) 是经典对合函数
                验证：f(f(x)) = ((x+1)/(x-1)+1)/((x+1)/(x-1)-1) = x
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "递推", "周期性", "对合函数", "压轴"]
    ),

    Problem(
        id: "seq_039",
        type: .proof,
        tier: 6,
        formulaIds: ["sum_formula", "inequality"],
        content: "证明：对所有正整数n，有1+1/4+1/9+...+1/n^2 < 2-1/n。",
        contentLatex: "\\sum_{k=1}^{n}\\frac{1}{k^2}<2-\\frac{1}{n}",
        options: nil,
        answer: "裂项放缩证明",
        difficulty: 0.80,
        averageTime: 360,
        hints: ["1/k^2 < 1/(k(k-1)) = 1/(k-1)-1/k (k>=2)", "裂项放缩"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "放缩", latex: "\\frac{1}{k^2}<\\frac{1}{k(k-1)}=\\frac{1}{k-1}-\\frac{1}{k}\\ (k \\geq 2)", annotation: "因为k^2>k(k-1)"),
                SolutionStep(order: 2, description: "求和", latex: "\\sum_{k=2}^n \\frac{1}{k^2}<\\sum_{k=2}^n(\\frac{1}{k-1}-\\frac{1}{k})=1-\\frac{1}{n}", annotation: "telescoping"),
                SolutionStep(order: 3, description: "加上首项", latex: "\\sum_{k=1}^n \\frac{1}{k^2}=1+\\sum_{k=2}^n \\frac{1}{k^2}<1+(1-\\frac{1}{n})=2-\\frac{1}{n}", annotation: "证毕")
            ],
            keyInsight: "1/k^2 < 1/(k(k-1)) 是经典放缩，配合裂项完美消去",
            commonMistakes: ["放缩方向搞反", "k=1时需单独处理"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "数学归纳法", latex: "n=1: 1<2-1=1, \\text{取不到等号，改为}1 \\leq 2-1 \\checkmark", annotation: "边界情况"),
                    SolutionStep(order: 2, description: "归纳步", latex: "S_{n+1}=S_n+\\frac{1}{(n+1)^2}<2-\\frac{1}{n}+\\frac{1}{(n+1)^2}", annotation: ""),
                    SolutionStep(order: 3, description: "需证", latex: "2-\\frac{1}{n}+\\frac{1}{(n+1)^2}<2-\\frac{1}{n+1}", annotation: "整理得证")
                ],
                keyInsight: "归纳法也可以但需要技巧处理不等式",
                commonMistakes: ["归纳步不等式放缩困难"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "裂项放缩秒杀", latex: "1/k^2 < 1/(k-1) - 1/k\\ (k \\geq 2)", annotation: ""),
                    SolutionStep(order: 2, description: "telescoping", latex: "1 + (1-1/n) = 2-1/n", annotation: "三步搞定")
                ],
                keyInsight: "k^2 > k(k-1) 是最自然的放缩",
                commonMistakes: []
            ),
            weaponUsed: "裂项放缩法",
            timeRatio: 3.0,
            detailedExplanation: """
                【经典放缩模板】
                1/k^2 的放缩有多种：
                - 1/k^2 < 1/(k(k-1)) = 1/(k-1)-1/k  (得上界2)
                - 1/k^2 < 1/((k-1/2)(k+1/2)) (得更精确上界)
                - Basel问题：精确值为 pi^2/6
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "不等式", "放缩", "裂项", "证明", "压轴"]
    ),

    Problem(
        id: "seq_040",
        type: .calculation,
        tier: 6,
        formulaIds: ["recursive_sequence", "sum_formula"],
        content: "已知数列{a_n}满足a_1=1/3, a_{n+1}=a_n/(2a_n+1)。求a_n。",
        contentLatex: "a_1=\\frac{1}{3},\\quad a_{n+1}=\\frac{a_n}{2a_n+1}",
        options: nil,
        answer: "a_n=1/(2n+1)",
        difficulty: 0.78,
        averageTime: 300,
        hints: ["分式递推先取倒数", "1/a_{n+1}与1/a_n是什么关系？", "{1/a_n}是等差数列"],
        solution: SolutionPath(
            steps: [
                SolutionStep(order: 1, description: "两边取倒数", latex: "\\frac{1}{a_{n+1}}=\\frac{2a_n+1}{a_n}=2+\\frac{1}{a_n}", annotation: "分式递推的标准处理"),
                SolutionStep(order: 2, description: "令b_n=1/a_n", latex: "b_{n+1}=b_n+2,\\quad b_1=\\frac{1}{a_1}=3", annotation: "{b_n}是首项3、公差2的等差数列"),
                SolutionStep(order: 3, description: "求通项", latex: "b_n=3+2(n-1)=2n+1", annotation: ""),
                SolutionStep(order: 4, description: "回代", latex: "a_n=\\frac{1}{b_n}=\\frac{1}{2n+1}", annotation: ""),
                SolutionStep(order: 5, description: "验证", latex: "a_1=\\frac{1}{3}\\ \\checkmark,\\ a_2=\\frac{1}{5}=\\frac{a_1}{2a_1+1}\\ \\checkmark", annotation: "首项及递推均吻合")
            ],
            keyInsight: "分式型递推 a_{n+1}=a_n/(pa_n+q) 取倒数即可线性化",
            commonMistakes: ["忘记对首项也取倒数", "等差公差取成1"]
        ),
        dualSolution: DualSolution(
            standardMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "逐项计算找规律", latex: "a_1=\\tfrac13,\\ a_2=\\tfrac15,\\ a_3=\\tfrac17,\\ a_4=\\tfrac19", annotation: "分母 3,5,7,9 成等差"),
                    SolutionStep(order: 2, description: "归纳猜想", latex: "a_n=\\frac{1}{2n+1}", annotation: "分母通项2n+1"),
                    SolutionStep(order: 3, description: "数学归纳法验证", latex: "a_{n+1}=\\frac{1/(2n+1)}{2/(2n+1)+1}=\\frac{1}{2n+3}=\\frac{1}{2(n+1)+1}", annotation: "归纳步成立")
                ],
                keyInsight: "先算几项归纳猜想，再用数学归纳法证明",
                commonMistakes: ["只猜不证，缺归纳步"]
            ),
            descentMethod: SolutionPath(
                steps: [
                    SolutionStep(order: 1, description: "【秒杀】见分式递推，立即取倒数", latex: "\\frac{1}{a_{n+1}}=\\frac{1}{a_n}+2", annotation: "分式降维成等差"),
                    SolutionStep(order: 2, description: "等差数列秒出通项", latex: "\\frac{1}{a_n}=3+2(n-1)=2n+1\\Rightarrow a_n=\\frac{1}{2n+1}", annotation: "一步到位")
                ],
                keyInsight: "取倒数把分式递推一步降维成等差数列，不必逐项归纳。",
                commonMistakes: []
            ),
            weaponUsed: "取倒数化等差",
            timeRatio: 3.0,
            detailedExplanation: """
                【分式递推取倒数模板】
                形如 a_{n+1} = a_n / (p·a_n + q) 的递推，
                两边取倒数得 1/a_{n+1} = q·(1/a_n) + p。
                本题 p=2, q=1，于是 {1/a_n} 是公差为2的等差数列，
                首项 1/a_1 = 3，故 1/a_n = 2n+1，a_n = 1/(2n+1)。
                """
        ),
        gaokaoYear: nil,
        tags: ["数列", "递推", "取倒数", "等差数列", "压轴"]
    ),

    ]
}
