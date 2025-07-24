import SwiftUI
struct ContentView: View {
    @StateObject var pointsManager = PointsManager()
    var body: some View {
        TabView {
            HomeLand()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("My House")
                }
            MyActivity()
                .tabItem {
                    Image(systemName: "dumbbell.fill")
                    Text("Activity")
                }
            MyCloset()
                .tabItem {
                    Image(systemName: "door.french.closed")
                    Text("Closet")
                }
            MyProfile()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
        .environmentObject(pointsManager) 
    }
}
#Preview {
    ContentView()
}
