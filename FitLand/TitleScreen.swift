import SwiftUI

struct TitleScreen: View {
    var body: some View {
        ZStack{
            Color(red: 0.200, green: 0.70, blue: 0.75)
                .edgesIgnoringSafeArea(.all).ignoresSafeArea()
            Text("Welcome to FitLand!")
                .font(.system(size: 30, weight: .bold, design: .default))
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 0.521, saturation: 0.443, brightness: 0.995)/*@END_MENU_TOKEN@*/)
                .padding()
        }
        HStack {
            Image(systemName: "play.fill")
                //.edgesIgnoringSafeArea(.all)
            //.ignoresSafeArea()
                    //.padding()
                Text("Play!")
            
        }
        
        

    }
}

#Preview {
    TitleScreen()
}
