//
//  CardView.swift
//  Meng UI (iOS)
//
//  Created by Ankush  Anand on 13/05/21.
//

import SwiftUI

struct CardView: View {
    var title:String
    var imageName:String="Card2"
    var imageWidth:CGFloat
    var imageHeight:CGFloat
    var logoImage:UIImage=#imageLiteral(resourceName: "Logo1")
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(title)")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Certificate")
                    
                }
                Spacer()
                Image(uiImage:logoImage)
                
            }.padding(.all)
            .foregroundColor(.white)
            Spacer()
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageWidth, height: imageHeight)
        }
    }
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "UI Design", imageWidth: 300, imageHeight: 100)
            .frame(width: 340, height: 240, alignment: .center)
            .background(Color("card3"))
            .cornerRadius(20, antialiased: true )
            .shadow(radius: 20)
          //  .rotationEffect(.init(degrees: 0))
            .offset(x:3,y: -20.0)
            .scaleEffect(0.95)
            .blendMode(.hardLight)
    }
}
