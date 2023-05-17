//
//  PathView.swift
//  GetCoordinates
//
//  Created by Max Franz Immelmann on 5/17/23.
//

import SwiftUI

struct PathView: View {
    @Binding var progress: Double
    @Binding var points: Int
    @State private var currentIndex = 0
    
    var body: some View {
        
        let diameter = UIScreen.main.bounds.width * 0.9
        let radius = diameter / 2
        let angle = 360 / points
        let initial = (0..<points).map { iteration in
            let currentAngle = Double(iteration * angle) * Double.pi / 180
            let dotX = radius + radius * CGFloat(sin(currentAngle))
            let dotY = radius - radius * CGFloat(cos(currentAngle))
            return (x: dotX, y: dotY)
        }
        
        var coordinates: [(x: CGFloat, y: CGFloat)] {
            var newArray = [(x: CGFloat, y: CGFloat)]()
            
            if initial.count % 2 != 0 {
                
                for (index, element) in initial.enumerated() {
                    if index % 2 == 0 {
                        newArray.append(element)
                    }
                }
                
                for (index, element) in initial.enumerated() {
                    if index % 2 != 0 {
                        newArray.append(element)
                    }
                }
                
                newArray.append(initial[0])
                
            } else {
                for (index, element) in initial.enumerated() {
                    if index % 2 == 0 {
                        newArray.append(element)
                    }
                }
                
                newArray.append(initial[0])
                
                for (index, element) in initial.enumerated() {
                    if index % 2 != 0 {
                        newArray.append(element)
                    }
                }
                
                newArray.append(initial[1])
            }
        
            
            return newArray
        }
         
        return ZStack {
            Path { path in
                if coordinates.last?.x == coordinates.first?.x
                    && coordinates.last?.y == coordinates.first?.y {
                    
                    path.addLines(coordinates.map { CGPoint(x: $0.x, y: $0.y) })
                      
                    /*
                    for (index, coordinate) in coordinates.enumerated() {
                        let point = CGPoint(
                            x: coordinate.0,
                            y: coordinate.1
                        )
                        if index == 0 {
                            path.move(to: point)
                        } else {
                            path.addLine(to: point)
                        }
                    }
                     */
                    
                } else {
                    let firstHalf = coordinates.prefix(coordinates.count / 2)
                    path.addLines(firstHalf.map { CGPoint(x: $0.x, y: $0.y) })
                    
                    let secondHalf = coordinates.suffix(coordinates.count / 2)
                    path.addLines(secondHalf.map { CGPoint(x: $0.x, y: $0.y) })
                    
                }
            }
            .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
            .stroke(Color.black, lineWidth: 2)
            .animation(.linear(duration: 5),
                       value: progress)
        }
        .frame(width: diameter, height: diameter)
    }
}



struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView(progress: .constant(1),
                 points: .constant(8))
    }
}
