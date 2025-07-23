import SwiftUI

struct HomeLand: View {
    @State private var userPoints = 100
    @State private var selectedHouse = 0
    @State private var houseUnlocked = [true, false, false]

    let houseSymbols = ["house", "house.fill", "house.circle"]

    var body: some View {
        ZStack {
            Image("FitLandHome")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer()

                Image(systemName: houseSymbols[selectedHouse])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.black)
                    .shadow(radius: 10)

                Spacer()

                Image("Character")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 350)
                    .position(x: 200, y: 270)

                Spacer()

                Text("Points: \(userPoints)")
                    .font(.headline)
                    .padding(10)
                    .background((Color(red: 0.99, green: 0.674, blue: 0.9)))
                    .cornerRadius(12)
                    .position(x: 200, y: 220)

                HStack(spacing: 15) {
                    ForEach(0..<3) { index in
                        if houseUnlocked[index] {
                            Button("Use House \(index + 1)") {
                                selectedHouse = index
                            }
                            .padding()
                            .background(selectedHouse == index ? .teal : .teal)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .position(x: 50, y: 70)
                        } else {
                            Button("Unlock House \(index + 1)\n(50 pts)") {
                                if userPoints >= 50 {
                                    userPoints -= 50
                                    houseUnlocked[index] = true
                                }
                            }
                            .padding()
                            .background(userPoints >= 50 ? .teal : .teal)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .disabled(userPoints < 50)
                            .position(x: 50, y: 70)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeLand()
}

