//
//  ApiCallList.swift
//  Meng UI (iOS)
//
//  Created by Ankush  Anand on 01/06/21.
//

import SwiftUI

struct ApiCallList: View {
    @StateObject var datamodel:Store=Store()
    init() {
          UITableView.appearance().showsVerticalScrollIndicator = false
      }
    var body: some View {
        
        List(datamodel.posts){
            post in
            LazyVStack(alignment:.leading) {
                Text(post.title)
                    .foregroundColor(.primary)
                    .bold()
                    .font(.system(size:24,design: .serif))
                Text(post.body)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ApiCallList_Previews: PreviewProvider {
    static var previews: some View {
        ApiCallList()
    }
}

