//
//  TrebleClefView.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-09.
//

import SwiftUI

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

struct TrebleClefView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                Image("trebleclef")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .frame(width: 175, height: 175)
                    .padding(.horizontal, -50)
                Image("44timesignature")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .frame(width: 120, height: 120)
                    .padding(.trailing, -50)
                    .padding(.leading, -60)
                ForEach(0..<32) { _ in
                    VStack(spacing: 20) {
                        ForEach(0..<5) { _ in
                            Staff()
                        }
                    }
                    MeasureLine()
                    .padding(.trailing, 120)
                }
            }
        }
    }
}
