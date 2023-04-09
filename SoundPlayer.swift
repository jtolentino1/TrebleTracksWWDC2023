//
//  SoundPlayer.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-08.
//

import AVFoundation

class SoundPlayer {
    var audioPlayers: [AVAudioPlayer] = []
    
    func play(sounds: [String]) {
        for sound in sounds {
            // Load sound file
            guard let soundURL = Bundle.main.url(forResource: sound, withExtension: "wav") else {
                print("Sound file not found")
                return
            }
            
            do {
                // Create audio player and play sound
                let audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer.play()
                
                // Add audio player to array
                audioPlayers.append(audioPlayer)
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
}
