import SwiftUI

struct TitleScreen: View {
    @State private var startApp = false

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
