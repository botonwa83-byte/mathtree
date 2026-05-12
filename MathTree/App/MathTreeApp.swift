import SwiftUI

@main
struct MathTreeApp: App {
    @StateObject private var profile = StudentProfile()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(profile)
        }
    }
}

struct MainTabView: View {
    @State private var selectedTab = 0

    init() {
        // Customize TabBar appearance for Deep Space theme
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.apexDeepSurface)
        
        // Unselected items
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.secondaryLabel
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.secondaryLabel]
        
        // Selected items
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.apexDeepActive)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color.apexDeepActive)]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            CommandCenterView()
                .tabItem {
                    Label("指挥台", systemImage: "terminal.fill")
                }
                .tag(0)

            BattlefieldView()
                .tabItem {
                    Label("战场", systemImage: "target")
                }
                .tag(1)

            MysteryRoomView()
                .tabItem {
                    Label("悬案室", systemImage: "magnifyingglass.circle.fill")
                }
                .tag(2)

            FormulaUniverseView()
                .tabItem {
                    Label("宇宙", systemImage: "aqi.medium")
                }
                .tag(3)

            HeroesView()
                .tabItem {
                    Label("英雄录", systemImage: "shield.fill")
                }
                .tag(4)
        }
        .tint(.apexDeepActive)
    }
}
