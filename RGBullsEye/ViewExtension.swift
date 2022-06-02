//
//  ViewExtension.swift
//  RGBullsEye
//
//  Created by Juan Hernandez Pazos on 30/05/22.
//

import SwiftUI

extension View {
    func northWestShadow(
        radius: CGFloat = 16,
        offset: CGFloat = 6
    ) -> some View {
        return self
            .shadow(color: .hightlight, radius: radius, x: -offset, y: -offset)
            .shadow(color: .shadow, radius: radius, x: offset, y: offset)
    }
    
    func southEastShadow(
        radius: CGFloat = 16,
        offset: CGFloat = 6
    ) -> some View {
        return self
            .shadow(color: .shadow, radius: radius, x: -offset, y: -offset)
            .shadow(color: .hightlight, radius: radius, x: offset, y: offset)
    }
    
}
