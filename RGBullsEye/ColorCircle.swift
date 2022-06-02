//
//  ColorCircle.swift
//  RGBullsEye
//
//  Created by Juan Hernandez Pazos on 31/05/22.
//

import SwiftUI

struct ColorCircle: View {
    // MARK: - Properties
    let rgb: RGB
    let size: CGFloat
    
    // MARK: - View
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.element)
                .northWestShadow()
            Circle()
                .fill(Color(red: rgb.red, green: rgb.green, blue: rgb.blue))
                .padding(20)
        } // ZStack
        .frame(width: size, height: size)
    }
}

struct ColorCircle_Preview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.element
            ColorCircle(rgb: RGB(), size: 200)
        }
        .frame(width: 300, height: 300)
        .previewLayout(.sizeThatFits)
        
    }
}
