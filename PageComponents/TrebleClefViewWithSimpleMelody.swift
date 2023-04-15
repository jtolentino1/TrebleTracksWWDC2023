//
//  TrebleClefViewWithSimpleMelody.swift
//  Treble Tracks
//
//  Created by Joshua Tolentino on 2023-04-13.
//

import Foundation
import SwiftUI

struct TrebleClefViewWithSimpleMelody: View {
    
    @State private var scrollViewOffset: CGPoint = .zero
    @State private var scrollViewCounter: CGFloat = 1

    // in between each notes = 48
    // in between each measure = 66
    @State private var scrollerOffset: CGFloat = 0
    @State private var scrollCounter: CGFloat = 1
    
    @State private var interruptFlag: Bool = false
    @State private var isPlaying: Bool = false
    @State private var bpm = 300
    
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
            scrollViewOffset.x += 5
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
                        ForEach(1...16, id: \.self) { measure in
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
                
                .background(
                    GeometryReader { geo in
                        //                        HStack{
                        Group{
                        QuarterNote()
                            .background(
                                Path { path in
                                    path.move(to: CGPoint(x: -10, y: 0))
                                    path.addLine(to: CGPoint(x:30, y: 0))
                                }
                                    .stroke(Color.black, lineWidth: 1.5)
                                    .frame(height: 2)
                            )
                            .position(x: 185, y: 185)
                        
                        QuarterNote()
                            .background(
                                Path { path in
                                    path.move(to: CGPoint(x: -10, y: 0))
                                    path.addLine(to: CGPoint(x:30, y: 0))
                                }
                                    .stroke(Color.black, lineWidth: 1.5)
                                    .frame(height: 2)
                            )
                            .position(x: 233, y: 185)
                        
                        QuarterNote()
                            .position(x: 281, y: 164)
                        
                        QuarterNote()
                            .position(x: 329, y: 164)
                        
                        
                        QuarterNote()
                            .position(x: 395, y: 142)
                        
                        
                        QuarterNote()
                            .position(x: 443, y: 142)
                        
                        QuarterNote()
                            .position(x: 491, y: 131)
                        
                        QuarterNote()
                            .position(x: 539, y: 142)
                    }
                        Group{
                        QuarterNote()
                            .background(
                                Path { path in
                                    path.move(to: CGPoint(x: -10, y: 0))
                                    path.addLine(to: CGPoint(x:30, y: 0))
                                }
                                    .stroke(Color.black, lineWidth: 1.5)
                                    .frame(height: 2)
                            )
                            .position(x: 185, y: 185)
                        
                        QuarterNote()
                            .background(
                                Path { path in
                                    path.move(to: CGPoint(x: -10, y: 0))
                                    path.addLine(to: CGPoint(x:30, y: 0))
                                }
                                    .stroke(Color.black, lineWidth: 1.5)
                                    .frame(height: 2)
                            )
                            .position(x: 233, y: 185)
                        
                        QuarterNote()
                            .position(x: 281, y: 164)
                        
                        QuarterNote()
                            .position(x: 329, y: 164)
                        
                        
                        QuarterNote()
                            .position(x: 395, y: 142)
                        
                        
                        QuarterNote()
                            .position(x: 443, y: 142)
                        
                        QuarterNote()
                            .position(x: 491, y: 131)
                        
                        QuarterNote()
                            .position(x: 539, y: 142)
                    }                       .padding(.leading, 420)

                        
                        Group{
                        QuarterNote()
                            .position(x: 185, y: 186)
                        
                        QuarterNote()
                            .position(x: 233, y: 186)
                        
                        QuarterNote()
                            .position(x: 281, y: 164)
                        
                        QuarterNote()
                            .position(x: 329, y: 164)
                        
                        
                        QuarterNote()
                            .position(x: 395, y: 142)
                        
                        
                        QuarterNote()
                            .position(x: 443, y: 142)
                        
                        QuarterNote()
                            .position(x: 491, y: 131)
                        
                        QuarterNote()
                            .position(x: 539, y: 142)
                    }
                        .padding(.leading, 840)
                        .padding(.top, -33)
                        
                        Group{
                        QuarterNote()
                            .position(x: 185, y: 186)
                        
                        QuarterNote()
                            .position(x: 233, y: 186)
                        
                        QuarterNote()
                            .position(x: 281, y: 164)
                        
                        QuarterNote()
                            .position(x: 329, y: 164)
                        
                        
                        QuarterNote()
                            .position(x: 395, y: 142)
                        
                        
                        QuarterNote()
                            .position(x: 443, y: 142)
                        
                        QuarterNote()
                            .position(x: 491, y: 131)
                        
                        QuarterNote()
                            .position(x: 539, y: 142)
                    }
                        .padding(.leading, 1260)
                        .padding(.top, -32)
                        
                        Group{
                        QuarterNote()
                            .position(x: 185, y: 186)
                        
                        QuarterNote()
                            .position(x: 233, y: 186)
                        
                        QuarterNote()
                            .position(x: 281, y: 164)
                        
                        QuarterNote()
                            .position(x: 329, y: 164)
                        
                        
                        QuarterNote()
                            .position(x: 395, y: 142)
                        
                        
                        QuarterNote()
                            .position(x: 443, y: 142)
                        
                        QuarterNote()
                            .position(x: 491, y: 131)
                        
                        QuarterNote()
                            .position(x: 539, y: 142)
                    }
                        .padding(.leading, 1680)
                        .padding(.top, -44)
                        
                        Group{
                        QuarterNote()
                            .position(x: 185, y: 186)
                        
                        QuarterNote()
                            .position(x: 233, y: 186)
                        
                        QuarterNote()
                            .position(x: 281, y: 164)
                        
                        QuarterNote()
                            .position(x: 329, y: 164)
                        
                        
                        QuarterNote()
                            .position(x: 395, y: 142)
                        
                        
                        QuarterNote()
                            .position(x: 443, y: 142)
                        
                        QuarterNote()
                            .position(x: 491, y: 131)
                        
                        QuarterNote()
                            .position(x: 539, y: 142)
                    }
                        .padding(.leading, 2100)
                        .padding(.top, -32)
                        Group{
                        QuarterNote()
                            .background(
                                Path { path in
                                    path.move(to: CGPoint(x: -10, y: 0))
                                    path.addLine(to: CGPoint(x:30, y: 0))
                                }
                                    .stroke(Color.black, lineWidth: 1.5)
                                    .frame(height: 2)
                            )
                            .position(x: 185, y: 185)
                        
                        QuarterNote()
                            .background(
                                Path { path in
                                    path.move(to: CGPoint(x: -10, y: 0))
                                    path.addLine(to: CGPoint(x:30, y: 0))
                                }
                                    .stroke(Color.black, lineWidth: 1.5)
                                    .frame(height: 2)
                            )
                            .position(x: 233, y: 185)
                        
                        QuarterNote()
                            .position(x: 281, y: 164)
                        
                        QuarterNote()
                            .position(x: 329, y: 164)
                        
                        
                        QuarterNote()
                            .position(x: 395, y: 142)
                        
                        
                        QuarterNote()
                            .position(x: 443, y: 142)
                        
                        QuarterNote()
                            .position(x: 491, y: 131)
                        
                        QuarterNote()
                            .position(x: 539, y: 142)
                    }                       .padding(.leading, 2520)
                        
                    Group{
                        QuarterNote()
                            .background(
                                Path { path in
                                    path.move(to: CGPoint(x: -10, y: 0))
                                    path.addLine(to: CGPoint(x:30, y: 0))
                                }
                                    .stroke(Color.black, lineWidth: 1.5)
                                    .frame(height: 2)
                            )
                            .position(x: 185, y: 185)
                    }                          .padding(.leading, 2940)

//                        }
//                        .padding(.leading, 185)
                    }
                )
            }
            
            .disabled(true)
            
            HStack(alignment: .center){

                Button(
                    action: {
                        if(!isPlaying){
                            scrollViewOffset.x = 0
                            interruptFlag = false

                            // initializers
                            scrollerOffset = 0
                            scrollCounter = 1
                            scrollViewCounter = 1
                            
                            Timer.scheduledTimer(withTimeInterval: (Double(60000000) / Double(bpm)) / 1000000, repeats: true) { timer in
                                
                                updateScrollView()
                                // Stop the timer after it has been called 128 times or interruptFlag is true
                                if ((scrollCounter == 57) || (interruptFlag == true)){
                                    interruptFlag = true
                                    timer.invalidate()
                                }
                            }
                            
                            DispatchQueue.global(qos: .userInteractive).async {
                                soundPlayer.playMatrix(matrix: MusicData.swingMelody, bpm: bpm)
                            }
                        }
                        
                        if(isPlaying){
                            interruptFlag = true
                            soundPlayer.stop()
                        }
                        
                        isPlaying.toggle()
                    },
                    label: {
                            Image(systemName: !isPlaying ? "play.circle.fill" : "pause.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                                .opacity(interruptFlag ? 0.25 : 1)
                    }
                )
                .disabled(interruptFlag)

                Button(
                    action: {
                        isPlaying = false
                        interruptFlag = false
                        scrollViewOffset.x = 0
                        scrollerOffset = 0
                        scrollCounter = 1
                    },
                    label: {
                        Image(systemName: "backward.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .opacity(!interruptFlag ? 0.25 : 1)
                    })
                .disabled(!interruptFlag)
                .padding(.trailing, 20)
            }
        }
        .frame(height: 280)
    }
}
