//
//  Courses.swift
//  Meng UI (iOS)
//
//  Created by Ankush  Anand on 25/05/21.
//

import SwiftUI

struct Courses: View {
    @Binding var course:CardData
    @Binding var show:Bool
    @Binding var active:Int
    @Binding var activateCard:Bool
    @State var transition:CGSize = .zero
    @Namespace var id
    var index:Int
    var body: some View {

        ZStack(alignment: .top) {

            VStack(alignment:.leading, spacing:30) {
                Text(course.cardDesc.headline)
                    .font(.title)

                Text(course.cardDesc.description)
                    .font(.headline)

                Text(course.cardDesc.summary)
                    .font(.body)

            }.foregroundColor(.black)
            .padding(.vertical,30)
            .padding(.horizontal)
            .background(Color.white)
            .frame(maxWidth: course.expandableCard ? .infinity : screen.width - 140, maxHeight: course.expandableCard ? .infinity : CGFloat(280), alignment: .top)
            .frame(height:course.expandableCard ? 1000:CGFloat(280))
            .offset(y:course.expandableCard ? screen.height/2.1:0)
            .opacity(course.expandableCard ? 1 : 0)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            

            VStack {

                HStack(alignment: .top) {

                    VStack(alignment: .leading) {

                        Text(course.cardTitle)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(course.textColor)

                        Text(course.cardSubheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))

                        Spacer()

                    }.frame(width:220,height:80,alignment: .leading)

                    Spacer(minLength: 20)

                    Button(action:{
                        course.expandableCard=false
                        show=false
                        activateCard=false
                        active = -1
                    }){

                        ZStack {

                            course.logoImage
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:40)
                                .clipShape(Circle())
                                .animation(.easeInOut)
                                .opacity(course.expandableCard ? 0:1)

                            Image(systemName:"xmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                .padding(12)
                                .frame(height:40)
                                .background(course.expandableCard ? Color.black:Color.clear)
                                .clipShape(Circle())
                                .opacity(course.expandableCard ? 1:0)

                        }
                    }
                }.padding(.top, course.expandableCard ? CGFloat(32):CGFloat(16))

                Spacer()

                Image(course.cardImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:screen.width-100,height:course.expandableCard ? CGFloat(300):150, alignment: .center)
            }
            .frame(width:course.expandableCard ? .infinity:screen.width-140,height: course.expandableCard ? screen.height/2.19: 220, alignment: .center)
            .padding()
            .background(course.cardColor)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            //            .gesture(
            //                show ? DragGesture()
            //                    .onChanged{
            //                        value in
            //                      if value.translation.height<300{
            //                            transition=value.translation
            //                      }
            //                    }
            //                    .onEnded{
            //                        value in
            //                        transition=value.translation
            //                        course.expandableCard=false
            //                        show=false
            //                        activateCard=false
            //                        active = index
            //                        transition = .zero
            //
            //
            //                    }
            //            :nil)
            .onTapGesture {
                course.expandableCard=true
                show=true
                activateCard=true
                active = index
            }
            .shadow(color: course.cardColor.opacity(0.29), radius: 20, x: 0, y: 20)

        }
        //.scaleEffect(show ? 1-transition.height/500:1)
        .hueRotation(.degrees(Double(transition.height)/1.2))
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
    }
}
struct Courses_Previews: PreviewProvider {
    @State static var cardModel=CardModal()
    @State static var activeIndex:Int=1
    static var previews: some View {
        Courses(course: $cardModel.cardData[10],show: $cardModel.cardData[1].expandableCard, active: $activeIndex, activateCard:  $cardModel.cardData[1].expandableCard,index: -1)
        //        Courses(course: cardModel.cardData[1])
    }
}


