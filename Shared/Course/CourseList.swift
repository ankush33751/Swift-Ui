//
//  CourseList.swift
//  Meng UI (iOS)
//
//  Created by Ankush  Anand on 26/05/21.
//

import SwiftUI

struct CourseList: View {
    @StateObject var course=CardModal()
    @State var active:Int = -1
    @State var activateCard=false
    @State var transition=false
    //@State var activeIndex:Int = -1
    @State var show=false
    var body: some View {

        ZStack {

            Color(show ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1):#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                .edgesIgnoringSafeArea(.all)
            ScrollView(activateCard ? []:.vertical,showsIndicators: false){//activateCard ? []:.vertical,
                VStack {
                    Text("Courses")
                        .font(.title)
                        .bold()
                        .frame(maxWidth:.infinity,alignment: .leading)
                        .padding()
                       .blur(radius: show ? 20:0)

                    ForEach(course.cardData.indices){
                        index in
                         GeometryReader{
                            geometry in
                            Courses(course:$course.cardData[index],
                                    show:$course.cardData[index].expandableCard,
                                    active:$active,
                                    activateCard:$activateCard,
                                    index: index
                            )
                                .offset(y: course.cardData[index].expandableCard ? -geometry.frame(in: .global).minY : 0)
                            .offset(x: active != index && activateCard ? 500:0)



                        }
                        .frame(height:260)
                        .frame(maxWidth: course.cardData[index].expandableCard ? .infinity : screen.width - 105,maxHeight: course.cardData[index].expandableCard ? screen.height:.infinity)
                        .edgesIgnoringSafeArea(.all)
                        .zIndex(course.cardData[index].expandableCard ? 1:0)


                    }
                }
                .frame(width:screen.width)
            }
            .padding(.top,activateCard ? 0:CGFloat(40))

        }
        .edgesIgnoringSafeArea(.all)
        .animation(.linear)

    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
