//
//  ContentView.swift
//  GetCoordinates
//
//  Created by Max Franz Immelmann on 5/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.0
    @State private var points = 6
    
    var body: some View {
       
        VStack {

            Spacer()
            ZStack {
                
                
                CircleView()

                
                ForEach(0..<points, id: \.self) { iteration in
                    LineView(progress: $progress)
                    .rotationEffect(.degrees(Double(iteration * (360 / points))))
                }
                
                PathView(progress: $progress,
                         points: $points)
                
            }
            
            Spacer()
            ButtonView(progress: $progress)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
