//
//  UpadteStore.swift
//  Meng UI
//
//  Created by Ankush  Anand on 20/05/21.
//

import SwiftUI
import Combine
class UpdateStore: ObservableObject {

    @Published var updates:[UpdateModal]=[

        UpdateModal(image: Image(uiImage: #imageLiteral(resourceName: "Card4")), title: "Swift UI", descriptionData: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.", date: "02 JAN"),
        UpdateModal(image: Image(uiImage: #imageLiteral(resourceName: "Card5")), title: "Framer", descriptionData: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.", date: "02 JAN"),
        UpdateModal(image: Image(uiImage: #imageLiteral(resourceName: "Background1")), title: "Adobe XD", descriptionData: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.", date: "02 JAN"),
        UpdateModal(image: Image(uiImage: #imageLiteral(resourceName: "Card6")), title: "Figma", descriptionData: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.", date: "02 JAN"),

      ]  
}
