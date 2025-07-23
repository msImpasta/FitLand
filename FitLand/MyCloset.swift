import SwiftUI

struct ClosetItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let cost: Int
}

struct MyCloset: View {
    let items = [
        ClosetItem(name: "Character Upgrade 1", imageName: "peasant", cost: 0),
        ClosetItem(name: "Character Upgrade 2", imageName: "Character", cost: 20000),
        ClosetItem(name: "Character Upgrade 3", imageName: "guy", cost: 40000),
    ]

    @State private var points = 200
    @State private var ownedItems: Set<UUID> = []
    @State private var selectedImageName: String = "peasant"

    var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ZStack {
                Image("Closet")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    // Top Bar
                    VStack(spacing: 10) {
                        Text("Points: \(points)")
                            .font(.title2)
                            .bold()
                        Text("My Character")
                            .font(.largeTitle)
                            .bold()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.99, green: 0.674, blue: 0.9))
                    .cornerRadius(20)
                    .padding(.horizontal, 40)

                    // Scrollable Closet Items
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(items) { item in
                                VStack(spacing: 10) {
                                    Image(item.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 60)

                                    Text(item.name)
                                        .font(.subheadline)

                                    Text("\(item.cost) pts")
                                        .font(.caption)
                                        .foregroundColor(.gray)

                                    if ownedItems.contains(item.id) || item.cost == 0 {
                                        Button("Equip") {
                                            selectedImageName = item.imageName
                                        }
                                        .font(.caption)
                                        .padding(5)
                                        .frame(maxWidth: .infinity)
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .cornerRadius(6)
                                    } else {
                                        Button("Buy") {
                                            if points >= item.cost {
                                                points -= item.cost
                                                ownedItems.insert(item.id)
                                                selectedImageName = item.imageName
                                            }
                                        }
                                        .font(.caption)
                                        .padding(5)
                                        .frame(maxWidth: .infinity)
                                        .background(points >= item.cost ? Color.teal : Color.gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(6)
                                        .disabled(points < item.cost)
                                    }
                                }
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(12)
                                .shadow(radius: 4)
                            }
                        }
                        .padding()
                    }

                    Spacer()
                }

                // CHARACTER ON MAT (fixed to bottom center)
                VStack {
                    Spacer()
                    Image(selectedImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 280)
                        .shadow(radius: 10)
                        .padding(.bottom, 15)
                        .position(x: 210, y: 500)

                }
            }
        }
    }
}

#Preview {
    MyCloset()
}

