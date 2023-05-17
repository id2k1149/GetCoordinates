//
//  PathView.swift
//  GetCoordinates
//
//  Created by Max Franz Immelmann on 5/17/23.
//

import SwiftUI

struct PathView: View {
    
    var body: some View {
        let diameter = UIScreen.main.bounds.width * 0.9
        let radius = diameter / 2
        let points = 5
        let angle = 360 / points
        var coordinates: [(x: CGFloat, y: CGFloat)] = []  
        
        for iteration in 0..<points {
            let currentAngle = Double(iteration * angle) * Double.pi / 180
            
            let dotX = radius + radius * CGFloat(sin(currentAngle))
            let dotY = radius - radius * CGFloat(cos(currentAngle))
            
            coordinates.append((x: dotX, y: dotY))
        }
        
        return VStack {
            
            if !coordinates.isEmpty {
                Text("Dot Coordinates:")
                ForEach(coordinates.indices, id: \.self) { index in
                    let coordinate = coordinates[index]
                    Text("(\(index): \(lround(coordinate.x)), \(lround(coordinate.y)))")
                }
            }
            
            let coordinate0 = coordinates[0]
            let x0 = coordinate0.x
            let y0 = coordinate0.y
            
            let coordinate1 = coordinates[1]
            let x1 = coordinate1.x
            let y1 = coordinate1.y
            
            let coordinate2 = coordinates[2]
            let x2 = coordinate2.x
            let y2 = coordinate2.y
            
            let coordinate3 = coordinates[3]
            let x3 = coordinate3.x
            let y3 = coordinate3.y
      
            let coordinate4 = coordinates[4]
            let x4 = coordinate4.x
            let y4 = coordinate4.y

            ZStack {
                Circle()
                    .stroke(Color.black, lineWidth: 2)
                .frame(width: diameter, height: diameter)
                
                ZStack {
                    Path { path in
                        path.move(to: CGPoint(x: x0, y: y0))
                        path.addLine(to: CGPoint(x: x2, y: y2))
                    }
                    .stroke(Color.black, lineWidth: 2)
                    
                    Path { path in
                        path.move(to: CGPoint(x: x2, y: y2))
                        path.addLine(to: CGPoint(x: x4, y: y4))
                    }
                    .stroke(Color.black, lineWidth: 2)
                    
                    Path { path in
                        path.move(to: CGPoint(x: x4, y: y4))
                        path.addLine(to: CGPoint(x: x1, y: y1))
                    }
                    .stroke(Color.black, lineWidth: 2)
                    
                    Path { path in
                        path.move(to: CGPoint(x: x1, y: y1))
                        path.addLine(to: CGPoint(x: x3, y: y3))
                    }
                    .stroke(Color.black, lineWidth: 2)
                    
                    Path { path in
                        path.move(to: CGPoint(x: x3, y: y3))
                        path.addLine(to: CGPoint(x: x0, y: y0))
                    }
                    .stroke(Color.black, lineWidth: 2)
                }
                .frame(width: diameter, height: diameter)
            }
        }
    }
}


struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView()
    }
}
