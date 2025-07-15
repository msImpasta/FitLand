import SwiftUI

struct TitleScreen: View {
    var body: some View {
        ZStack{
            
            Color(red: 0.555, green: 0.7727, blue: 0.889)
                .edgesIgnoringSafeArea(.all)
            Text("Welcome to FitLand!")
                .font(.system(size: 30, weight: .bold, design: .default))
                .foregroundColor(Color(hue: 0.923, saturation: 0.543, brightness: 0.938))
                .padding()
        }
        HStack {
            Image(systemName: "play.square.fill")
            
                .font(.system(size: 55, weight: .bold, design: .default))
                .foregroundColor(Color(hue: 0.923, saturation: 0.543, brightness: 0.938))
                .edgesIgnoringSafeArea(.all).ignoresSafeArea()
        }
    }
}
#Preview {
    TitleScreen()
}
