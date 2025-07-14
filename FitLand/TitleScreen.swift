import SwiftUI

struct TitleScreen: View {
    var body: some View {
        ZStack{
            Color.pink
                .edgesIgnoringSafeArea(.all).ignoresSafeArea()
            Text("Welcome to FitLand!")
                .font(.system(size: 30, weight: .bold, design: .default))
                .foregroundColor(.white)
                .padding()
        }
        HStack {
            Image(systemName: "play.square.fill")
                .edgesIgnoringSafeArea(.all).ignoresSafeArea()
                .padding()
        }
        
        

    }
}

#Preview {
    TitleScreen()
}
