//
//  PageView.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-10.
//

import SwiftUI

struct PageView: View {
    // Track the current page using a state variable
    @State private var currentPage = 7
    @Namespace var namespace
    var soundPlayer = SoundPlayer()
    
    var body: some View {
            VStack {
                
                // ============ INTRO PAGE ============= //
                
                if currentPage == 1 {
                    VStack(spacing: 5){
                        Text("Treble Tracks 🎼")
                            .fontWeight(.bold)
                            .font(.system(size: 36))
                        
                        Text("WWDC 2023 Student Challenge Submission")
                        
                        Text("By: Joshua Tolentino")
                    }
                    .padding(.vertical, 20)

                    
                        VStack(alignment: .leading, spacing: 15){
                            Text("Have you ever wished you could play a beautiful melody 🎶 on an instrument 🎸 or create your own music?")
                            Text("Learning to read sheet music unlocks a whole new world of musical possibilities! It's like a secret code that tells you which notes to play, how long to hold them, and even how loud or soft to play them.")
                            Text("Once you master this language, you can play any song you want and even create your own music. It's like having a superpower that lets you express yourself through music.")
                        }
                        .frame(width: 500)
                        .matchedGeometryEffect(id: "topTextP1", in: namespace)
                        .matchedGeometryEffect(id: "musicalStaffP1", in: namespace)
                        
                        Text("Ready to get started?")
                            .padding(.vertical, 20)
                            .frame(width: 500)
                            .matchedGeometryEffect(id: "bottomTextP1", in: namespace)
                    
                        
                        Button("Get Started") {
                            withAnimation(.easeInOut(duration: 0.1)){
                                self.currentPage = 2
                            }
                            
                            DispatchQueue.global(qos: .userInteractive).async {
                                soundPlayer.play(sounds:["C4"])
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.black)
                        .matchedGeometryEffect(id: "navButton", in: namespace)
                        .matchedGeometryEffect(id: "prev", in: namespace)
                        .matchedGeometryEffect(id: "next", in: namespace)

                        
                // ============ PAGE 1 ============= //
                    
                } else if currentPage == 2 {
                    VStack(alignment: .leading, spacing: 15){
                            Text("Let's start with the basics. The foundation of sheet music is a set of lines and spaces called a **musical staff**. It's made up of five lines and four spaces.")
                            .matchedGeometryEffect(id: "topTextP21", in: namespace)
                            
                            Text("To help us know which notes to play on the staff, we use a symbol called a **treble clef** as seen on the left side. The treble clef tells us which notes each line and space represent.")
                            .matchedGeometryEffect(id: "topTextP22", in: namespace)
                            
                        }
                        .frame(width: 500)
                        .matchedGeometryEffect(id: "topTextP1", in: namespace)
                        
                    TrebleCleffStaffWithoutMeasures()
                        .matchedGeometryEffect(id: "musicalStaffP1", in: namespace)
                        .matchedGeometryEffect(id: "musicStaffP2", in: namespace)
                    
                    
                    VStack(alignment: .leading, spacing: 15){
                        Text("Each space and line above symbolizes a musical note 🎵.")
                            .matchedGeometryEffect(id: "bottomTextP1", in: namespace)

                        Text("These notes are represented by the letters A, B, C, D, E, F, and G. Each line and space on the staff corresponds to a specific note.")
                    }
                    .frame(width: 500)
                    
                    HStack(alignment: .center, spacing: 100){
                        Button(
                            action: {
                                DispatchQueue.global(qos: .userInteractive).async {
                                    soundPlayer.play(sounds:["C4"])
                                }
                                withAnimation(.easeInOut(duration: 0.1)){
                                    self.currentPage = 1
                                }
                            },
                            label:{
                                Image(systemName: "arrowshape.left.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                            })
                        .matchedGeometryEffect(id: "prev", in: namespace)
                        
                        Text("\(currentPage-1)")

                        Button(
                            action: {
                                DispatchQueue.global(qos: .userInteractive).async {
                                    soundPlayer.play(sounds:["D4"])
                                }
                                withAnimation(.easeInOut(duration: 0.1)){
                                    self.currentPage = 3
                                }
                            },
                            label:{
                                Image(systemName: "arrowshape.right.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                            })
                        .matchedGeometryEffect(id: "next", in: namespace)

                        }
                    .padding(.top, 30)
                    .matchedGeometryEffect(id: "navButton", in: namespace)
                    

                // ============ PAGE 2 ============= //
                    
                } else if currentPage == 3 {
                    
                        VStack(alignment: .leading, spacing: 15){
                            Text("Let's take a look at some actual musical notes! I've placed some **quarter notes** on the staff for you and labeled them to make things clearer.")
                                .matchedGeometryEffect(id: "topTextP21", in: namespace)
                                .matchedGeometryEffect(id: "topTextP31", in: namespace)
                            
                            Text("As you can see, the notes are either on a line or a space on the staff. These particular notes are all quarter notes, you will learn what this means later.")
                                .matchedGeometryEffect(id: "topTextP22", in: namespace)
                                .matchedGeometryEffect(id: "topTextP32", in: namespace)
                            
                            
                        }
                        .frame(width: 500)

                        TrebleCleffStaffWithoutMeasuresWithBasicNotes()
                            .matchedGeometryEffect(id: "musicStaffP2", in: namespace)
                            .matchedGeometryEffect(id: "musicStaffP3", in: namespace)

                        Text("However, as stated before, we are in the **treble clef**, these are not all the notes present in this musical staff!")
                            .padding(.top, 70)
                            .padding(.bottom, 10)
                            .frame(width: 500)
                            .matchedGeometryEffect(id: "bottomTextP1", in: namespace)
                            .matchedGeometryEffect(id: "bottomTextP2", in: namespace)

                    HStack(alignment: .center, spacing: 100){
                        Button(
                            action: {
                                DispatchQueue.global(qos: .userInteractive).async {
                                    soundPlayer.play(sounds:["D4"])
                                }
                                withAnimation(.easeInOut(duration: 0.1)){
                                    self.currentPage = 2
                                }
                            },
                            label:{
                                Image(systemName: "arrowshape.left.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                            })
                        
                        Text("\(currentPage-1)")

                        Button(
                            action: {
                                DispatchQueue.global(qos: .userInteractive).async {
                                    soundPlayer.play(sounds:["E4"])
                                }
                                withAnimation(.easeInOut(duration: 0.1)){
                                    self.currentPage = 4
                                }
                            },
                            label:{
                                Image(systemName: "arrowshape.right.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                            })


                        }
                    .padding(.top, 30)
                    .matchedGeometryEffect(id: "navButton", in: namespace)
                    
                // ============ PAGE 3 ============= //
                } else if currentPage == 4 {
                    VStack(alignment: .leading, spacing: 15){
                        Text("Now, let's take a look at the full range of notes in the treble clef. As you can see, there are many more notes beyond the ones we previously looked at.")
                            .matchedGeometryEffect(id: "topTextP31", in: namespace)
                            .matchedGeometryEffect(id: "topTextP41", in: namespace)
                        
                        
                        Text("Some of these notes are located outside of the staff, such as the leftmost C and D notes, as well as the final G, A, B, and C notes. To notate these notes, we use additional lines called **ledger lines** to extend the staff. By using ledger lines, musicians can easily identify notes outside the staff.")
                            .matchedGeometryEffect(id: "topTextP32", in: namespace)
                            .matchedGeometryEffect(id: "topTextP42", in: namespace)
                        
                        
                    }
                    .frame(width: 500)
                    
                    TrebleCleffStaffWithoutMeasuresWithFullNotes()
                        .matchedGeometryEffect(id: "musicStaffP3", in: namespace)
                        .matchedGeometryEffect(id: "musicStaffP4", in: namespace)
                    
                    Text("Feel free to press the play button above the hear the notes! 🎶")
                        .frame(width: 500)
                        .padding(.bottom, 10)
                        .padding(.top, 70)
                        .matchedGeometryEffect(id: "bottomTextP2", in: namespace)
                        .matchedGeometryEffect(id: "bottomTextP3", in: namespace)

                HStack(alignment: .center, spacing: 100){
                    Button(
                        action: {
                            DispatchQueue.global(qos: .userInteractive).async {
                                soundPlayer.play(sounds:["E4"])
                            }
                            withAnimation(.easeInOut(duration: 0.1)){
                                self.currentPage = 3
                            }
                        },
                        label:{
                            Image(systemName: "arrowshape.left.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                        })
                    
                    Text("\(currentPage-1)")

                    Button(
                        action: {
                            DispatchQueue.global(qos: .userInteractive).async {
                                soundPlayer.play(sounds:["F4"])
                            }
                            withAnimation(.easeInOut(duration: 0.1)){
                                self.currentPage = 5
                            }
                        },
                        label:{
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                        })


                    }
                .padding(.top, 30)
                .matchedGeometryEffect(id: "navButton", in: namespace)
                    
                // ============ PAGE 4 ============= //
                } else if currentPage == 5 {
                    VStack(alignment: .leading, spacing: 15){
                        Text("You may have noticed that some notes on the staff have the same letter but sound different when played. To avoid confusion, musicians use a system of numbering to distinguish each note.")
                            .matchedGeometryEffect(id: "topTextP41", in: namespace)
                            .matchedGeometryEffect(id: "topTextP51", in: namespace)
                        
                        Text("For example, the leftmost C note in the treble clef is known as **middle C** or **C4**. The following notes are labeled with a 4 (D4, E4, F4, etc.) until the next C is reached, at which point the number is incremented to 5 (C5, D5, E5, and so on).")
                            .matchedGeometryEffect(id: "topTextP42", in: namespace)
                            .matchedGeometryEffect(id: "topTextP52", in: namespace)
                        
                        
                    }
                    .frame(width: 500)

                    TrebleCleffStaffWithoutMeasuresWithFullNotesNoPlay()
                        .matchedGeometryEffect(id: "musicStaffP4", in: namespace)
                        .matchedGeometryEffect(id: "musicStaffP5", in: namespace)
                    
                    Text("By labeling each note with a specific number, musicians can easily identify and play the correct note, no matter its position on the staff.")
                        .padding(.bottom, 10)
                        .frame(width: 500)
                        .matchedGeometryEffect(id: "bottomTextP3", in: namespace)
                        .matchedGeometryEffect(id: "bottomTextP4", in: namespace)
                    
                HStack(alignment: .center, spacing: 100){
                    Button(
                        action: {
                            DispatchQueue.global(qos: .userInteractive).async {
                                soundPlayer.play(sounds:["F4"])
                            }
                            withAnimation(.easeInOut(duration: 0.1)){
                                self.currentPage = 4
                            }
                        },
                        label:{
                            Image(systemName: "arrowshape.left.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                        })
                    
                    Text("\(currentPage-1)")

                    Button(
                        action: {
                            DispatchQueue.global(qos: .userInteractive).async {
                                soundPlayer.play(sounds:["G4"])
                            }
                            withAnimation(.easeInOut(duration: 0.1)){
                                self.currentPage = 6
                            }
                        },
                        label:{
                            Image(systemName: "arrowshape.right.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                        })


                    }
                .padding(.top, 30)
                .matchedGeometryEffect(id: "navButton", in: namespace)

                
                // ============ PAGE 5 ============= //
                } else if currentPage == 6 {
                    VStack(alignment: .leading, spacing: 15){
                        Text("You may be wondering how musicians keep track of timing ⏳ when playing sheet music. The answer lies in the **time signature**, which is indicated by a symbol next to the treble clef.")
                            .matchedGeometryEffect(id: "topTextP51", in: namespace)
                            .matchedGeometryEffect(id: "topTextP61", in: namespace)
                        
                        Text("For this app, we've decided to use a 4/4 time signature. The top number (4) indicates that there are four beats per measure, while the bottom number (also 4) signifies that a quarter note symbolizes one beat.")
                            .matchedGeometryEffect(id: "topTextP52", in: namespace)
                            .matchedGeometryEffect(id: "topTextP62", in: namespace)
                        
                        Text("With this information, we can divide the sheet music into **measures**, with each measure consisting of four beats (four quarter notes) as indicated by the time signature.")
                            .matchedGeometryEffect(id: "bottomTextP4", in: namespace)

                            .matchedGeometryEffect(id: "bottomTextP6", in: namespace)
                        
                        
                    }
                    .frame(width: 500)
                    
                    TrebleCleffStaffWithMeasures()
                    .matchedGeometryEffect(id: "musicStaffP4", in: namespace)
                    .matchedGeometryEffect(id: "musicStaffP5", in: namespace)
                    
                    HStack(alignment: .center, spacing: 100){
                        Button(
                            action: {
                                DispatchQueue.global(qos: .userInteractive).async {
                                    soundPlayer.play(sounds:["G4"])
                                }
                                withAnimation(.easeInOut(duration: 0.1)){
                                    self.currentPage = 5
                                }
                            },
                            label:{
                                Image(systemName: "arrowshape.left.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                            })
                        
                        Text("\(currentPage-1)")

                        Button(
                            action: {
                                DispatchQueue.global(qos: .userInteractive).async {
                                    soundPlayer.play(sounds:["A4"])
                                }
                                withAnimation(.easeInOut(duration: 0.1)){
                                    self.currentPage = 7
                                }
                            },
                            label:{
                                Image(systemName: "arrowshape.right.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                            })


                        }
                    .padding(.top, 30)
                    .matchedGeometryEffect(id: "navButton", in: namespace)
                    
                // ============ PAGE 6 ============= //
                } else if currentPage == 7 {
                    VStack(alignment: .leading, spacing: 15){
                        Text("In addition to the time signature, another important aspect of sheet music is the **tempo**. This can be expressed as a beats per minute (bpm) value or an Italian word like allegro.")
                            .matchedGeometryEffect(id: "topTextP61", in: namespace)
                        
                        Text("The tempo indicates how many notes are played per minute. In our case, since our time signature specifies that each beat is a quarter note, the bpm corresponds to how many quarter notes are played per minute. With that said, feel free to mess around with the bpm text box to change the speed. ⏱️")
                            .matchedGeometryEffect(id: "topTextP62", in: namespace)
                        
                    }
                    .frame(width: 500)
                    
                    TrebleClefViewWithSimpleMelody()
                    .matchedGeometryEffect(id: "musicStaffP5", in: namespace)
                    
                    Text("With all that said, I went ahead and wrote a simple tune. Press play above to hear it! 🔈")
                        .frame(width: 500)
                        .padding(.top,25)
                        .matchedGeometryEffect(id: "bottomTextP6", in: namespace)
                    
                    HStack(alignment: .center, spacing: 100){
                        Button(
                            action: {
                                DispatchQueue.global(qos: .userInteractive).async {
                                    soundPlayer.play(sounds:["A4"])
                                }
                                withAnimation(.easeInOut(duration: 0.1)){
                                    self.currentPage = 6
                                }
                            },
                            label:{
                                Image(systemName: "arrowshape.left.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                            })
                        
                        Text("\(currentPage-1)")

                        Button(
                            action: {
                                DispatchQueue.global(qos: .userInteractive).async {
                                    soundPlayer.play(sounds:["B4"])
                                }
                                withAnimation(.easeInOut(duration: 0.1)){
                                    self.currentPage = 8
                                }
                            },
                            label:{
                                Image(systemName: "arrowshape.right.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                            })


                        }
                    .padding(.top, 30)
                    .matchedGeometryEffect(id: "navButton", in: namespace)
                                        
                // ============ PAGE 7 ============= //
                } else if currentPage == 8 {
                    
                    HStack(alignment: .center, spacing: 100){
                        Button(
                            action: {
                                DispatchQueue.global(qos: .userInteractive).async {
                                    soundPlayer.play(sounds:["B4"])
                                }
                                withAnimation(.easeInOut(duration: 0.1)){
                                    self.currentPage = 7
                                }
                            },
                            label:{
                                Image(systemName: "arrowshape.left.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                            })
                        
                        Text("\(currentPage-1)")

                        Button(
                            action: {
                                DispatchQueue.global(qos: .userInteractive).async {
                                    soundPlayer.play(sounds:["C5"])
                                }
                                withAnimation(.easeInOut(duration: 0.1)){
                                    self.currentPage = 9
                                }
                            },
                            label:{
                                Image(systemName: "arrowshape.right.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                            })


                        }
                    .padding(.top, 30)
                    .matchedGeometryEffect(id: "navButton", in: namespace)
                    
                // ============ PAGE 8 ============= //
                } else if currentPage == 9 {
                    
                    HStack(alignment: .center, spacing: 100){
                        Button(
                            action: {
                                DispatchQueue.global(qos: .userInteractive).async {
                                    soundPlayer.play(sounds:["B4"])
                                }
                                withAnimation(.easeInOut(duration: 0.1)){
                                    self.currentPage = 7
                                }
                            },
                            label:{
                                Image(systemName: "arrowshape.left.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                            })
                        
                        Text("\(currentPage-1)")

                        Button(
                            action: {
                                DispatchQueue.global(qos: .userInteractive).async {
                                    soundPlayer.play(sounds:["C5"])
                                }
                                withAnimation(.easeInOut(duration: 0.1)){
                                    self.currentPage = 9
                                }
                            },
                            label:{
                                Image(systemName: "arrowshape.right.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                            })


                        }
                    .padding(.top, 30)
                    .matchedGeometryEffect(id: "navButton", in: namespace)
                    
                }
                
            }
        }
    }

