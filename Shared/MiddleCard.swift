//
//  MiddleCard.swift
//  Meng UI (iOS)
//
//  Created by Ankush  Anand on 17/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MiddleCard: View {
    
    var section:MiddleSectionModal
   
    var body: some View {
        VideoCard(boldText:section.title, sectionCount: section.sectionCount, cardLogo:WebImage(url: section.cardLogo), cardImage: WebImage(url:section.cardImage))
                .frame(width: 200, height: 240, alignment: .center)
                .padding(.horizontal)
                .background(section.backgroundColor)
                .cornerRadius(20)
                .blendMode(.hardLight)
                .shadow(color: section.backgroundColor.opacity(0.1), radius: 20, x: 0, y: 1)
    }
}

struct MiddleCard_Previews: PreviewProvider {
    static var previews: some View {
        MiddleCard(section: MiddleSectionModal(
                    title: "Learn CSS Inside",
                    cardLogo: URL(string: "https://images.ctfassets.net/eurathz3ae6j/FcqQruPC714tlDGOaCt6O/49a52fbd928932252e66afb2c0cc1e5f/Icon.png") ?? URL(string: "")!,
                    sectionCount: 14,
                    cardImage: URL(string: "https://images.ctfassets.net/eurathz3ae6j/FcqQruPC714tlDGOaCt6O/49a52fbd928932252e66afb2c0cc1e5f/Icon.png") ?? URL(string: "")!,
                    backgroundColor:Color("0xf0ff")))


    }
}

