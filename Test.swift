//
//  Test.swift
//  Firebase App (iOS)
//
//  Created by Ankush  Anand on 12/Jun/2021.
//

import SwiftUI

class GameSettings: ObservableObject {
    @Published var score = 0
}

// A view that expects to find a GameSettings object
// in the environment, and shows its score.
struct ScoreView: View {
    @EnvironmentObject var settings: GameSettings

    var body: some View {
        Text("Score: \(settings.score)")
    }
}

// A view that creates the GameSettings object,
// and places it into the environment for the
// navigation view.
struct Test: View {
    @StateObject var settings = GameSettings()
@State var profileText="This is editable Text."
    var body: some View {
        NavigationView {
            VStack {
                // A button that writes to the environment settings
                Button(action: {
                    settings.score += 1
                }){
                    VStack{
                        Text("Score")
                        Text("\(settings.score)")
                    }
                }

                NavigationLink(destination: ScoreView()) {
                    Text("Show Detail View")
                }
                ScrollView {
                    TextEditor(text: $profileText)
                               .foregroundColor(.secondary)
                        .frame(width: screen.width, height: screen.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.leading)


                }.frame(width: screen.width, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(y:100)


            }.offset(y:100)
            .frame(height: 200)
        }.environmentObject(settings)

    }
}
struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
