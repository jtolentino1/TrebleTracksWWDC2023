//
//  ButtonGridView.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-09.
//

import SwiftUI

struct ButtonGridView: View {
    
    // Dimensions of the grid
    let rowCount = 15
    let colCount = 128
    
    // Matrix to store button states, initialized to all 0's
    @State private var buttonStates: [[Int]] = Array(repeating: Array(repeating: 0, count: 128), count: 15)
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack(spacing: 0) {
                ForEach(0..<15) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<128) { col in
                            Button(action: {
                                buttonTapped(row: row, col: col)
                            }) {
                                Image("quarternote")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .opacity(buttonStates[row][col] == 1 ? 1.0 : 0.5)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func buttonTapped(row: Int, col: Int) {
        // Toggle button visibility
        var updatedStates = buttonStates
        if updatedStates[row][col] == 1 {
            updatedStates[row][col] = 0
        } else {
            updatedStates[row][col] = 1
        }
        buttonStates = updatedStates
    }
    
    // Get the current matrix of button states
    func getButtonStates() -> [[Int]] {
        return buttonStates
    }
}
