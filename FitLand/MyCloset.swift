import SwiftUI

struct ClosetItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let cost: Int
}

struct MyCloset: View {
    let items = [
        ClosetItem(name: "Shirt", imageName: "tshirt", cost: 50),
        ClosetItem(name: "Heels", imageName: "shoeprints.fill", cost: 75),
        ClosetItem(name: "Shades", imageName: "eyeglasses", cost: 40),
        ClosetItem(name: "Purse", imageName: "bag.fill", cost: 90)
    ]

    @State private var points = 200
    var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ZStack {
              
                Image("Closet")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    Text("⭐️ Points: \(points)")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)

                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(items) { item in
                                VStack(spacing: 10) {
                                    Image(systemName: item.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)

                                    Text(item.name)
                                        .font(.subheadline)

                                    Text("\(item.cost) pts")
                                        .font(.caption)
                                        .foregroundColor(.gray)

                                    Button("Buy") {
                                        if points >= item.cost {
                                            points -= item.cost
                                        }
                                    }
                                    .font(.caption)
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                                    .background(points >= item.cost ? Color.pink : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(6)
                                }
                                .padding()
                                .background(Color.white.opacity(0.9)) // Optional transparency
                                .cornerRadius(12)
                                .shadow(radius: 4)
                            }
                        }
                        .padding()
                    }
                }
                .padding()
            }
            .navigationTitle("Upgrade Your Closet")
        }
    }
}

#Preview {
    MyCloset()
}

