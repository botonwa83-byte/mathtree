import SwiftUI

struct HeroesView: View {
    @State private var heroes: [MathHero] = SampleData.heroes

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    heroesHeader

                    ForEach(heroes) { hero in
                        NavigationLink {
                            HeroDetailView(hero: hero)
                        } label: {
                            HeroCard(hero: hero)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
            }
            .background(Color.apexDeepBackground)
            .navigationTitle("人物")
        }
    }

    private var heroesHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "person.crop.circle.badge.checkmark")
                    .foregroundColor(.apexDeepActive)
                    .font(.title2)
                Text("数学家殿堂")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            Text("每一位改变了数学历史的传奇人物")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(
            LinearGradient(
                colors: [Color.apexDeepActive.opacity(0.15), Color.apexDeepBackground],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(20)
    }
}

struct HeroCard: View {
    let hero: MathHero

    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.apexDeepActive.opacity(0.15))
                    .frame(width: 64, height: 64)
                Text(hero.portraitEmoji)
                    .font(.system(size: 32))
            }

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(hero.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(hero.nameEN)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Text(hero.era)
                    .font(.caption)
                    .foregroundColor(.apexDeepActive)

                attributeBar(hero.attributes)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding(20)
        .background(Color.apexDeepSurface)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 8, y: 4)
    }

    private func attributeBar(_ attrs: HeroAttributes) -> some View {
        HStack(spacing: 12) {
            AttributeMini(label: "洞察", value: attrs.insight)
            AttributeMini(label: "创造", value: attrs.creativity)
            AttributeMini(label: "毅力", value: attrs.perseverance)
            AttributeMini(label: "影响", value: attrs.influence)
        }
    }
}

struct AttributeMini: View {
    let label: String
    let value: Int

    var body: some View {
        VStack(spacing: 2) {
            Text("\(value)")
                .font(.caption2)
                .fontWeight(.bold)
                .foregroundColor(.apexDeepBrand)
            Text(label)
                .font(.system(size: 8))
                .foregroundColor(.secondary)
        }
    }
}

struct HeroDetailView: View {
    let hero: MathHero

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                heroHeader
                storySection
                quoteSection
                weaponsSection
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            .padding(.bottom, 40)
        }
        .background(Color.apexDeepBackground)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var heroHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.apexDeepActive.opacity(0.15))
                    .frame(width: 100, height: 100)
                Text(hero.portraitEmoji)
                    .font(.system(size: 56))
            }

            Text(hero.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(hero.nameEN)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text(hero.era)
                .font(.caption)
                .foregroundColor(.apexDeepActive)

            HStack(spacing: 24) {
                AttributeView(label: "洞察力", value: hero.attributes.insight, color: .apexDeepStar)
                AttributeView(label: "创造力", value: hero.attributes.creativity, color: .apexDeepBrand)
                AttributeView(label: "毅力", value: hero.attributes.perseverance, color: .apexDeepActive)
                AttributeView(label: "影响力", value: hero.attributes.influence, color: .apexGold)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(Color.apexDeepSurface)
        .cornerRadius(20)
    }

    private var storySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("传奇故事", systemImage: "book.fill")
                .font(.headline)
                .foregroundColor(.apexDeepBrand)

            Text(hero.legendStory)
                .font(.body)
                .foregroundColor(.white.opacity(0.9))
                .lineSpacing(6)
        }
        .padding(20)
        .background(Color.apexDeepSurface)
        .cornerRadius(20)
    }

    private var quoteSection: some View {
        VStack(spacing: 12) {
            Image(systemName: "quote.opening")
                .font(.title2)
                .foregroundColor(.apexDeepBrand.opacity(0.5))

            Text(hero.famousQuote)
                .font(.body)
                .italic()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .lineSpacing(6)

            Text("— \(hero.name)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(
            LinearGradient(
                colors: [Color.apexDeepBrand.opacity(0.1), Color.apexDeepSurface],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(20)
    }

    private var weaponsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("武器技能", systemImage: "sparkles")
                .font(.headline)
                .foregroundColor(.apexDeepActive)

            ForEach(hero.weaponSkills, id: \.self) { skill in
                HStack(spacing: 12) {
                    Image(systemName: "bolt.fill")
                        .foregroundColor(.apexDeepActive)
                        .font(.caption)
                    Text(skill)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(12)
                .background(Color.apexDeepActive.opacity(0.1))
                .cornerRadius(10)
            }
        }
        .padding(20)
        .background(Color.apexDeepSurface)
        .cornerRadius(20)
    }
}

struct AttributeView: View {
    let label: String
    let value: Int
    let color: Color

    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                Circle()
                    .stroke(color.opacity(0.3), lineWidth: 3)
                    .frame(width: 40, height: 40)
                Circle()
                    .trim(from: 0, to: CGFloat(value) / 10.0)
                    .stroke(color, lineWidth: 3)
                    .frame(width: 40, height: 40)
                    .rotationEffect(.degrees(-90))
                Text("\(value)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(color)
            }
            Text(label)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }
}
