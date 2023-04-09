//
//  StaffView.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-09.
//

import SwiftUI

struct StaffView: View {
    let numMeasures = 32
    let beatsPerMeasure = 4
    let noteSpacing: CGFloat = 10
    
    var body: some View {
        VStack(spacing: noteSpacing) {
            ForEach(0..<5) { line in
                HStack(spacing: noteSpacing) {
                    if line == 0 {
                        Image(systemName: "trebleclef")
                            .resizable()
                            .frame(width: noteSpacing * 3, height: noteSpacing * 6)
                    } else {
                        Spacer()
                    }
                    
                    ForEach(0..<32) { measure in
                        VStack(spacing: noteSpacing) {
                            ForEach(0..<4) { beat in
                                if beat == 0 {
                                    Rectangle()
                                        .frame(width: noteSpacing, height: noteSpacing * 3)
                                } else {
                                    Rectangle()
                                        .frame(width: noteSpacing, height: noteSpacing)
                                }
                            }
                            if measure == numMeasures - 1 {
                                Rectangle()
                                    .frame(width: noteSpacing, height: noteSpacing * 3)
                            }
                        }
                        if measure != numMeasures - 1 {
                            VStack(spacing: noteSpacing) {
                                Rectangle()
                                    .frame(width: 1, height: noteSpacing * 16)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
        }
    }
}
