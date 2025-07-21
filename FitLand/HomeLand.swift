import SwiftUI

struct HomeLand: View {
    var body: some View {
        ZStack {
            Image("FitLandHome")
                .resizable()
                .ignoresSafeArea(edges: .all)
                .scaledToFill()
            Image("Character")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
            
        }
                }
    }

#Preview {
    HomeLand()
}
