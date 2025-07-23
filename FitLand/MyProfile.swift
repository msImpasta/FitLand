import SwiftUI

struct ProfileImage: View {
    var body: some View {
    
        
    }
}

struct MyProfile: View {
    @State private var name = ""
    @State private var email = ""
    @State private var weight = ""
    @State private var goal = ""

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
                    print("Saved: \(name), \(email), \(weight), \(goal)")
                }) {
                    Text("Save Profile")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background((Color(red: 0.99, green: 0.674, blue: 0.9)))
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

