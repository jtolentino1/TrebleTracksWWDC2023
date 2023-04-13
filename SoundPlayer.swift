//
//  SoundPlayer.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-08.
//

import AVFoundation

class SoundPlayer {
    var audioPlayers: [AVAudioPlayer] = []
    var isPlaying: Bool = false
    var interrupted: Bool = false
    
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
    
    func playMatrix(matrix: [[Int]], bpm: Int) {
        let noteNames = ["C", "D", "E", "F", "G", "A", "B"]
        let lowestNoteOctave = 4
        
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback, mode: .default, options: .mixWithOthers)
            try session.setActive(true)
        } catch {
            print("Error setting up audio session: \(error.localizedDescription)")
        }
        
        isPlaying = true
        for columnIndex in 0..<matrix[0].count {
            if interrupted {
                break
            }
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
            DispatchQueue.global().async {
                self.play(sounds: notesToPlay)
            }
            
            // us = 60,000,000 / BPM
            // so this delay right now is 300 BPM (quarter notes)
            usleep(useconds_t(60000000/bpm))
        }
        isPlaying = false

    }
    
    func stop() {
        
        interrupted = true
        
        for player in audioPlayers {
            player.stop()
        }
        
        audioPlayers.removeAll()
        
        while(isPlaying){
            print("SoundPlayer for isPlaying flag to be set to false before disabling interrupt...")
        }
        interrupted = false
    }
}
