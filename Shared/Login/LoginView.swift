//
//  LoginView.swift
//  Firebase App (iOS)
//
//  Created by Ankush  Anand on 10/Jun/2021.
//

import SwiftUI

struct LoginView: View {

    @State var show:Bool=false
    @State var effect3D:CGSize = .zero
    @State var username=""
    @State var password=""
    @State var isDragging=false
    var body: some View {
        ZStack {
            VStack(alignment:.center) {
                //MARK: Top Card
                GeometryReader {
                    gr in

                    VStack {
                        Text("Learn design & code from scratch.")
                            .font(.system(size:gr.size.width/13, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)

                        Text("80 hours of courses for SwiftUI, React and design tools.")
                            .font(.system(size:gr.size.width/24, weight: .medium))
                            .multilineTextAlignment(.center)
                            .font(.footnote)
                    }
                    .padding(.horizontal, device == .pad ? 32:16)
                    .offset(y: device == .pad ? 100:60)
                }.frame(width:screen.width,height:device == .pad ? 800:500,alignment: .center)
                .background(
                    Image(uiImage: #imageLiteral(resourceName: "Card4"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:device == .pad ? 400:250)
                        .padding(.bottom)
                    ,alignment: .bottom)
                .background(MovingShapes(show: $show) .animation(.linear(duration: 50).repeatForever(autoreverses: false)))
                .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).edgesIgnoringSafeArea(.all))
                .clipShape(RoundedCornerShape(corners: [.bottomRight,.bottomLeft], radius: 30))
                .scaleEffect(isDragging ? 0.9:1)
                .rotation3DEffect(.degrees(10),axis: (x: effect3D.width , y: effect3D.height, z: 0))

                .offset(y:-50)
                .onAppear{
                    show=true
                }//.offset(y:effect3D.height)

                .gesture(
                    DragGesture()
                        .onChanged{
                            effect3D=$0.translation
                            isDragging = true
                        }.onChanged{
                            _ in
                            effect3D = .zero
                            isDragging = false
                        })
               //


//MARK:Username and Password

                Login(username: $username, password: $password)
                    .offset(y: device == .pad ? 0:-80)

//MARK:Login and Forget Button.
                HStack {
                    Spacer()
                    Button(action:{

                    }){
                        Text("Forget Password?")
                            .modifier(DeviceFont())

                    }
                    Spacer()
                    Button(action:{

                    }){
                        Text("Login")
                            .modifier(DeviceFont())
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(RoundedCornerShape(corners: [.topLeft], radius: 20))
                    }
                    Spacer()

                }.padding(.horizontal)
                .offset(y: device == .pad ? 0: -80)
                Spacer()
            }
        }
    }

}




struct MovingShapes: View {
    @Binding var show:Bool
    var body: some View {
        ZStack {
            Image(uiImage: #imageLiteral(resourceName: "Blob"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .blendMode(.hardLight)
                .rotationEffect(.degrees(show ? 360:0))
                .offset(x:-screen.width/3,y:-screen.height/4)
            Image(uiImage: #imageLiteral(resourceName: "Blob"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(show ? 360:0))
                .offset(x:screen.width/3,y:-screen.height/4)
                .blendMode(.colorBurn)
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {


        Group {
            LoginView().previewDevice("iPhone 12 mini")
                .previewDisplayName("iPhone 12 mini")

        LoginView().previewDevice(PreviewDevice(rawValue: "iPad Pro(12.9 inch) (5th generation)"))
            .previewDisplayName("iPad Pro")
        }

    }
}
