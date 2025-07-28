import SwiftUI

struct ProfileImage: View {
    var body: some View {
        EmptyView()
    }
}

struct MyProfile: View {
    @State private var name = "Alexis Golland"
    @State private var email = "alexisgolland@icloud.com"
    @State private var weight = "120 lbs"
    @State private var goal = "Be active"
    @State private var buttonColor = Color(red: 0.99, green: 0.674, blue: 0.9) // Start with pink

    var body: some View {
        ZStack {
            Image("FitLandHome")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()

            VStack(spacing: 20) {
                Image(systemName: "person.crop.circle")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 5)

                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .padding(.horizontal)
                TextField("Weight (lbs)", text: $weight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding(.horizontal)
                TextField("Health Goal", text: $goal)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        buttonColor = .teal
                    }
                    print("Saved: \(name), \(email), \(weight), \(goal)")
                }) {
                    Text("Save Profile")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(buttonColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    MyProfile()
}

