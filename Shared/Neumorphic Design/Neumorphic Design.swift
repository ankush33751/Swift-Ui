//
//  Neumorphic esign.swift
//  Firebase App
//
//  Created by Ankush  Anand on 07/Jun/2021.
//

import SwiftUI

struct Neumorphic_Design: View {
    @State var colorSwitch=false
    @State var switchToMode=false

    var body: some View {
        

        ZStack {
            Color(switchToMode ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1):#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                .edgesIgnoringSafeArea(.all)
                .animation(.easeInOut.delay(0.4))

            VStack {
            RectangleNeomorphic(colorSwitch:$colorSwitch)

                Spacer()

                ButtonNeumorphic(switchToMode:$switchToMode)

                Spacer()

                FingerPrint()
    Spacer()
            }.frame(width: .infinity,height: .infinity)
        }
    }
}

struct Neumorphic_esign_Previews: PreviewProvider {
    static var previews: some View {
        Neumorphic_Design()
    }
}

struct ProfileIcon: View {
    @Binding var colorSwitch:Bool
    var body: some View {
        HStack{
            Image(systemName: "person.crop.circle")
                .font(.system(size: 24))
                .foregroundColor(Color.white.opacity(colorSwitch ? 0:1))
                .aspectRatio(contentMode: .fit)
                .frame(width: colorSwitch ? CGFloat(65):50, height: colorSwitch ? CGFloat(5):50)
                .background(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

            if !colorSwitch {
                Spacer()
            }

        }

    }
}

