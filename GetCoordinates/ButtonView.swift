//
//  StartButton.swift
//  GetCoordinates
//
//  Created by Max Franz Immelmann on 5/16/23.
//

import SwiftUI

struct ButtonView: View {
    @Binding var progress: Double
    
    var body: some View {
        Button(action: {
            if progress < 1 {
                progress += 1
            } else {
                progress = 0
            }
        }) {
            Text(progress < 1 ? "Tap Me" : "Reset")
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(progress < 1 ? Color.blue : Color.red)
                .cornerRadius(10)
        }
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(progress: .constant(0))
    }
}
