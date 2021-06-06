//
//  ContentView.swift
//  Shared
//
//  Created by Ankush  Anand on 12/05/21.
//

import SwiftUI

struct Certificates: View {
    
    @State var show=false
    @State var cordinate=CGSize.zero
    @State var showCard=false
    @State var bottomCardVisibility=false
    @State var bottomCardPosition=CGSize.zero
    @State var completion:CGFloat=80

    // @State var cordinateOfFirstCard=CGSize.zero
    // @State var cordinateOfSecondCard=CGSize.zero
    //@State var cordinateOfThirdCard=CGSize.zero
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Text("Certificates")
                        .bold()
                        .font(.title)
                    Spacer()
                }.padding(.horizontal)

                Image(uiImage: #imageLiteral(resourceName: "Background1"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                Spacer()
            }

            ZStack{
                CardView(title: "Swift UI", imageName:"Card3", imageWidth: 140, imageHeight: 140, logoImage: #imageLiteral(resourceName: "Logo2"))
                    .background(Color("card3"))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .frame(width: 320, height: 200, alignment: .center)
                    .offset(y:-55)
                    .offset(y:show ? -140:0)
                    .rotation3DEffect(
                        .degrees(show ? 0:10),
                        axis: (x: 0.0, y:0, z: show ? 0:1.0)
                    )
                    .scaleEffect(show ? 0.75:0.85)
                   // .blendMode(.darken)
                    .animation(.linear(duration: 0.3).delay(0.1))

                CardView(title: "Swift UI", imageName:"Card2", imageWidth: 140, imageHeight: 140,logoImage: #imageLiteral(resourceName: "Logo3"))
                    .background(Color("card2"))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .frame(width: 320, height: 200, alignment: .center)
                    .offset(y:-20)
                    .offset(y: show ? -80:0)
                    .rotation3DEffect(
                        .degrees(show ? 0:5),
                        axis: (x: 0.0, y:0, z: show ? 0:1.0)
                    )
                   // .blendMode(.hardLight)
                    .scaleEffect(show ? 0.85:0.95)
                    .animation(.linear(duration: 0.3))
                CardView(title: "Swift UI",imageName:"Card1", imageWidth: 140, imageHeight: 140)
                    .background(Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .frame(width: 320, height: 200, alignment: .center)
                    .blendMode(.hardLight)


            }//.frame(width: 320, height: 320, alignment: .center)
            .onTapGesture {
                show.toggle()
            }
            VStack{
                Spacer()
                BottomView(subHeading: "This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.", ring: $bottomCardVisibility)
                    .background(Color("background3"))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .offset(y:screen.height-130)
                    .offset(y:cordinate.height)
                    .gesture(
                        DragGesture().onChanged { value in
                            self.cordinate = value.translation
                            if self.show {
                                self.cordinate.height += -300
                            }
                            if self.cordinate.height < -300 {
                                self.cordinate.height = -300
                            }
                        }
                        .onEnded { value in
                            if self.cordinate.height > 50 {
                              self.showCard = false
                            }
                            if (self.cordinate.height < -100 && !self.show) || (self.cordinate.height < -250 && self.show) {
                                self.cordinate.height = -300
                                self.show = true
                            } else {
                                self.cordinate = .zero
                                self.show = false
                            }
                        }
                    )

                    .animation(.easeInOut)
            }
        }
    }
}

struct Certificates_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //  Certificates().previewDevice("iPad Air (4th generation)")
            Certificates().previewDevice("iPhone 12 mini")
                .environment(\.colorScheme, .dark)
            
        }
    }
}



