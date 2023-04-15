//
//  ContentView.swift
//  Treble Tracks
//
//  Created by Joshua Tolentino on 2023-04-15.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var bpm: Int = 150
    
    var body: some View {
        HStack {
            Text("BPM: ")
            
            TextField("BPM", value: $bpm, formatter: NumberFormatter(), onEditingChanged: { (isEditing) in
                // No need for validation here
            })
            .keyboardType(.numberPad)
        }
        .padding(.leading, 10)
        .onChange(of: bpm) { newValue in
            bpm = min(max(newValue, 100), 400)
        }
    }
}
