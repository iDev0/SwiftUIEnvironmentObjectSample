//
//  ContentView.swift
//  EnvironmentObjectSample
//
//  Created by MakeItSimple on 2020/02/23.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import SwiftUI

class GameSettings: ObservableObject {
    @Published var score: Int = 0
}


struct ContentView: View {
    
    @EnvironmentObject var settings: GameSettings
    
    var body: some View {
        
        NavigationView {
            VStack {
                Stepper(value: $settings.score, in: 1...100000, step: 1000, label: {
                    Text("현재 스코어: \(settings.score)")
                }).padding()
                
                NavigationLink(destination: ScoreView()) {
                    Text("보여줘 너의 스코어")
                }
            }
        }
    }
}

struct ScoreView: View {
    @EnvironmentObject var settings: GameSettings
    
    var body: some View {
        Text("너의 스코어 : \(settings.score)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GameSettings())
    }
}
