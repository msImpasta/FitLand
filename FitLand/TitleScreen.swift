import SwiftUI
struct TitleScreen: View {
    @State private var startApp = false
    var body: some View {
        if startApp {
            ContentView()
        } else {
            ZStack {
                Image("aura-bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    VStack(spacing: 30) {
                        Image("Title")
                            .resizable()
                            .scaledToFit()
                            .frame(height:300)

                        Button("START PLAYING") {
                            withAnimation {
                                startApp = true
                            }
                        }
                        .font(.title2)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(red: 0.99, green: 0.674, blue: 0.9))
                        .cornerRadius(12)
                    }
                    .foregroundColor(.white)
                    Spacer()
                    Image("AppIcon2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 400)
                        .padding(.bottom, 30)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
#Preview {
    TitleScreen()
}
