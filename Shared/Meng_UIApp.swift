//
//  Meng_UIApp.swift
//  Shared
//
//  Created by Ankush  Anand on 12/05/21.
//

import SwiftUI

@main
struct Meng_UIApp: App {
    var body: some Scene {
        WindowGroup {
           TabBar() .environment(\.colorScheme, .dark)
        }
    }
}
