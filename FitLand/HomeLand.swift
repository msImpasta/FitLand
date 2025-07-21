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
            
        }
                }
    }

#Preview {
    HomeLand()
}
