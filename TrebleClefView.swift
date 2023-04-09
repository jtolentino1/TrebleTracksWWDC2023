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

struct QuarterNote: View {
    var body: some View {
        Image("quarternote")
            .resizable()
            .scaledToFit()
            .frame(width:20, height: 20)
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
                ForEach(1...33, id: \.self) { measure in
                    VStack(alignment: .leading, spacing: 20) {
                        Text("\(measure)")
                            .font(.caption)
                            .foregroundColor(.black)
                            .padding(.bottom, -20)
                            .padding(.leading, 5)

                        ForEach(0..<5) { _ in
                            Staff()
                        }

                        ZStack {
                            VStack {
                                HStack {
                                    // beat 1
                                    QuarterNote()
                                        .padding(.top, -42)
                                        .padding(.leading, 20)
                                    Spacer()
                                    
                                    // beat 2
                                    QuarterNote()
                                        .padding(.top, -42)
                                        .padding(.leading, 20)
                                    Spacer()
                                    
                                    // beat 3
                                    QuarterNote()
                                        .padding(.top, -42)
                                        .padding(.leading, 20)
                                    Spacer()
                                    
                                    // beat 4
                                    QuarterNote()
                                        .padding(.top, -42)
                                        .padding(.leading, 20)
                                    }
                                
                                
                                }
                            }
                        }
                    }
                    .frame(width: 160, alignment: .leading)
                    .overlay(MeasureLine())
                    .padding(.leading, 30)
                }
            }
        }
    }

