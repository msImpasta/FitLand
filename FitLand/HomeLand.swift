import SwiftUI
struct HouseItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let cost: Int
}
struct HomeLand: View {
    let items = [
        HouseItem(name: "Wood House", imageName: "wood", cost: 500),
        HouseItem(name: "Metal House", imageName: "metal", cost: 1000)
    ]
    @EnvironmentObject var pointsManager: PointsManager
    @State private var ownedItems: Set<UUID> = []
    @State private var selectedImageName: String = "wood"
    var columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Image("FitLandHome")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                Image(selectedImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 900)
                    .padding(.bottom, 0)
                    .zIndex(0)
                VStack {
                    Spacer().frame(height: 80)

                    VStack(spacing: 10) {
                        Text("Points: \(pointsManager.points)")
                            .font(.title2)
                            .bold()
                        Text("My House")
                            .font(.largeTitle)
                            .bold()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.99, green: 0.674, blue: 0.9))
                    .cornerRadius(20)
                    .padding(.horizontal, 50)
                    Spacer().frame(height: 350)
                    
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(items) { item in
                                VStack(spacing: 10) {
                                    Image(item.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 69)
                                        .clipped()
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
                                        .background(Color.teal)
                                        .foregroundColor(.white)
                                        .cornerRadius(6)
                                    } else {
                                        Button("Buy") {
                                            if pointsManager.points >= item.cost {
                                                pointsManager.points -= item.cost
                                                ownedItems.insert(item.id)
                                                selectedImageName = item.imageName
                                            }
                                        }
                                        .font(.caption)
                                        .padding(5)
                                        .frame(maxWidth: .infinity)
                                        .background(pointsManager.points >= item.cost ? Color.teal : Color.gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(6)
                                        .disabled(pointsManager.points < item.cost)
                                    }
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(radius: 6)
                            }
                        }
                        .padding()
                    
                    Spacer()
                }
                .zIndex(1)
            }
        }
    }
}
#Preview {
    HomeLand().environmentObject(PointsManager())
}
