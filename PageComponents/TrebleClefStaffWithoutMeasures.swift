//
//  TrebleClefStaffWithoutMeasures.swift
//  Treble Tracks
//
//  Created by Joshua Tolentino on 2023-04-14.
//

import Foundation
import SwiftUI

struct TrebleCleffStaffWithoutMeasures: View{
    var body: some View{
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
    }
}
