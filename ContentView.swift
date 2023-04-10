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
        Button(action: {

            // Call play function in SoundPlayer with name of .wav file(s)
            // soundPlayer.play(sounds: ["C4", "E4", "G4", "B4"])
            if(soundPlayer.isPlaying == false){
                DispatchQueue.global().async {
                    soundPlayer.playMatrix(matrix: MusicData.swingMelody, bpm: 300)
                }
            } else {
                print("sound player is already playing..")
            }
            
//            soundPlayer.playMatrix(matrix: MusicData.swingMelody, bpm: 300)
//            soundPlayer.playMatrix(matrix: MusicData.chordTest, bpm: 130)
        }) {
            Text("Play")
        }
        
//        ButtonGridView()
        TrebleClefView()
    }
}
