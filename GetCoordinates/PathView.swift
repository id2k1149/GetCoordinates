//
//  PathView.swift
//  GetCoordinates
//
//  Created by Max Franz Immelmann on 5/17/23.
//

import SwiftUI

struct PathView: View {
    @Binding var progress: Double
    @State private var currentIndex = 0
    
    var body: some View {
        
        let diameter = UIScreen.main.bounds.width * 0.9
        let radius = diameter / 2
        let points = 5
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
            }
        
            
            return newArray
        }
         
        return ZStack {
//            Text("Final Array: \(coordinates)")
            
            ForEach(0..<coordinates.count, id: \.self) { index in
                let coordinate1 = coordinates[index]
                let coordinate2 = coordinates[(index + 1) % points]
                let x1 = coordinate1.x
                let y1 = coordinate1.y
                let x2 = coordinate2.x
                let y2 = coordinate2.y
                
                Path { path in
                    path.move(to: CGPoint(x: x1, y: y1))
                    path.addLine(to: CGPoint(x: x2, y: y2))
                }
                .trim(from: 0.0, to: currentIndex >= index ? CGFloat(progress) : 0.0)
                .trim(from: 0.0, to: CGFloat(progress))
                .stroke(Color.black, lineWidth: 2)
                .animation(.linear(duration: 1), value: progress)
            }
        }
        .frame(width: diameter, height: diameter)
        
        .onAppear {
            displayNextItem()
            
            func displayNextItem() {
                guard currentIndex < coordinates.count - 1 else {
                    return
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    currentIndex += 1
                    displayNextItem()
                }
            }
        }
         
    }
}



struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView(progress: .constant(1))
    }
}
