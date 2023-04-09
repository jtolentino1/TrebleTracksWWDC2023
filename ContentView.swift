//
//  ContentView.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-08.
//

import SwiftUI

struct ContentView: View {
    let soundPlayerC = SoundPlayer()
    let soundPlayerE = SoundPlayer()
    let soundPlayerG = SoundPlayer()
    let soundPlayerB = SoundPlayer()

    var body: some View {
        Button(action: {
            soundPlayerC.playSound(fileName: "C4")
            soundPlayerE.playSound(fileName: "E4")
            soundPlayerG
                .playSound(fileName: "G4")
            soundPlayerB
                .playSound(fileName: "B4")
        }) {
            Text("Play")
        }
    }
}
