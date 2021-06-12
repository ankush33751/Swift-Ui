//
//  DetailView.swift
//  Meng UI
//
//  Created by Ankush  Anand on 20/05/21.
//

import SwiftUI

struct DetailView: View {
    var update:UpdateModal
    var body: some View {

        ZStack {
            Color("background2").edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading ) {
                    update.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)

                        .frame(height: 300, alignment: .center)
                        //.blendMode(.darken)

                    Text(update.descriptionData)
                        .font(.subheadline)

                    Spacer()

                }.padding()

            .navigationTitle(update.title)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(update:  UpdateModal(image: Image(uiImage: #imageLiteral(resourceName: "Card4")), title: "Swift UI", descriptionData: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.", date: "02 JAN")).background(Color("background2"))
            .environment(\.colorScheme, .dark)
    }
}
