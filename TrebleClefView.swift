//
//  TrebleClefView.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-09.
//

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

struct TrebleClefView: View {
    @State private var scrollViewOffset: CGPoint = .zero
    // in between each notes = 48
    // in between each measure = 66
    @State private var scrollerOffset: CGFloat = 0
    @State private var scrollCounter: CGFloat = 1
    @State private var scrollable: Bool = true
    @State private var scrollViewCounter: CGFloat = 1
    @State private var stoppedFlag: Bool = false
    @State private var bpm = 300
    @State private var isPlaying: Bool = false
    
    // debugging
    var soundPlayer = SoundPlayer()
        
    func updateScroller() {
        if(scrollCounter.truncatingRemainder(dividingBy: 4) == 0){
            scrollerOffset += 66
        } else {
            scrollerOffset += 48
        }
        scrollCounter += 1
    }
    
    func updateScrollView() {
        if (scrollViewCounter == 1) {
            scrollViewOffset.x += 1
        }

        if (scrollViewCounter.truncatingRemainder(dividingBy: 8) == 0) {
            scrollViewOffset.x += 2
        }

        scrollViewCounter += 1
        
        withAnimation(.easeOut(duration: (Double(60000000) / Double(bpm*8)) / 1000000)){
            updateScroller()
        }
    }


    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                ScrollViewReader { scrollView in
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
                                            // 11 between notes
                                            // C6 = -163
                                            // ...
                                            // F4 = -42
                                            // E4 = -31
                                            // D4 = -20
                                            // C4 = -9
                                            
                                            // beat 1
                                            QuarterNote()
                                                .padding(
                                                    .top,
                                                    -20
                                                )
                                                .padding(
                                                    .leading,
                                                    20
                                                )
                                            Spacer()

                                            // beat 2
                                            QuarterNote()
                                                .padding(
                                                    .top,
                                                    -20
                                                )
                                                .padding(
                                                    .leading,
                                                    20
                                                )
                                            Spacer()

                                            // beat 3
                                            QuarterNote()
                                                .padding(
                                                    .top,
                                                    -42
                                                )
                                                .padding(
                                                    .leading,
                                                    20
                                                )
                                            Spacer()

                                            // beat 4
                                            QuarterNote()
                                                .padding(
                                                    .top,
                                                    -42
                                                )
                                                .padding(
                                                    .leading,
                                                    20
                                                )
                                        }

                                    }
                                }
                            }
                        }
                        .frame(width: 160, alignment: .leading)
                        .overlay(MeasureLine())
                        .padding(.leading, 30)
                    }
                    .padding(.leading, 0)
                    .onAppear {
                        scrollView.scrollTo(0, anchor: .leading)
                    }
                    .onChange(of: scrollViewOffset.x) { value in
                        withAnimation{
                            if(value == .zero){
                                print("scrolling to original")
                                scrollView.scrollTo("trebleclefanchor", anchor: .leading)
                            } else {
                                scrollView.scrollTo(Int(value))
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.15)
                            .frame(width: 20, height: 200)
                            .offset(
                                x: CGFloat(scrollerOffset + 175),
                                y: 20)
                    }
                )
            }
            
            .disabled(isPlaying)

            HStack {
                Spacer()
                Button(
                    action: {
                        
                        scrollViewOffset.x = 0
                        
                        // initializers
                        scrollerOffset = 0
                        scrollCounter = 1
                        scrollViewCounter = 1
                        stoppedFlag = false
                        isPlaying = true
                        
                        Timer.scheduledTimer(withTimeInterval: (Double(60000000) / Double(bpm)) / 1000000, repeats: true) { timer in
                            
                            updateScrollView()
                            // Stop the timer after it has been called 128 times or stoppedFlag is true
                            if ((scrollCounter == 128) || (stoppedFlag == true)){
                                timer.invalidate()
                            }
                        }
                        
//                        DispatchQueue.global(qos: .userInteractive).async {
//                            soundPlayer.playMatrix(matrix: MusicData.swingMelody, bpm: bpm)
//                        }
                    },
                    label: {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.black)
                    }
                )
                .disabled(isPlaying)
                Button(
                    action: {
                        stoppedFlag = true
                        soundPlayer.stop()
                        isPlaying =
                    },
                    label: {
                        Image(systemName: "stop")
                            .foregroundColor(.black)
                    })
                Button(
                    action: {
                        scrollViewOffset.x = 0
                        scrollerOffset = 0
                        scrollCounter = 1
                    },
                    label: {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.black)
                    })
                .padding(.trailing, 20)
            }
        }
        .frame(height: 280)
    }
}
