//
//  BlurEffect.swift
//  Meng UI (iOS)
//
//  Created by Ankush  Anand on 04/Jun/2021.
//

import SwiftUI

struct BlurEffect: UIViewRepresentable {

    var style:UIBlurEffect.Style
    func makeUIView(context: Context) -> some UIView {
        let view=UIView(frame: .zero)
        let blurEffect=UIBlurEffect(style: .systemMaterial)
        let blurView=UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints=false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

