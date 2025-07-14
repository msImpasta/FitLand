import SwiftUI

struct TitleScreen: View {
    var body: some View {
        ZStack{
            Color(red: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, green: 0.5, blue: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)

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
