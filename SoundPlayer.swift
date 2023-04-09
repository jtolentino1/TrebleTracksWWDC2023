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
            guard let soundURL = Bundle.main.url(forResource: sound, withExtension: "wav") else {
                print("Sound file not found")
                return
            }
            
            do {
                let audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer.play()
                audioPlayers.append(audioPlayer)
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
    
    func playMatrix(matrix: [[Int]]) {
        let noteNames = ["C", "D", "E", "F", "G", "A", "B"]
        let lowestNoteOctave = 4
        let highestNoteOctave = 6
        
        for columnIndex in 0..<matrix[0].count {
            var notesToPlay: [String] = []
            for rowIndex in 0..<matrix.count {
                if matrix[rowIndex][columnIndex] == 1 {
                    let noteIndex = (matrix.count - 1) - rowIndex // reverse the index to start from C4
                    let octave = lowestNoteOctave + noteIndex / noteNames.count
                    let noteName = noteNames[noteIndex % noteNames.count]
                    let note = "\(noteName)\(octave)"
                    notesToPlay.append(note)
                }
            }
            play(sounds: notesToPlay)
            
            // us = 60,000,000 / BPM
            // so this delay right now is 300 BPM (quarter notes)
            usleep(useconds_t(200000))
        }
    }
}
