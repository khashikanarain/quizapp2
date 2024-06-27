//
//  QuestionView.swift
//  quizapp
//
//  Created by Sruti Narain on 6/26/24.
//
import SwiftUI

struct QuestionView: View {
    let question: String
    let options: [String]
    @Binding var selection: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(question)
                .font(.headline)
                .padding(.bottom, 5)
            
            Picker(selection: $selection, label: Text("")) {
                ForEach(0..<options.count) {
                    Text(self.options[$0])
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding(.bottom, 20)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: "Sample Question", options: ["Option 1", "Option 2", "Option 3"], selection: .constant(0))
    }
}
