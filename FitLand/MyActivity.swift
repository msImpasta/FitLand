import SwiftUI

struct MyActivity: View {
    @State private var points = 0
    @State private var steps = 0
    @State private var workouts: [String] = []
    
    @State private var inputSteps = ""
    @State private var inputWorkout = ""
    
    let milestones = [50, 150, 200, 250, 300]

    var nextMilestone: Int? {
        return milestones.first(where: { points < $0 })
    }

    var achievedMilestones: [Int] {
        return milestones.filter { points >= $0 }
    }

    var body: some View {
        ZStack {
            Image("FitLandActivity")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()

            VStack {
                Spacer().frame(height: 20)
                
                VStack(spacing: 10) {
                    Text("FitLand Stats")
                        .font(.largeTitle)
                        .bold()

                    Text("Points: \(points)")
                        .font(.title2)
                        .bold()

                    Text("Total Steps: \(steps)")
                        .font(.headline)

                    if let next = nextMilestone {
                        Text("Next Reward at \(next) points")
                            .font(.subheadline)
                    } else {
                        Text("All rewards unlocked!")
                            .font(.subheadline)
                    }

                    if !achievedMilestones.isEmpty {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Unlocked Rewards:")
                                .font(.headline)
                            ForEach(achievedMilestones, id: \.self) { milestone in
                                Text("\(milestone) Points Achieved")
                            }
                        }
                        .padding(.top, 5)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(red: 0.99, green: 0.674, blue: 0.9))
                .cornerRadius(20)
                .padding(.horizontal, 40)

                Spacer().frame(height: 180)

                Image("Character")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 260)
                    .padding(.bottom, -10)
                    .zIndex(1)

                VStack(spacing: 6) {
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
                .background(Color(red: 0.99, green: 0.674, blue: 0.9))
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
                        .background(Color(red: 0.99, green: 0.674, blue: 0.9))
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
                        .background(Color(red: 0.99, green: 0.674, blue: 0.9))
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

