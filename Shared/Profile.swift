//
//  Profile.swift
//  Meng UI
//
//  Created by Ankush  Anand on 15/05/21.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                Text("Ankush - 28% Completed")
                    .font(.footnote)
                    .fontWeight(.light)
                   // .foregroundColor(Color("background3"))
                
                Color.white
                    .frame(width: 20, height: 6, alignment: .center)
                    .cornerRadius(20)
                    .frame(width: 130, height: 4, alignment: .leading)
                    .background(Color("background2").opacity(0.08))
                    .cornerRadius(20)
                    .frame(width: 150, height: 20, alignment: .center)
                    .background(Color("background2"))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding(.bottom)
                
                CustomLabel(systemImageName: "gear", title: "Account")
                
                CustomLabel(systemImageName: "creditcard", title: "Billing")
                
                CustomLabel(systemImageName: "person.crop.circle", title: "Profile")
            }
            .frame(maxWidth: .infinity)
            .frame(height:250)
            .background(LinearGradient(gradient: Gradient(colors: [Color("background3"),Color("background1")]), startPoint: .top
                                       , endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding()
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal,30)
            .overlay(
                
                Image("Photo")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .offset(y:-130)
               )
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Group {
          //  Profile().previewDevice("iPad Air (4th generation)")
            Profile().previewDevice("iPhone 12 mini")
                .environment(\.colorScheme, .dark)
        }
    }
}

