//
//  RoundedCornerShape.swift
//  Firebase App (iOS)
//
//  Created by Ankush  Anand on 11/Jun/2021.
//

import SwiftUI

public struct RoundedCornerShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat

   public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedCornerShape_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornerShape(corners:[.topLeft,.topRight],radius:20)
    }
}
