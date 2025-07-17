import SwiftUI
//this is for the user to insert their prof pic
struct ProfileImage: View {
    var body: some View {
        Image("profile")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

struct MyProfile: View {
    var body: some View {
        
        VStack{
            Button("UserName") {
            }
            ZStack {
                Text("Hi my name is UserName, this is where I live.")
                Image("FitLandHome")
                                .resizable()
                                .scaledToFit()
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .offset(x:160, y: -350)
            }
            
        }

    }
}

#Preview {
    MyProfile()
}
