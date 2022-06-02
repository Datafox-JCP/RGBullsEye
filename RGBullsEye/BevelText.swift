//
//  BevelText.swift
//  RGBullsEye
//
//  Created by Juan Hernandez Pazos on 01/06/22.
//

import SwiftUI

struct BevelText: View {
    // MARK: - Properties
    let text: String
    let width: CGFloat
    let height: CGFloat
    
    // MARK: - Body
    var body: some View {
        Text(text)
            .frame(width: width, height: height)
            .background(
                ZStack {
                    Capsule()
                        .fill(Color.element)
                        .northWestShadow(radius: 3, offset: 1)
                    Capsule()
                        .fill(Color.element)
                        .southEastShadow(radius: 1, offset: 1)
                }
            )
    }
}

// MARK: - Preview
struct BevelText_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.element
            BevelText(text: "R: ??? G: ??? B: ???", width: 200, height: 48)
        } // ZStack
        .frame(width: 300, height: 100)
        .previewLayout(.sizeThatFits)
    }
}
