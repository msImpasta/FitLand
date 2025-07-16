import SwiftUI

struct ClosetItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let cost: Int
}

struct MyCloset: View {
    // Sample items
    let items = [
        ClosetItem(name: "Pink Hoodie", imageName: "tshirt", cost: 50),
        ClosetItem(name: "Sneakers", imageName: "shoeprints.fill", cost: 75),
        ClosetItem(name: "Cool Hat", imageName: "sun.max.fill", cost: 30),
        ClosetItem(name: "Jacket", imageName: "flame", cost: 60),
        ClosetItem(name: "Shades", imageName: "eyeglasses", cost: 40),
        ClosetItem(name: "Backpack", imageName: "bag.fill", cost: 90)
    ]

    @State private var points = 200

    var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            VStack {
                Text("⭐️ Points: \(points)")
                    .font(.headline)
                    .padding()

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
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(radius: 4)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("My Closet Shop")
            .background(Color(.systemGroupedBackground))
        }
    }
}
#Preview {
    MyCloset()
}
