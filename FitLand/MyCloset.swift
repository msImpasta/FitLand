import SwiftUI

struct ClosetItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let cost: Int
}

struct MyCloset: View {
    let items = [
        ClosetItem(name: "Character Upgrade 1", imageName: "tshirt", cost: 100),
        ClosetItem(name: "Character Upgrade 2", imageName: "shoeprints.fill", cost: 150),
        ClosetItem(name: "Character Upgrade 3", imageName: "eyeglasses", cost: 200),
        

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
                Image("Character")
                    .resizable()
                    .scaledToFit()
                    .position(x: 300, y: 500)
                VStack {
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
                    .background((Color(red: 0.99, green: 0.674, blue: 0.9)))
                    .cornerRadius(20)
                    .padding(.horizontal, 40)


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
                                    .background(points >= item.cost ? Color.teal : Color.gray)
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
          
        }
    }
}

#Preview {
    MyCloset()
}

