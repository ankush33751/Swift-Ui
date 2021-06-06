//
//  CardModal.swift
//  Meng UI (iOS)
//
//  Created by Ankush  Anand on 25/05/21.
//

import SwiftUI
import Combine

class CardModal: ObservableObject {
    @Published var cardData:[CardData]=[
        CardData( cardTitle: "SwiftUI", logoImage: Image(uiImage: #imageLiteral(resourceName: "icon_40pt")), cardSubheadline: "14 Sections", cardImage: "Card1", cardColor:Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))),
        CardData( cardTitle: "Build An App With Swift UI", logoImage: Image(uiImage: #imageLiteral(resourceName: "Logo1")), cardSubheadline: "10 Sections", cardImage: "Card2", cardColor:Color(#colorLiteral(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 1))),
        CardData( cardTitle: "Build a full site in Webflow", logoImage: Image(uiImage: #imageLiteral(resourceName: "Logo2")), cardSubheadline: "19 Sections", cardImage: "Card3", cardColor:Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)),textColor:Color.black),
        CardData( cardTitle: "Spring Boot crash Course", logoImage: Image(uiImage: #imageLiteral(resourceName: "icon_40pt")), cardSubheadline: "24 Sections", cardImage: "Card4", cardColor:Color(#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1))),
        CardData( cardTitle: "Build a full site in Webflow", logoImage: Image(uiImage: #imageLiteral(resourceName: "Logo2")), cardSubheadline: "19 Sections", cardImage: "Card3", cardColor:Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)),textColor:Color.black),
        CardData( cardTitle: "Spring Boot crash Course", logoImage: Image(uiImage: #imageLiteral(resourceName: "icon_40pt")), cardSubheadline: "24 Sections", cardImage: "Card4", cardColor:Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),  CardData( cardTitle: "Build a full site in Webflow", logoImage: Image(uiImage: #imageLiteral(resourceName: "Logo2")), cardSubheadline: "19 Sections", cardImage: "Card3", cardColor:Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)),textColor:Color.black),
        CardData( cardTitle: "Spring Boot crash Course", logoImage: Image(uiImage: #imageLiteral(resourceName: "icon_40pt")), cardSubheadline: "24 Sections", cardImage: "Card4", cardColor:Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),  CardData( cardTitle: "Build a full site in Webflow", logoImage: Image(uiImage: #imageLiteral(resourceName: "Logo2")), cardSubheadline: "19 Sections", cardImage: "Card3", cardColor:Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)),textColor:Color.white),
        CardData( cardTitle: "Spring Boot crash Course", logoImage: Image(uiImage: #imageLiteral(resourceName: "icon_40pt")), cardSubheadline: "24 Sections", cardImage: "Card4", cardColor:Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),  CardData( cardTitle: "Build a full site in Webflow", logoImage: Image(uiImage: #imageLiteral(resourceName: "Logo2")), cardSubheadline: "19 Sections", cardImage: "Card3", cardColor:Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)),textColor:Color.white),
        CardData( cardTitle: "Spring Boot crash Course", logoImage: Image(uiImage: #imageLiteral(resourceName: "icon_40pt")), cardSubheadline: "24 Sections", cardImage: "Card4", cardColor:Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),  CardData( cardTitle: "Build a full site in Webflow", logoImage: Image(uiImage: #imageLiteral(resourceName: "Logo2")), cardSubheadline: "19 Sections", cardImage: "Card3", cardColor:Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)),textColor:Color.black),
        CardData( cardTitle: "Spring Boot crash Course", logoImage: Image(uiImage: #imageLiteral(resourceName: "icon_40pt")), cardSubheadline: "24 Sections", cardImage: "Card4", cardColor:Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),  CardData( cardTitle: "Build a full site in Webflow", logoImage: Image(uiImage: #imageLiteral(resourceName: "Logo2")), cardSubheadline: "19 Sections", cardImage: "Card3", cardColor:Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)),textColor:Color.black),
        CardData( cardTitle: "Spring Boot crash Course", logoImage: Image(uiImage: #imageLiteral(resourceName: "icon_40pt")), cardSubheadline: "24 Sections", cardImage: "Card4", cardColor:Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),  CardData( cardTitle: "Build a full site in Webflow", logoImage: Image(uiImage: #imageLiteral(resourceName: "Logo2")), cardSubheadline: "19 Sections", cardImage: "Card3", cardColor:Color(#colorLiteral(red: 1, green: 0.4627451003, blue: 0.8274509907, alpha: 0.6180594233)),textColor:Color.black),
        CardData( cardTitle: "Spring Boot crash Course", logoImage: Image(uiImage: #imageLiteral(resourceName: "icon_40pt")), cardSubheadline: "24 Sections", cardImage: "Card4", cardColor:Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),  CardData( cardTitle: "Build a full site in Webflow", logoImage: Image(uiImage: #imageLiteral(resourceName: "Logo2")), cardSubheadline: "19 Sections", cardImage: "Card3", cardColor:Color(#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)),textColor:Color.black),
        CardData( cardTitle: "Spring Boot crash Course", logoImage: Image(uiImage: #imageLiteral(resourceName: "icon_40pt")), cardSubheadline: "24 Sections", cardImage: "Card4", cardColor:Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),  CardData( cardTitle: "Build a full site in Webflow", logoImage: Image(uiImage: #imageLiteral(resourceName: "Logo2")), cardSubheadline: "19 Sections", cardImage: "Card3", cardColor:Color(#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)),textColor:Color.black),
        CardData( cardTitle: "Spring Boot crash Course", logoImage: Image(uiImage: #imageLiteral(resourceName: "icon_40pt")), cardSubheadline: "24 Sections", cardImage: "Card4", cardColor:Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),

    ]
   }

struct CardData:Identifiable{
    var id=UUID()
    var cardTitle:String=""
    var logoImage:Image=Image(uiImage: #imageLiteral(resourceName: "Logo1"))
    var cardSubheadline:String=""
    var cardImage:String=""
    var cardColor:Color=Color.blue
    var textColor:Color=Color.white
    var cardDesc:CardDescription=CardDescription()
    var expandableCard:Bool=false

    init(cardTitle: String, logoImage: Image, cardSubheadline:String, cardImage: String, cardColor:Color,textColor:Color){
        self.cardTitle=cardTitle
        self.logoImage=logoImage
        self.cardSubheadline=cardSubheadline
        self.cardImage=cardImage
        self.cardColor=cardColor
        self.textColor=textColor
    }
    init(cardTitle: String, logoImage: Image, cardSubheadline:String, cardImage: String, cardColor:Color){
        self.cardTitle=cardTitle
        self.logoImage=logoImage
        self.cardSubheadline=cardSubheadline
        self.cardImage=cardImage
        self.cardColor=cardColor
       
    }
}

class CardDescription{
    var summary:String="Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS."
    var headline:String="About this course"
    var description:String="This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions."

    init(summary:String,headline:String,description:String) {
        self.summary=summary
        self.headline=headline
        self.description=description
    }
    init(){

    }
}
