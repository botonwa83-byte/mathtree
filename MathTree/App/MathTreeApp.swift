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
        // Customize TabBar appearance for Rainbow Fresh theme
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.apexCardSurface)
        
        // Unselected items
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.systemGray2
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemGray2]
        
        // Selected items
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.apexLava)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color.apexLava)]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            CommandCenterView()
                .tabItem {
                    Label("探索", systemImage: "leaf.fill")
                }
                .tag(0)

            BattlefieldView()
                .tabItem {
                    Label("练习", systemImage: "target")
                }
                .tag(1)

            MysteryRoomView()
                .tabItem {
                    Label("发现", systemImage: "magnifyingglass")
                }
                .tag(2)

            FormulaUniverseView()
                .tabItem {
                    Label("公式", systemImage: "aqi.medium")
                }
                .tag(3)

            HeroesView()
                .tabItem {
                    Label("人物", systemImage: "star.fill")
                }
                .tag(4)
        }
        .tint(.apexLava)
    }
}
