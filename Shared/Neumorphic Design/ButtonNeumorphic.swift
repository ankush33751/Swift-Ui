//
//  ButtonNeumorphic.swift
//  Firebase App
//
//  Created by Ankush  Anand on 08/Jun/2021.
//

import SwiftUI

struct ButtonNeumorphic: View {
    @Binding var switchToMode:Bool
    var body: some View {
        ZStack {
            Image(systemName: "sun.max")
                .font(.system(size: 44, weight: .light))
                .offset(x: switchToMode ? -100 : 0, y: switchToMode ? -100 : 0)
            Image(systemName: "moon")
            .font(.system(size: 44, weight: .light))
            .offset(x: switchToMode ? 0 : 100, y: switchToMode ? 0 : 100)
        }
        .frame(width:100,height: 100)
        .foregroundColor(Color(switchToMode ? #colorLiteral(red: 0.8290756357, green: 0.3820695168, blue: 0.3539609067, alpha: 1):#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
       // .rotationEffect(.degrees(switchToMode ? 360:0))
        .font(.system(size: 32))
        .clipShape(Circle())
        .background(
            ZStack {

                Circle()
                    .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .blur(radius: 5)

                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)), Color(switchToMode ? #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1):#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(4)


            })
        .scaleEffect(switchToMode ? 1.2:1)
        .gesture(LongPressGesture()
                    .onChanged{
                        _ in
                        switchToMode.toggle()
                        //                                    DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
                        //                                        switchToMode=false
                        //                                    }
                    }
                    .onEnded{
                        _ in

                    }

        ) .shadow(color: Color(switchToMode ?#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1):#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).opacity(0.7), radius: 30, x: -20, y: -20)
        .shadow(color: Color(switchToMode ?#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1): #colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)), radius: 30, x:20, y: 20)
        .animation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0))
    }
}

struct ButtonNeumorphic_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNeumorphic(switchToMode:.constant(false))
    }
}
