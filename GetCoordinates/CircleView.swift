//
//  CircleView.swift
//  GetCoordinates
//
//  Created by Max Franz Immelmann on 5/16/23.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        let diameter = UIScreen.main.bounds.width * 0.9
        Circle()
            .stroke(Color.black, lineWidth: 2)
            .frame(width: diameter,
                   height: diameter)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
