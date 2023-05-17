//
//  LineView.swift
//  GetCoordinates
//
//  Created by Max Franz Immelmann on 5/16/23.
//

import SwiftUI

struct LineView: View {
    @Binding var progress: Double
    
    var body: some View {
        let diameter = UIScreen.main.bounds.width * 0.9
        
        Path { path in
            path.move(to: CGPoint(x: diameter / 2, y: diameter / 2))
            path.addLine(to: CGPoint(x: diameter / 2, y: -10))
        }
        .trim(from: 0.0, to: CGFloat(progress))
        .stroke(Color.gray, lineWidth: 2)
        .frame(width: diameter, height: diameter)
        .animation(.easeInOut(duration: 0.5), value: progress)
    }
}
    

struct LineView_Previews: PreviewProvider {
    let diameter = UIScreen.main.bounds.width * 0.9
    
    static var previews: some View {
        LineView(progress: .constant(1.0))
    }
}
