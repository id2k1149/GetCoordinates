//
//  LineView.swift
//  GetCoordinates
//
//  Created by Max Franz Immelmann on 5/16/23.
//

import SwiftUI

struct LineView: View {
    @Binding var progress: Double
    @Binding var dotCoordinates: [(x: CGFloat, y: CGFloat)]
    
    var body: some View {
        let diameter = UIScreen.main.bounds.width * 0.9
        let radius = diameter / 2
        let middle = diameter / 2
        let angle = 360 / 5
        
        Path { path in
            path.move(to: CGPoint(x: middle, y: middle))
            path.addLine(to: CGPoint(x: middle, y: -10))
        }
        .trim(from: 0.0, to: CGFloat(progress))
        .stroke(Color.black, lineWidth: 2)
        .frame(width: diameter, height: diameter)
        .animation(.easeInOut(duration: 0.5), value: progress)
        .onAppear {
            let dotX0 = middle
            let dotY0 = 0.0
            dotCoordinates.append((x: dotX0, y: dotY0))
            let dotX = middle + radius * sin(Double(angle) * Double.pi / 180)
            let dotY = radius - radius * cos(Double(angle) * Double.pi / 180)
            dotCoordinates.append((x: dotX, y: dotY))
        }
    }
}
    

struct LineView_Previews: PreviewProvider {
    let diameter = UIScreen.main.bounds.width * 0.9
    
    static var previews: some View {
        LineView(progress: .constant(1.0),
                 dotCoordinates: .constant([(x: 1.0, y: 1.0)]))
    }
}
