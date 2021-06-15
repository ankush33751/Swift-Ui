   //
    //  Home.swift
    //  Meng UI (iOS)
    //
    //  Created by Ankush  Anand on 16/05/21.
    //

import SwiftUI
import SDWebImageSwiftUI
    struct HomeView: View {
        @State var showProfile=false
        @State var dragHome=CGSize.zero
        @State var cardRotation=false
        @State var notificationlist=false
        @State var showRing:Bool=true
        @State var transtionIf=false
        @StateObject var middleSectionStore=MiddleSectionStore()


        var body: some View {

            return  ZStack {
                //MARK:Backgound Color
               LinearGradient(gradient: Gradient(colors: [Color("background2"),Color("background1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                ScrollView{

                 VStack {

                        //MARK:Header Section Scroll
                        Header(showProfile:$showProfile,notificationlist: $notificationlist)
                            .padding(.horizontal)


                        ScrollView(.horizontal,showsIndicators:false) {
                          HStack{

                                ZStack {

                                    HStack {
                                        RingView(borderColor: [Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)),Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))], width: device == .pad ?60:40, height:device == .pad ?60:40, percent: 68, show: $showRing)
                                            .animation(.easeInOut)
                                        Spacer()

                                        VStack(alignment:.leading) {

                                            Text("68% is completed.")
                                                .font(device == .pad ? .body:.caption)

                                            Text("Watch more.")
                                                .font(device == .pad ? .body:.caption)
                                        }
                                    }.padding()
                                    .onTapGesture {
                                        transtionIf.toggle()
                                    }
                                }
                                .background(Color("background3"))
                                .cornerRadius(20)
                                .shadow(radius: 5)
                                .padding(.vertical,8)

                                ForEach(0 ..< 7) { _ in
                                    RingView(borderColor: [Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)),Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))], width: device == .pad ?60:40, height:device == .pad ?60:40, percent: 52, show: $showRing)
                                        .frame(width: device == .pad ? 100:60, height: device == .pad ?100:60, alignment: .center)
                                        .background(Color("background3"))
                                        .clipShape(Circle())
                                        .padding(.vertical,8)
                                        .animation(.easeInOut)
                                }
                            }
                            .padding(.horizontal)
                        }

                        //MARK: Middle Card Section

                        ScrollView(.horizontal,showsIndicators:false) {

                            HStack(spacing:30) {
                                ForEach(middleSectionStore.middleSection){
                                    section in

                                    GeometryReader { gr in
                                        MiddleCard(section: section)
                                            .onTapGesture {
                                                cardRotation.toggle()

                                            }.scaleEffect(1)
                                            .rotation3DEffect(
                                                .degrees(Double(gr.frame(in: .global).maxX)/50),
                                                axis: (x:0,y:1,z:0)
                                            )
                                            .animation(.easeInOut)

                                    }.frame(width: device == .pad ? 300:200, height: device == .pad ? 400:260, alignment: .center)
                                    .padding(.vertical, device == .pad ? 60:20)
                                    .padding(.leading,32)
                                }
                            }
                        }

                        Text("25 Courses")
                            .bold()
                            .font(.title)
                            .frame(maxWidth:.infinity,alignment: .leading)
                            .padding(.horizontal)


                        VideoCard(boldText: "Java and SpringBoot", sectionCount: 14, cardLogo: WebImage(url:URL(string: "https://images.ctfassets.net/eurathz3ae6j/FcqQruPC714tlDGOaCt6O/49a52fbd928932252e66afb2c0cc1e5f/Icon.png") ?? URL(string: "")!), cardImage:WebImage(url:URL(string: "https://images.ctfassets.net/eurathz3ae6j/FcqQruPC714tlDGOaCt6O/49a52fbd928932252e66afb2c0cc1e5f/Icon.png") ?? URL(string: "")!))
                            .frame(width: 300, height: 280, alignment: .center)
                            .padding(.horizontal)
                            .background(Color("background3"))
                            .cornerRadius(30)
                            .blendMode(.hardLight)

                        Spacer()
                    }

                    .scaleEffect(showProfile ? 0.80:1)
                    .rotation3DEffect(
                        .degrees(showProfile ? 10:0),
                        axis: (x: 1, y: 0, z: 0.0)
                    ).offset(y:showProfile ? -500:0)
                    .offset(y:dragHome.height)

                    .gesture(
                        DragGesture()
                            .onChanged{
                                value in
                                dragHome=value.translation

                                if dragHome.height > 20 {
                                    dragHome.height = 0
                                    showProfile.toggle()
                                }
                            }.onEnded{
                                value in
                                dragHome=value.translation

                                if dragHome.height > 20 {
                                    dragHome.height = 0
                                    showProfile.toggle()
                                }
                            }
                    )
                    .animation(.spring(response: 0.5, dampingFraction: 0.543, blendDuration: 0))

                    .shadow(radius: showProfile ? 20:0)



                }.sheet(isPresented: $notificationlist, content: {
                    UpdateView()
                        .background(BlurEffect(style: .systemMaterial))
                })

                //MARK:Profile Section

                Profile()
                    .offset(y:showProfile ? 0:600)
                    .animation(.spring(response: 0.5, dampingFraction: 0.543, blendDuration: 0))
                ZStack {
                    if transtionIf{
                        Color.white.edgesIgnoringSafeArea(.all)

                        Certificates()
                            .background(BlurEffect(style: .systemMaterial))
                            .transition(.asymmetric(insertion: .move(edge: .leading), removal: AnyTransition.move(edge: .trailing)))

                        VStack {
                            HStack{
                                Spacer()
                                Button(action:{
                                    withAnimation(.easeInOut){
                                        transtionIf.toggle()
                                    }
                                }){
                                    Image(systemName:"xmark")
                                        .font(.system(size: 24,weight: .bold))
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:40,height:40)
                                        .foregroundColor(Color("background2"))
                                        .background(Color.blue)
                                        .clipShape(Circle())
                                        .padding()
                                }
                            }
                            Spacer()

                        }
                    }
                }

            }
            .animation(.easeInOut)
        }
    }

    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
               //.environment(\.colorScheme, .dark)
//            HomeView().environment(\.colorScheme, .dark)
//            HomeView().previewDevice("iPhone 12 mini")
        }
    }


