//
//  FingerPrint.swift
//  Firebase App
//
//  Created by Ankush  Anand on 08/Jun/2021.
//

import SwiftUI

struct FingerPrint: View {
    @State var switchToMode=false
    @GestureState var tapGes=false
    var body: some View {
        ZStack {
            Image(uiImage: #imageLiteral(resourceName: "fingerprint"))
                .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                .frame(width:40,height: 40)
                .scaleEffect(tapGes ? 1.2:1)
                .opacity(tapGes ? 0:1)
                .animation(.linear(duration: 0.5))
            Image(uiImage: #imageLiteral(resourceName: "fingerprint-2"))
                .clipShape(Rectangle().offset(y:tapGes ? 0:80))
                .frame(width:40,height: 40)
                .opacity(tapGes ? 1:0)
                .animation(.linear(duration: 0.5))
                .scaleEffect(tapGes ? 1.2:1)

            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 44, weight: .light))
                .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                .opacity(tapGes ? 1:0)
                .scaleEffect(tapGes ? 1.2:0)
                .animation(.linear(duration: 0.5).delay(0.6))
        }.animation(.easeIn(duration: 0.5))
        .frame(width:100,height: 100)


        .font(.system(size: 32))
        .clipShape(Circle())
        .background(
            ZStack {

                Circle()
                    .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .blur(radius: 5)

                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(4)


            })
        .scaleEffect(tapGes ? 1.2:1)
        .overlay(
            Circle()
                .trim(from: 0.0, to: tapGes ? 1.0:0.0)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round, miterLimit: 0, dash: [], dashPhase: 0))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut.delay(0.3))
                .padding()

        )
        .gesture(LongPressGesture()
                    .updating($tapGes){
                       
                        currentState, gestureState, transaction in
                        gestureState=currentState
                    }.onEnded{ _ in
                        switchToMode.toggle()
                    }
        ) .shadow(color: Color(switchToMode ?#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1):#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).opacity(0.7), radius: 30, x: -20, y: -20)
        .shadow(color: Color(switchToMode ?#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1): #colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)), radius: 30, x:20, y: 20)
        .animation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0))
    }
}

struct FingerPrint_Previews: PreviewProvider {
    static var previews: some View {
        FingerPrint()
    }
}
