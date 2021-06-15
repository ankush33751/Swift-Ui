//
//  VideoCard.swift
//  Meng UI
//
//  Created by Ankush  Anand on 18/05/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct VideoCard: View {
    var boldText:String
    var sectionCount:Int
    var cardLogo:WebImage
    var cardImage:WebImage
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading) {
                Text(boldText)
                    .bold()
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    Text("\(sectionCount) Sections")
                    .frame(maxWidth:.infinity,alignment: .leading)
            }
                cardLogo
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: device == .pad ? 60 :40, height: device == .pad ? 60:40, alignment: .center)
                   .clipShape(Circle())
            }.padding(.top)
            
            cardImage
                .resizable()
                .aspectRatio(contentMode: .fit)

        }
    }
}


struct VideoCard_Previews: PreviewProvider {
    static var previews: some View {
        VideoCard(boldText: "Java and SpringBoot", sectionCount: 14, cardLogo: WebImage(url:URL(string: "https://images.ctfassets.net/eurathz3ae6j/FcqQruPC714tlDGOaCt6O/49a52fbd928932252e66afb2c0cc1e5f/Icon.png") ?? URL(string: "")!), cardImage:WebImage(url:URL(string: "https://images.ctfassets.net/eurathz3ae6j/FcqQruPC714tlDGOaCt6O/49a52fbd928932252e66afb2c0cc1e5f/Icon.png") ?? URL(string: "")!))
    }
}
