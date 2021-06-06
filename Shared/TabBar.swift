//
//  TabBar.swift
//  Meng UI
//
//  Created by Ankush  Anand on 21/05/21.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            HomeView().tabItem {
                Label("Home", systemImage: "house.fill")
            }
            Certificates().tabItem {
                Label("certificates", systemImage: "rectangle.stack.fill")
            }
            UpdateView().tabItem {
                Label("Updates", systemImage: "books.vertical.fill")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
