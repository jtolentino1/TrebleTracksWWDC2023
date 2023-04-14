//
//  PageComponents.swift
//  Treble Tracks
//
//  Created by Joshua Tolentino on 2023-04-13.
//

import Foundation
import SwiftUI

struct TrebbleCleffStafWithMeasures: View{
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
                .padding(.trailing, -50)
                .padding(.leading, -60)
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
            .padding(.leading, 30)
        }
    }
}

struct TrebbleCleffStaffWithoutMeasures: View{
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


struct TrebbleCleffStaffWithoutMeasuresWithNotes: View{
    
    @State private var scrollerOffset: CGFloat = 0
    @State private var scrollCounter: CGFloat = 1
    
    @State private var interruptFlag: Bool = false
    @State private var isPlaying: Bool = false
    @State private var bpm = 150
    
    var soundPlayer = SoundPlayer()
    
    func updateScroller() {
        if(scrollCounter == 8){
            scrollerOffset += 116
        } else {
            scrollerOffset += 117
        }
        scrollCounter += 1
    }
    
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
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.15)
                        .frame(width: 20, height: 130)
                        .offset(
                            x: CGFloat(scrollerOffset + 80),
                            y: 20)
                }
            )
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
            .background(
            HStack(alignment: .center){
                Button(
                    action: {
                            
                        if(!isPlaying){
                            
                            // initializers
                            scrollerOffset = 0
                            scrollCounter = 1
                            
                            Timer.scheduledTimer(withTimeInterval: (Double(60000000) / Double(150)) / 1000000, repeats: true) { timer in
                                
                                withAnimation(.easeOut(duration: (Double(60000000) / Double(bpm*8)) / 1000000)){
                                    updateScroller()
                                }
                                
                                if ((scrollCounter == 8) || (interruptFlag == true)){
                                    interruptFlag = true
                                    timer.invalidate()
                                }
                            }
                            
                            DispatchQueue.global(qos: .userInteractive).async {
                                soundPlayer.playMatrix(matrix: MusicData.simpleScale, bpm: bpm)
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
                .padding(.leading, 20)
                .padding(.top, 320)
            
            )
        }
    }
}


struct TrebbleCleffStaffWithoutMeasuresWithBasicNotes: View{
    
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

struct TrebbleCleffStaffWithoutMeasuresWithFullNotes: View{
    
    @State private var scrollerOffset: CGFloat = 0
    @State private var scrollCounter: CGFloat = 1
    
    @State private var interruptFlag: Bool = false
    @State private var isPlaying: Bool = false
    @State private var bpm = 150
    
    var soundPlayer = SoundPlayer()
    
    func updateScroller() {
        if(scrollCounter == 4){
            scrollerOffset += 1
        }
        if(scrollCounter == 10){
            scrollerOffset += 1
        }
        if(scrollCounter == 13){
            scrollerOffset += 1
        }
        scrollerOffset += 56

        scrollCounter += 1
    }
    
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
            HStack(alignment: .center){
                Button(
                    action: {
                            
                        if(!isPlaying){
                            
                            // initializers
                            scrollerOffset = 0
                            scrollCounter = 1
                            
                            Timer.scheduledTimer(withTimeInterval: (Double(60000000) / Double(150)) / 1000000, repeats: true) { timer in
                                
                                withAnimation(.easeOut(duration: (Double(60000000) / Double(bpm*8)) / 1000000)){
                                    withAnimation(.linear(duration: 0.1)){
                                        updateScroller()
                                    }
                                }
                                
                                if ((scrollCounter == 15) || (interruptFlag == true)){
                                    interruptFlag = true
                                    timer.invalidate()
                                }
                            }
                            
                            DispatchQueue.global(qos: .userInteractive).async {
                                soundPlayer.playMatrix(matrix: MusicData.simpleScale, bpm: bpm)
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
                .padding(.leading, 20)
                .padding(.top, 320)
            
            )
            .background(
                GeometryReader { geo in
                    HStack{
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
                                .background(
                                    Text("C")
                                        .position(x:10,y:50)
                                )
                                .position(x:0,y:150)
                            
                            QuarterNote()
                            
                                .background(
                                    Text("D")
                                        .position(x:10,y:61)
                                )
                                .position(x: 0,y:139)
                            
                            QuarterNote()
                                .background(
                                    Text("E")
                                        .position(x:10,y:71)
                                )
                                .position(x: 0,y:129)
                            
                            QuarterNote()
                                .background(
                                    Text("F")
                                        .position(x:10,y:82)
                                )
                                .position(x: 0,y:118)
                            
                            QuarterNote()
                                .background(
                                    Text("G")
                                        .position(x:10,y:92)
                                )
                                .position(x: 0,y:108)
                            
                            QuarterNote()
                                .background(
                                    Text("A")
                                        .position(x:10,y:104)
                                )
                                .position(x: 0,y:96)
                            
                            QuarterNote()
                                .background(
                                    Text("B")
                                        .position(x:10,y:114)
                                )
                                .position(x: 0,y:86)
                            
                            QuarterNote()
                                .background(
                                    Text("C")
                                        .position(x:10,y:126)
                                )
                                .position(x: 0,y:74)
                            
                            QuarterNote()
                                .background(
                                    Text("D")
                                        .position(x:10,y:137)
                                )
                                .position(x: 0,y:63)
                            
                            QuarterNote()
                                .background(
                                    Text("E")
                                        .position(x:10,y:148)
                                )
                                .position(x: 0,y:52)
                            
                        }
                        Group{
                            QuarterNote()
                                .background(
                                    Text("F")
                                        .position(x:10,y:159)
                                )
                                .position(x: 0,y:41)
                            
                            QuarterNote()
                                .background(
                                    Text("G")
                                        .position(x:10,y:170)
                                )
                                .position(x: 0,y:30)
                            
                            QuarterNote()
                                .background(
                                    Text("A")
                                        .position(x:10,y:181)
                                )
                                .background(
                                    Path { path in
                                        path.move(to: CGPoint(x: -10, y: 0))
                                        path.addLine(to: CGPoint(x:30, y: 0))
                                    }
                                        .stroke(Color.black, lineWidth: 1.5)
                                        .frame(height: 2)
                                )
                                .position(x: 0,y:19)
                            
                            QuarterNote()
                                .background(
                                    Text("B")
                                        .position(x:10,y:193)
                                )
                                .background(
                                    Path { path in
                                        path.move(to: CGPoint(x: -10, y: 11))
                                        path.addLine(to: CGPoint(x:30, y: 11))
                                    }
                                        .stroke(Color.black, lineWidth: 1.5)
                                        .frame(height: 2)
                                )
                                .position(x: 0,y:7)
                            
                            QuarterNote()
                                .background(
                                    Text("C")
                                        .position(x:10,y:203)
                                )
                                .background(
                                    Path { path in
                                        path.move(to: CGPoint(x: -10, y: 0))
                                        path.addLine(to: CGPoint(x:30, y: 0))
                                    }
                                        .stroke(Color.black, lineWidth: 1.5)
                                        .frame(height: 2)
                                )
                                .position(x: 0,y:-3)
                        }
                    }
                    .padding(.leading, 100)
                    
                }
            )
            .background(
                GeometryReader { geo in
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.15)
                        .frame(width: 20, height: 190)
                        .offset(
                            x: CGFloat(scrollerOffset + 90),
                            y: -20)
                }
            )
            .frame(height: 280)
        }
    }
}

