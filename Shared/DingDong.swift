//
//  DingDong.swift
//  Meng UI (iOS)
//
//  Created by Ankush  Anand on 23/05/21.
//

import SwiftUI

//
//  RingView.swift
//  Meng UI
//
//  Created by Ankush  Anand on 17/05/21.
//

import SwiftUI

struct DingDong<Content>: View where Content:View{

    var borderColor:[Color] = [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)),Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))]
    var width:CGFloat=50
    var height:CGFloat=50
    @Binding var ringCompletion:CGFloat
    @Binding var showAnimatedRing:Bool
    @ViewBuilder var content:()->Content

    func ringLimit(_ value:CGFloat)->CGFloat{
        value>100 ? 1.0 : value/100
    }


    var body: some View {
        //MARK:Progress  Ring
        ZStack {
            Circle()
                    .stroke(Color.black.opacity(0.152), lineWidth: width/12)
                    .frame(width: width, height: height, alignment: .center)
                    .onTapGesture {
                        self.showAnimatedRing.toggle()
                       }

            if content() is Text{
                content()
                    .font(.system(size: width/5, weight: .bold))
                    .frame(width: width/1.15, height: height/1.15, alignment: .center)
                    .onTapGesture {
                        self.showAnimatedRing.toggle()
                       }
            }
            if content() is Image{
                (content() as! Image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width/1.15, height: height/1.15, alignment: .center)
                    .clipShape(Circle())
                    .onTapGesture {
                        self.showAnimatedRing.toggle()
                       }
            }

            Circle()
                .trim(from: 0.0, to: showAnimatedRing ? ringLimit(ringCompletion-2):0)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: borderColor), startPoint: .leading, endPoint: .trailing),
                    style: StrokeStyle(
                        lineWidth: width/20,
                        lineCap: .round,
                        lineJoin: .bevel,
                        miterLimit: 0,
                        dashPhase: 0
                    ))
                .frame(width: width, height: height, alignment: .center)
                .rotationEffect(.degrees(-90))
                .animation(showAnimatedRing ?
                            .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0) : .none)

        }
        .shadow(color: borderColor[0].opacity(0.22), radius: 20, x: 0, y: 0)

    }
}




struct DingDong_Previews: PreviewProvider {
    @State static var ringCompletion:CGFloat=80
    static var  borderSize:CGFloat=10
    @State static var show:Bool=false
    static var previews: some View {
        DingDong(ringCompletion: $ringCompletion, showAnimatedRing: $show){
            Text("\(String(format:"%0.02f",ringCompletion))%")
        }
    }
}

