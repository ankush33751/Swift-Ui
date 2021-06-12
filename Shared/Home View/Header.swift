//
//  Header.swift
//  Meng UI
//
//  Created by Ankush  Anand on 18/05/21.
//

import SwiftUI

struct Header: View {
    @Binding var showProfile:Bool
    @Binding var notificationlist:Bool
    @State var letterAnimate:Bool=false
    var body: some View {
        HStack {

            Text("Watching")
               .modifier(CustomFont(customName: "WorkSans-ExtraBold.ttf",size: 32))


            Spacer()
            Image(uiImage: #imageLiteral(resourceName: "Photo"))
                .resizable()
                .imageScale(.large)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                
                .onTapGesture {
                    showProfile.toggle()
                }.shadow(radius: 10)
         //   if(notificationlist){
                Button(
                    action: {
                        notificationlist.toggle()
                    }
                ){
                    ZStack {
                        Image(systemName: "bell")
                            .imageScale(.large)
                            .aspectRatio(contentMode: .fit)
                            //.frame(width: 30, height: 30)
                            
                        Circle()
                            .fill(Color.red)
                            .frame(width:10,height:10)
                            .offset(x:10,y:-12)
                    }
                    .frame(width: 40 , height: 40)
                    .background(Circle().fill(Color("background3")))
                    .shadow(radius: 10)
                    
                }
           // }
        }
        .padding(.top)
        
    }
}
struct Header_Previews: PreviewProvider {
    @State static var showProfile=true
    static var previews: some View {
        Header(showProfile: $showProfile,notificationlist: .constant(false))
            //.environment(\.colorScheme, .dark)
    }
}
