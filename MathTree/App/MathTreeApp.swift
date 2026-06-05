import SwiftUI

@main
struct MathTreeApp: App {
    @StateObject private var profile = StudentProfile()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(profile)
        }
    }
}

/// 启动先展示宣传页(赋予特殊能力「降维秒杀」)，再进入主界面。
struct RootView: View {
    @State private var entered = false

    var body: some View {
        ZStack {
            if entered {
                MainTabView()
                    .transition(.opacity)
            } else {
                PromoView {
                    withAnimation(.easeInOut(duration: 0.45)) { entered = true }
                }
                .transition(.opacity)
            }
        }
    }
}

struct MainTabView: View {
    @State private var selectedTab = 0

    init() {
        // TabBar adapts to light/dark automatically via system defaults
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            CommandCenterView(selectedTab: $selectedTab)
                .tabItem {
                    Label("探索", systemImage: "leaf.fill")
                }
                .tag(0)

            BattlefieldView()
                .tabItem {
                    Label("练习", systemImage: "target")
                }
                .tag(1)

            ErrorBookView()
                .tabItem {
                    Label("错题", systemImage: "exclamationmark.triangle")
                }
                .tag(2)

            FormulaUniverseView()
                .tabItem {
                    Label("公式", systemImage: "aqi.medium")
                }
                .tag(4)

            MoreView()
                .tabItem {
                    Label("更多", systemImage: "ellipsis.circle")
                }
                .tag(5)
        }
        .tint(.apexLava)
    }
}

/// 「更多」标签页：收纳 数学发现 与 人物，统一提供导航。
struct MoreView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        MysteryRoomView()
                    } label: {
                        Label("数学发现", systemImage: "magnifyingglass")
                    }
                    NavigationLink {
                        HeroesView()
                    } label: {
                        Label("数学英雄", systemImage: "star.fill")
                    }
                } header: {
                    Text("探索更多")
                }
            }
            .navigationTitle("更多")
        }
    }
}
