import SwiftUI

struct TitleScreen: View {
    var body: some View {
        ZStack{
            Color.pink
                .edgesIgnoringSafeArea(.all).ignoresSafeArea()
            Text("Welcome to FitLand!")
                .padding()
        }

        

    }
}

#Preview {
    TitleScreen()
}
