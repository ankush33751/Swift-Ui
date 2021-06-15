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
                .bold()
                .font(.system(size: device == .pad ? 32:24))
                .font(.title)





            Spacer()
            Image(uiImage: #imageLiteral(resourceName: "Photo"))
                .resizable()
                .imageScale(.large)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width:device == .pad ? 80:50, height: device == .pad ? 80:50)
                
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
                            .font(.system(size: device == .pad ? 40:24))
                            
                        Circle()
                            .fill(Color.red)
                            .frame(width:device == .pad ? 20:10,height:device == .pad ?20:10)
                            .offset(x:device == .pad ? 30:10,y: device == .pad ? -34:-12)
                    }
                    .frame(width: device == .pad ?100:40 , height: device == .pad ?100:40)
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
