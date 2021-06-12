//
//  Login.swift
//  Firebase App (iOS)
//
//  Created by Ankush  Anand on 11/Jun/2021.
//

import SwiftUI

struct Login: View {
    @Binding var username:String
    @Binding var password:String
    var body: some View {
        VStack {
            HStack {
                
                Image(systemName: "person.crop.circle")
                    .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                    .aspectRatio(contentMode: .fit)
                    .font(.system(size: device == .pad ? 64:32))
                    .padding(4)
                    .clipShape(RoundedRectangle(cornerRadius: 4))

                TextField("USERNAME", text: $username)
                    .font(.system(size: device == .pad ? 32:16))
            }
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                .frame(height:1)
                .padding(.horizontal,4)

            HStack {

                Image(systemName: "lock.circle")
                    .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                    .aspectRatio(contentMode: .fit)
                    .font(.system(size: device == .pad ? 64:32))
                    .padding(4)
                    .clipShape(RoundedRectangle(cornerRadius: 4))

                SecureField("PASSWORD", text: $password)
                    .font(.system(size: device == .pad ? 32:16))
            }


        }.frame(width:device == .pad ? 600:300,height: device == .pad ? 200:100)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)),Color(#colorLiteral(red: 0.8829971099, green: 0.9685041521, blue: 0.9575159911, alpha: 0.8975605867)).opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.1), radius:10, x: 1, y: 1)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: -1, y: -1)
        .padding(.bottom)

    }
}


struct Login_Previews: PreviewProvider {
    @State static var username=""
    @State static var password=""
    static var previews: some View {
Login(username: $username, password: $password).previewDevice("iPhone 12 mini")
    .previewDisplayName("iPhone 12 mini")
        Login(username: $username, password: $password).previewDevice(PreviewDevice(rawValue: "iPad Pro(12.9 inch)"))
            .previewDisplayName("iPad Pro")
    }
}
