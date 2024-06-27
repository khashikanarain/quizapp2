//
//  ResultView.swift
//  quizapp
//
//  Created by Sruti Narain on 6/26/24.
//
import SwiftUI

struct ResultView: View {
    var selectedAnswers: [String]
    
    var body: some View {
        VStack {
            Text("You are a...") // Customize text color, font
                .font(.largeTitle)
                .bold()
                .padding()
            
            // Logic to determine bear type based on answers
            Text(determineBearType())
                .font(.title)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            
            // Add bear image here
            // Image("yourBearImageName")
            //     .resizable()
            //     .scaledToFit()
            //     .frame(height: 200)
            
            Spacer()
        }
    }
    
    func determineBearType() -> String {
        // Replace with your logic to determine the bear type
        // Example:
        let activity = selectedAnswers[0]
        
        switch activity {
        case "Sleeping":
            return "Grizzly Bear"
        case "Eating":
            return "Panda Bear"
        case "Playing":
            return "Polar Bear"
        case "Exploring":
            return "Ice Bear"
        default:
            return "Unknown Bear"
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(selectedAnswers: ["Sleeping", "Berries", "Forest", "Calm"])
    }
}
