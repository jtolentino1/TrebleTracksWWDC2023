//
//  TrebleCleffStaffWithoutMeasuresWithBasicNotes.swift
//  Treble Tracks
//
//  Created by Joshua Tolentino on 2023-04-14.
//

import Foundation
import SwiftUI

struct TrebleCleffStaffWithoutMeasuresWithBasicNotes: View{
    
    var soundPlayer = SoundPlayer()
    
    var body: some View{
        
        ZStack{
            HStack(spacing: 20) {
                Image("trebleclef")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .frame(width: 175, height: 175)
                    .padding(.leading, -80)
                    .id("trebleclefanchor")
                
                ForEach(1...4, id: \.self) { measure in
                    VStack(alignment: .leading, spacing: 20) {
                        
                        ForEach(0..<5) { _ in
                            Staff()
                        }
                        
                        // this is here for pure formatting
                        ZStack{
                        }
                        
                    }
                }
                .frame(width: 160, alignment: .leading)
                .padding(.top, 18)
                .padding(.leading, 30)
            }
            .background(
                GeometryReader { geo in
                    HStack(spacing: 90){
                        ForEach(0..<8) { index in
                            let noteName = ["E", "F", "G", "A", "B", "C", "D", "E"][index]
                            QuarterNote()
                                .position(y: CGFloat(130 - 11 * index))
                                .background(
                                    Text(noteName)
                                        .position(y:180)
                                )
                        }
                    }
                    .padding(.leading, 90)
                }
            )
        }
    }
}
