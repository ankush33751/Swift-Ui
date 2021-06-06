//
//  Test.swift
//  Meng UI (iOS)
//
//  Created by Ankush  Anand on 03/Jun/2021.
//

import SwiftUI

struct Test: View {
    @State var temprary=false
    var body: some View {
        ZStack(alignment:.leading) {
            Text("Hello,asdjgajdbjagdjagdjhagsdhjagshjdgadghjg World!")
                .onTapGesture {
                    temprary.toggle()
                    print(temprary)
                }//.frame(width: 200, height: 100, alignment: .leading)
                .opacity(0)
            Menu("Actions") {
                Button("Duplicate", action: {})
                Button("Rename", action: {})
                Button("Delete…", action: {})
                Menu("Copy") {
                    Button("Copy", action: {})
                    Button("Copy Formatted", action: {})
                    Button("Copy Library Path", action: {})
                }
            }
            //.frame(width: 200, height: 100, alignment: .leading)
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
