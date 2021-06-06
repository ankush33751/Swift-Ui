//
//  BottomView.swift
//  Meng UI (iOS)
//
//  Created by Ankush  Anand on 13/05/21.
//

import SwiftUI


struct BottomView: View {
    var subHeading:String
    @Binding var ring:Bool
    var body: some View {
        VStack{
            
            Rectangle()
                .background(Color("background2"))
                .opacity(0.1)
                .frame(width: 40, height: 8, alignment: .center)
                .cornerRadius(5, antialiased: true)
                .padding(.top,8)

            Divider()

            Text(subHeading)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding()
                .padding(.top,30)
                .lineSpacing(3)

            HStack() {
                RingView(borderColor: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)),Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))], width: 100, height: 100, percent: 68, show: $ring)
                    .animation(.easeInOut)
                Spacer()
                VStack(alignment: .leading) {

                    Text("SwiftUI Prototype")
                        .lineSpacing(20)
                        .font(.system(size: 20))
                       // .modifier(CustomFont(customName: "WorkSans-Bold.ttf"))

                    Text("12 of 12 sections completed.")
                        .font(.footnote)
                        .lineSpacing(20)

                    Text("10 hours spent so far.")
                        .font(.footnote)

                    Spacer()

                }.padding()
                .frame(width: 220, height: 80, alignment: .center)
                //.foregroundColor(Color("background2"))
                .background(Color("background3"))
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.14), radius: 20, x: 0, y: 1)

            }.padding()
            Spacer()
        }
    }
}

struct BottomView_Previews: PreviewProvider {
     @State static var completion:CGFloat=80
     @State static var showAnimatedRing:Bool=false
    static var previews: some View {
        
        HStack {
            BottomView(subHeading: "This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.",ring:$showAnimatedRing)
                .frame(maxWidth:.infinity )
                .background(Color.white)
                .cornerRadius(40, antialiased: true)
                .shadow(radius: 20)
              //  .offset(y: 200)


            Spacer()
        }
        
    }
}
