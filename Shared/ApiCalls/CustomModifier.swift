//
//  CustomModifier.swift
//  Meng UI
//
//  Created by Ankush  Anand on 23/05/21.
//

import SwiftUI

public struct CustomFont: ViewModifier {
    public  var customName="WorkSans-Regular.ttf"
    public var size:CGFloat=16
    public func body(content: Content) -> some View {
        content
            .font(.custom(customName, size: size, relativeTo: .body))
    }
}

struct ShadowModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 20, x: 10, y: 0.0)
            .shadow(color: .white, radius: 20, x: 0, y: 10.0)
    }
}

public let screen=UIScreen.main.bounds
