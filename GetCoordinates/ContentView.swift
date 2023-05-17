//
//  ContentView.swift
//  GetCoordinates
//
//  Created by Max Franz Immelmann on 5/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.0
    
    var body: some View {
       
        VStack {

            Spacer()
            ZStack {
                
                
                CircleView()
//                LineView(progress: $progress)
                
                ForEach(0..<5, id: \.self) { iteration in
                    LineView(progress: $progress)
                    .rotationEffect(.degrees(Double(iteration * 72)))
                }
                
                PathView(progress: $progress)
                
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
