import SwiftUI

struct MyActivity: View {
    @EnvironmentObject var pointsManager: PointsManager
    @State private var steps = 0
    @State private var workouts: [String] = []
    @State private var inputSteps = ""
    @State private var inputWorkout = ""
    let milestones = [50, 150, 200, 250, 300]

    var nextMilestone: Int? {
        return milestones.first(where: { pointsManager.points < $0 })
    }

    var achievedMilestones: [Int] {
        return milestones.filter { pointsManager.points >= $0 }
    }

    var body: some View {
        ZStack {
            Image("FitLandActivity")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            
            ScrollView {
                VStack(spacing: 16) {
                    VStack(spacing: 10) {
                        Text("FitLand Stats")
                            .font(.largeTitle)
                            .bold()
                        Text("Points: \(pointsManager.points)")
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
                                    Text("✓ \(milestone) Points Achieved")
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
                    .padding(.top, 50)

                    if !workouts.isEmpty {
                        VStack(spacing: 6) {
                            Text("Workouts: \(workouts.count)")
                                .font(.headline)
                            ForEach(workouts, id: \.self) { workout in
                                Text("• \(workout)")
                                    .font(.subheadline)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.793, green: 0.674, blue: 0.9))
                        .cornerRadius(20)
                        .padding(.horizontal, 60)
                    }

                    VStack(spacing: 12) {
                        HStack {
                            TextField("Enter steps", text: $inputSteps)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Button("Add Steps") {
                                if let stepCount = Int(inputSteps), stepCount > 0 {
                                    steps += stepCount
                                    pointsManager.points += stepCount / 100
                                    inputSteps = ""
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(Color(red: 0.29, green: 0.64, blue: 0.967))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                        }

                        HStack {
                            TextField("Workout type", text: $inputWorkout)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Button("Add Workout") {
                                let trimmed = inputWorkout.trimmingCharacters(in: .whitespaces)
                                if !trimmed.isEmpty {
                                    workouts.append(trimmed)
                                    pointsManager.points += 10
                                    inputWorkout = ""
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .background(Color(red: 0.29, green: 0.64, blue: 0.967))
                            .foregroundColor(.black)
                            .cornerRadius(10)
                        }

                        Image("Mat")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 60)
                            .padding(.bottom, -20)

                        Image("Character")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 260)
                    }
                    .padding(.horizontal)
                    Spacer(minLength: 90)
                }

            }
        }
        .ignoresSafeArea(.keyboard) // Prevents keyboard from hiding inputs
    }
}

#Preview {
    MyActivity().environmentObject(PointsManager())
}

