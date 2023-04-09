//
//  SoundPlayer.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-08.
//

import AVFoundation

class SoundPlayer {
    var audioPlayer: AVAudioPlayer?

    func playSound(fileName: String) {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "wav") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
