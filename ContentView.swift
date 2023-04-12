//
//  ContentView.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-08.
//

import SwiftUI

struct ContentView: View {
    var soundPlayer = SoundPlayer()
    
    var body: some View {
        
        TabView {
            
            Text("hello world")
                .tabItem {
                    Label("Learn", systemImage: "books.vertical")
                }
            
            VStack{
                Button(action: {
                    DispatchQueue.global().async {
                        soundPlayer.play(sounds: ["C4"])
                    }
                }) {
                    Text("Play C4")
                        .foregroundColor(.black)
                }
                
                TrebleClefView()
            }
                .tabItem {
                    Label("Create", systemImage: "pianokeys")
                }
        }
        .foregroundColor(.black)
        .accentColor(.black)

//        ButtonGridView()
    }
}
