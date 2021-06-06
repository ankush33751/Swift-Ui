//
//  ImageCard.swift
//  Meng UI
//
//  Created by Ankush  Anand on 18/05/21.
//


import SwiftUI
import Contentful
class MiddleSectionStore:ObservableObject{
    @Published var middleSection=[MiddleSectionModal]()
    //            MiddleSectionModal(
    //                                    title: "Build a SwiftUI App", cardLogo:#imageLiteral(resourceName: "Logo1"), sectionCount: 12, cardImage:  #imageLiteral(resourceName: "Card5"), backgroundColor: "card1"),
    //                                MiddleSectionModal(
    //                                    title: "Learn CSS Inside", cardLogo: #imageLiteral(resourceName: "icon_76pt"), sectionCount: 14, cardImage: #imageLiteral(resourceName: "Background1"), backgroundColor: "card2"),
    //                                MiddleSectionModal(
    //                                    title: "Build a SwiftUi App", cardLogo: #imageLiteral(resourceName: "Logo2"), sectionCount: 13, cardImage:#imageLiteral(resourceName: "Card4"), backgroundColor: "card3"),
    //                                MiddleSectionModal(
    //                                    title: "Build a SwiftUi App", cardLogo: #imageLiteral(resourceName: "Logo3"), sectionCount: 12, cardImage: #imageLiteral(resourceName: "Card1"), backgroundColor: "card4")
    //   ]

    init(){
        getArray(){
            items in
            items.forEach{
                item in
                print(item.fields["title"]!)

                self.middleSection.append(
                    MiddleSectionModal( title: item.fields["title"] as! String,
                                        cardLogo: item.fields.linkedAsset(at:"cardLogo")?.url ?? URL(string:"")!,
                                        sectionCount: item.fields["sectionCount"] as! Int,
                                        cardImage: item.fields.linkedAsset(at:"cardImage")?.url ?? URL(string:"")!,
                                        backgroundColor:Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
                )

            }
        }
    }

    private let client = Client(spaceId: "eurathz3ae6j", accessToken: "LxeT0dbfMLXEUbPJWmDRQbbjvzKMniD1vHap0u8W6XM")

    func getArray(contentId:String="course",completion: @escaping ([Entry])->Void){
        let query=Query.where(contentTypeId: "course")
        client.fetchArray(of: Entry.self,matching: query){
            result in
            switch result{
            case .success(let data):
                DispatchQueue.main.async {
                    completion(data.items)
                }
            case .failure(let error):
                print(error)

            }
        }
    }
}

let screen=UIScreen.main.bounds

struct MiddleSectionModal: Identifiable {

    var id:UUID=UUID()
    var title:String
    var cardLogo:URL
    var sectionCount:Int
    var cardImage:URL
    var backgroundColor:Color=Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1))

}


