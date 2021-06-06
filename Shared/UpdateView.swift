//
//  Updates.swift
//  Meng UI
//
//  Created by Ankush  Anand on 20/05/21.
//

import SwiftUI

struct UpdateView: View {
    @StateObject  var updateStore=UpdateStore()
    @State var openSheet:Bool=false
    @State var title:String=""
    @State var description:String=""
    @State var date=""

    var body: some View {
        
        ZStack {
            Color("background2").edgesIgnoringSafeArea(.all)
            NavigationView {
                 List{
                    ForEach(updateStore.updates) {
                        data in

                        NavigationLink(destination: DetailView(update:data)){
                            HStack {
                                VStack {
                                    data.image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:60,height:60)
                                        .background(Color("background2"))
                                        .cornerRadius(10)
                                        .padding(.top,8)
                                    Spacer()
                                }

                                VStack(alignment: .leading) {

                                    Text(data.title)
                                        .font(.system(size: 20, weight: .bold, design: .default))

                                    Text(data.descriptionData)
                                                                               //.foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                        .lineLimit(2)

                                    Text(data.date)
                                        .font(.subheadline)
                                        .fontWeight(.light)
                                        //.foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                        .lineLimit(2)

                                }
                            }
                        }
                    }.onDelete(perform: { indexSet in
                        updateStore.updates.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        updateStore.updates.move(fromOffsets:indices,toOffset:newOffset)
                    })



                }
                 .listStyle(InsetListStyle())
                 .sheet(isPresented: $openSheet,onDismiss: {
                    if !title.isEmpty && !description.isEmpty, !date.isEmpty{
                        updateStore.updates.append(UpdateModal(image: Image("Card1"), title: title, descriptionData: description, date: date))
                    }
                }){
                    ZStack {
                        //Color.blue
                        VStack{
                            TextField("Title",text: $title).disableAutocorrection(true)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).stroke())
                                .padding(.bottom)

                            TextField("Date e.g: 02-JAN",text: $date).disableAutocorrection(true)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).stroke())
                                .padding(.bottom)

                            TextEditor(text: $description)
                                .frame(height: 100, alignment: .center)
                                .frame(maxWidth:.infinity)
                                .padding(.horizontal,8)
                                .padding(.top,8)
                                .background(RoundedRectangle(cornerRadius:10).stroke())

                        }.padding()
                    }
                }.navigationBarTitle("Updates")
                .navigationBarItems(leading: Button(action:{
                    openSheet.toggle()
                })
                    {
                    Text("Add")

                },trailing: EditButton())

            }
        }
    }
}


struct Updates_Previews: PreviewProvider {
    static var previews: some View {
        UpdateView()
            .environment(\.colorScheme, .dark)
    }
}
