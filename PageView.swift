//
//  PageView.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-10.
//

import SwiftUI

struct PageView: View {
    // Track the current page using a state variable
    @State private var currentPage = 1
    
    var body: some View {
        NavigationView {
            VStack {
                // Show different views based on the current page
                if currentPage == 1 {
                    Text("Page 1")
                } else if currentPage == 2 {
                    // Page2()
                    Text("Page 1")
                } else if currentPage == 3 {
                    Text("Page 3")
                }
                // Add navigation buttons to switch between pages
                HStack {
                    Button(action: {
                        if self.currentPage > 1 {
                            self.currentPage -= 1
                        }
                    }) {
                        Text("Back")
                    }
                    Spacer()
                    Button(action: {
                        if self.currentPage < 3 {
                            self.currentPage += 1
                        }
                    }) {
                        Text("Next")
                    }
                }
                .padding()
            }
            .navigationTitle("Page \(currentPage)")
        }
    }
}
