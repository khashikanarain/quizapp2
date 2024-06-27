//
//  ContentView.swift
//  quizapp
//
//  Created by Sruti Narain on 6/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedAnswers = Array(repeating: "", count: 4)
    @State private var showResult = false
    
    let questions = [
        "What is your favorite activity? 🤸",
        "What is your favorite food? 😋",
        "Where would you like to live? 🏡",
        "What describes your personality best? ✨"
    ]
    
    let options = [
        ["Sleeping 💤", "Eating 🍴", "Playing ⛹️‍♀️", "Exploring 🗺️"],
        ["Berries 🍓", "Fish 🐟", "Honey 🍯", "Bamboo 🎋"],
        ["Forest 🌳", "River 🦦", "Mountain 🏔️", "Zoo 🐨"],
        ["Calm 😌", "Playful 😉", "Curious 🧐", "Lazy 😑"]
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ForEach(0..<questions.count, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text(questions[index])
                            .font(.headline)
                            .padding(.top)
                            .foregroundColor(.pink) // Customize text color

                        Menu {
                            ForEach(options[index], id: \.self) { option in
                                Button(action: {
                                    selectedAnswers[index] = option
                                }) {
                                    Text(option)
                                }
                            }
                        } label: {
                            HStack {
                                Text(selectedAnswers[index].isEmpty ? "Select an option" : selectedAnswers[index])
                                    .foregroundColor(.gray)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.blue)
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
                        .padding(.bottom)
                
                    }
                    .padding(.horizontal)
                }

                Spacer()

                Button(action: {
                    showResult = true
                }) {
                    Text("Submit")
                        .font(.title2)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
                .disabled(selectedAnswers.contains(""))
                .sheet(isPresented: $showResult) {
                    ResultView(selectedAnswers: selectedAnswers)
                }
            }
            .navigationTitle("We Bare Bears Quiz 🐻🐼🐻‍❄️")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
