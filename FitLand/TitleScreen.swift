import SwiftUI

struct TitleScreen: View {
<<<<<<< HEAD
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
        
        
=======
    @State private var startApp = false
>>>>>>> 32f212f86f6d0941a26d812849af27dd1612e245

    var body: some View {
        if startApp {
            ContentView()
        } else {
            VStack(spacing: 40) {
                Text("Welcome to FitLand")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Button("Start") {
                    withAnimation {
                        startApp = true
                    }
                }
                .font(.title2)
                .padding()
                .background(Color.pink) 
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.9))
            .foregroundColor(.white)
        }
    }
}
#Preview {
    TitleScreen()
}
