//
//  CustomLabel.swift
//  Meng UI (iOS)
//
//  Created by Ankush  Anand on 16/05/21.
//

import SwiftUI

struct CustomLabel:View{
    var systemImageName:String
    var title:String
    var body: some View{
        
        HStack(spacing:16){
            Image(systemName: "\(systemImageName)")
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 32, height: 32, alignment: .leading)
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            
            Text("\(title)")
                .font(.system(size: 20, weight: .bold))
                .frame(width: 120, height: 25, alignment: .leading)
             
        }
    }
}


struct CustomLabel_Previews: PreviewProvider {
    static var previews: some View {
        CustomLabel(systemImageName: "gear", title: "Account")
    }
}
