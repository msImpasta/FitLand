import SwiftUI

struct MyActivity: View {
    @State private var points = 0
    @State private var steps = 0
    @State private var workouts: [String] = []
    
    @State private var inputSteps = ""
    @State private var inputWorkout = ""

    var body: some View {
        ZStack {
            Image("FitLandActivity")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()

            VStack {
                Spacer().frame(height: 20)
                
                VStack(spacing: 10) {
                    Text("⭐️ Points: \(points)")
                        .font(.title2)
                        .bold()
                    Text("My Activity")
                        .font(.largeTitle)
                        .bold()
                }
                .padding()
            
            Image("Character")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .background((Color(red: 0.99, green: 0.674, blue: 0.9)))
                .cornerRadius(20)
                .padding(.horizontal, 40)

                Spacer().frame(height: 210)

                Image("Character")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 260)
                    .padding(.bottom, -10)
                    .zIndex(1)

                VStack(spacing: 6) {
                    Text("Steps: \(steps)")
                        .font(.headline)

                    if !workouts.isEmpty {
                        Text("Workouts: \(workouts.count)")
                            .font(.headline)

                        ForEach(workouts, id: \.self) { workout in
                            Text("• \(workout)")
                                .font(.subheadline)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background((Color(red: 0.99, green: 0.674, blue: 0.9)))
                .cornerRadius(20)
                .padding(.horizontal, 60)

                Spacer().frame(height: 20)

                VStack(spacing: 12) {
                    HStack {
                        TextField("Enter steps", text: $inputSteps)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button("Add Steps") {
                            if let stepCount = Int(inputSteps), stepCount > 0 {
                                steps += stepCount
                                points += stepCount / 100
                                inputSteps = ""
                            }
                        }
                        .padding(.horizontal)
                        .background((Color(red: 0.99, green: 0.674, blue: 0.9)))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }

                    HStack {
                        TextField("Workout type (e.g., Yoga)", text: $inputWorkout)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        Button("Add Workout") {
                            let trimmed = inputWorkout.trimmingCharacters(in: .whitespaces)
                            if !trimmed.isEmpty {
                                workouts.append(trimmed)
                                points += 10
                                inputWorkout = ""
                            }
                        }
                        .padding(.horizontal)
                        .background((Color(red: 0.99, green: 0.674, blue: 0.9)))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    MyActivity()
}


