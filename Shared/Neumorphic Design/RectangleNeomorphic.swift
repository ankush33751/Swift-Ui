//
//  NeumorphicButton.swift
//  Firebase App
//
//  Created by Ankush  Anand on 08/Jun/2021.
//

import SwiftUI

struct RectangleNeomorphic: View {
    @State var longPressChange:Bool=false
    @Binding var colorSwitch:Bool
    var body: some View {
        VStack{
            Text("Button")
                .bold()
                .frame(width:180,height:60)
                .background(
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color(colorSwitch ? #colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(colorSwitch ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)


                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .foregroundColor(Color(colorSwitch ? #colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1):#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .blur(radius:4)
                            .offset(x:-8,y:-8)

                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(2)
                            .blur(radius: 2)
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .overlay(
                    ProfileIcon(colorSwitch: $colorSwitch)
                        .shadow(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.3), radius: 20, x: 5, y: 10)
                        .offset(x:colorSwitch ? 0 :-8,y:colorSwitch ? 20:0)
                )
                .shadow(color: Color(colorSwitch ?#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1): #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: 20, y: 20)
                .shadow(color: Color(colorSwitch ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1):#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
                .scaleEffect(longPressChange ? 1:0.9)
                .gesture(
                    LongPressGesture(minimumDuration: 0.5, maximumDistance: 100)
                        .onChanged{ _ in
                            longPressChange=true
                            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                            DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {

                                longPressChange=false
                                //haptic
                                UINotificationFeedbackGenerator().notificationOccurred(.success)

                            }
                        }.onEnded{
                            _ in
                            colorSwitch.toggle()
                        })
                .animation(.spring(response: 0.5, dampingFraction: 0.4, blendDuration: 0))

        }
    }
}



struct RectangleNeomorphic_Previews: PreviewProvider {

    static var previews: some View {
        @State  var colorSwitch:Bool=false
       return  RectangleNeomorphic(colorSwitch:$colorSwitch)
    }
}
