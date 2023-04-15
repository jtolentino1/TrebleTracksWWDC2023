//
//  TrebleCleffStafWithMeasuresAndNote.swift
//  Treble Tracks
//
//  Created by Joshua Tolentino on 2023-04-14.
//

import Foundation
import SwiftUI

struct TrebleCleffStafWithMeasuresAndNote: View{
    var body: some View{
        HStack(spacing: 20) {
            Image("trebleclef")
                .resizable()
                .scaledToFit()
                .foregroundColor(.black)
                .frame(width: 175, height: 175)
                .padding(.horizontal, -50)
                .id("trebleclefanchor")
            Image("44timesignature")
                .resizable()
                .scaledToFit()
                .foregroundColor(.black)
                .frame(width: 120, height: 120)
                .padding(.trailing, -70)
                .padding(.leading, -50)
            ForEach(1...4, id: \.self) { measure in
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(measure)")
                        .font(.caption)
                        .foregroundColor(.black)
                        .padding(.bottom, -20)
                        .padding(.leading, 5)

                    ForEach(0..<5) { _ in
                        Staff()
                    }

                    ZStack{
                    }
                }
            }
            .frame(width: 160, alignment: .leading)
            .overlay(MeasureLine())
            .padding(.leading, 40)
        }
    }
}
