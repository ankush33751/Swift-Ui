//
//  SwiftUIView.swift
//  Meng UI (iOS)
//
//  Created by Ankush  Anand on 01/06/21.
//


import Combine
import UIKit

struct DataModel:Decodable,Identifiable{
    var id=UUID()

    var dataId:Int
    var userId:Int
    var title:String
    var body:String
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case body = "body"
        case dataId="id"
        case userId="userId"

    }
}




