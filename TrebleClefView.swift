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
            .frame(width: 20, height: 20)
    }
}

struct TrebleClefView: View {
    @State private var scrollViewOffset: CGPoint = .zero

    // in between each notes = 48
    // in between each measure = 66
    @State private var scrollerOffset: CGFloat = 0
    @State private var scrollCounter: CGFloat = 1
    @State private var scrollable: Bool = false
    @State private var scrollViewCounter: CGFloat = 1
    @State private var bpm = 300
    
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
            scrollViewOffset.x += 2
        }
        if (scrollViewCounter.truncatingRemainder(dividingBy: 4) == 0) {
            scrollViewOffset.x += 1
        }

        scrollViewCounter += 1
        withAnimation {
            updateScroller()
        }
        if (scrollViewCounter < 128) {
            DispatchQueue.main.asyncAfter(deadline: .now() + (Double(60000000/bpm) / 1000000)) {
                updateScrollView()
            }
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
                                                .padding(
                                                    .top,
                                                    -42
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
                                                    -42
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
                        withAnimation(Animation.easeInOut(duration: Double(60000000/bpm) / 1000000)) {
                            scrollView.scrollTo(Int(value))
                        }
                    }
                }
                .background(
                    GeometryReader { geo in
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.15)
                            .frame(width: 20, height: 140)
                            .offset(
                                x: CGFloat(scrollerOffset + 175),
                                y: 20)
                    }
                )
            }

            HStack {
                Spacer()
                Button(
                    action: {
                        updateScrollView()
                        DispatchQueue.global(qos: .userInteractive).async {
                            soundPlayer.playMatrix(matrix: MusicData.swingMelody, bpm: 300)
                        }
                    },
                    label: {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.black)
                    }
                )
                .padding(.trailing, 20)
            }
        }
    }
}
