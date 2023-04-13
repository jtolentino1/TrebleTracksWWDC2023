//
//  SheetMusicComponents.swift
//  Treble Tracks
//
//  Created by Joshua Tolentino on 2023-04-13.
//

import Foundation

import SwiftUI
import Foundation

struct Staff: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: -280, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
        }
        .stroke(Color.black, lineWidth: 1)
        .frame(height: 2)
    }
}

struct MeasureLine: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: -44))
            path.addLine(to: CGPoint(x: 0, y: 44))
        }
        .stroke(Color.black, lineWidth: 1)
        .frame(height: 2)
    }
}

struct QuarterNote: View {
    var body: some View {
        Image("quarternote")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
    }
}
