//
//  PathView.swift
//  GetCoordinates
//
//  Created by Max Franz Immelmann on 5/17/23.
//

import SwiftUI

struct PathView: View {
    @Binding var progress: Double
    
    var body: some View {
        let diameter = UIScreen.main.bounds.width * 0.9
        let radius = diameter / 2
        let points = 5
        let angle = 360 / points
        let coordinates = (0..<points).map { iteration in
            let currentAngle = Double(iteration * angle) * Double.pi / 180
            let dotX = radius + radius * CGFloat(sin(currentAngle))
            let dotY = radius - radius * CGFloat(cos(currentAngle))
            return (x: dotX, y: dotY)
        }
        
        return VStack {
            ZStack {

                ForEach(Array(0..<points), id: \.self) { iteration in
                    let coordinate1 = coordinates[iteration]
                    let coordinate2 = coordinates[(iteration + 2) % points]
                    let x1 = coordinate1.x
                    let y1 = coordinate1.y
                    let x2 = coordinate2.x
                    let y2 = coordinate2.y
                    
                    Path { path in
                        path.move(to: CGPoint(x: x1, y: y1))
                        path.addLine(to: CGPoint(x: x2, y: y2))
                    }
                    .trim(from: 0.0, to: CGFloat(progress))
                    .stroke(Color.black, lineWidth: 2)
                    .animation(.easeInOut(duration: 1), value: progress)
                }
            }
            .frame(width: diameter, height: diameter)
        }
    }
}



struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView(progress: .constant(1))
    }
}