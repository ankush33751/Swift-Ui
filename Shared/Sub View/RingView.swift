//
//  RingView.swift
//  Meng UI
//
//  Created by Ankush  Anand on 17/05/21.
//

import SwiftUI

struct RingView: View{

    var borderColor:[Color] = [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))]
    var width:CGFloat=40
    var height:CGFloat=40
    var percent:CGFloat
    @Binding var show:Bool
    var body: some View {

        let multiplier = width / 44
        let progress = 1 - (percent / 100)

        //MARK:Progress  Ring
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)

            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: borderColor), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
                )
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: borderColor[1].opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)

            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
                .onTapGesture {
                    self.show.toggle()
            }
        }


    }
}


struct RingView_Previews: PreviewProvider {

    static var previews: some View {
        @State  var show:Bool=false
       return  RingView(percent: 80,show: $show)
    }
}
