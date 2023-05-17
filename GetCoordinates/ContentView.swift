//
//  ContentView.swift
//  GetCoordinates
//
//  Created by Max Franz Immelmann on 5/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var progress = 0.0
    @State private var dotCoordinates: [(x: CGFloat, y: CGFloat)] = []
        
    
    var body: some View {
       
        VStack {
            if !dotCoordinates.isEmpty {
                Text("Dot Coordinates:")
                ForEach(dotCoordinates.indices, id: \.self) { index in
                    let coordinate = dotCoordinates[index]
                    Text("(\(index): \(lround(coordinate.x)), \(lround(coordinate.y)))")
                }
            }

            Spacer()
            ZStack {
                VStack {
                    Text("\(UIScreen.main.bounds.width)")
                    Text("\(UIScreen.main.bounds.height)")
                }
                
                if !dotCoordinates.isEmpty {
                          Path { path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: UIScreen.main.bounds.width - 10,
                                                 y: UIScreen.main.bounds.width))
                    }
                    .stroke(Color.black, lineWidth: 2)
                }
                
                
                CircleView()
                LineView(progress: $progress,
                         dotCoordinates: $dotCoordinates)
                
                ForEach(0..<5, id: \.self) { iteration in
                    LineView(progress: $progress, dotCoordinates: $dotCoordinates)
                    .rotationEffect(.degrees(Double(iteration * 72)))
                }
                
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
