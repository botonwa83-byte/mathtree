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

/// 启动流程：宣传页 → 登录页（可跳过）→ 主界面。
struct RootView: View {
    @StateObject private var auth = AuthManager.shared
    @StateObject private var appearance = AppearanceManager.shared
    @State private var passedPromo = false

    var body: some View {
        ZStack {
            if !passedPromo {
                PromoView {
                    withAnimation(.easeInOut(duration: 0.45)) { passedPromo = true }
                }
                .transition(.opacity)
            } else if !auth.hasPassedGate {
                LoginView()
                    .transition(.opacity)
            } else {
                MainTabView()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.35), value: auth.hasPassedGate)
        // 用户外观偏好覆盖整个窗口（含弹出的 sheet）；.system 时为 nil 不覆盖。
        .preferredColorScheme(appearance.colorScheme)
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

            FormulaUniverseView()
                .tabItem {
                    Label("公式", systemImage: "function")
                }
                .tag(2)

            MoreView()
                .tabItem {
                    Label("更多", systemImage: "ellipsis.circle")
                }
                .tag(3)
        }
        .tint(.apexLava)
    }
}

/// 「更多」标签页：收纳 个人中心、数学发现 与 人物，统一提供导航。
struct MoreView: View {
    @ObservedObject private var auth = AuthManager.shared

    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.title)
                                .foregroundColor(.apexLava)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(auth.currentUser?.nickname ?? "未登录")
                                    .font(.headline).foregroundColor(.primary)
                                Text(auth.currentUser?.maskedPhone ?? "登录 / 查看隐私政策与用户协议")
                                    .font(.caption).foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }

                Section {
                    NavigationLink {
                        ErrorBookView()
                    } label: {
                        Label("错题本", systemImage: "exclamationmark.triangle")
                    }
                } header: {
                    Text("我的练习")
                }

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
