//
//  PageView.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-10.
//

import SwiftUI

struct PageView: View {
    // Track the current page using a state variable
    @State private var currentPage = 5
    @Namespace var namespace
    var soundPlayer = SoundPlayer()
    
    var body: some View {
            VStack {
                
                // ========== PAGE 1 ============= //
                
                if currentPage == 1 {
                    VStack(spacing: 5){
                        Text("Treble Tracks")
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

                        

                    
                // ========== PAGE 2 ============= //
                } else if currentPage == 2 {
                    // Page2()
                    
                    VStack(alignment: .leading, spacing: 15){
                            Text("Now, what you see here is called a **musical staff**. It consists of **four** spaces and **five** lines.")
                            .matchedGeometryEffect(id: "topTextP21", in: namespace)
                            
                            Text("The fancy symbol you see on the left is called the **treble clef**. It notates what notes the spaces and lines symbolizes.")
                            .matchedGeometryEffect(id: "topTextP22", in: namespace)
                            
                        }
                        .frame(width: 500)
                        .matchedGeometryEffect(id: "topTextP1", in: namespace)
                        
                    TrebbleCleffStaffWithoutMeasures()
                        .matchedGeometryEffect(id: "musicalStaffP1", in: namespace)
                        .matchedGeometryEffect(id: "musicStaffP2", in: namespace)
                    
                    
                    VStack(alignment: .leading, spacing: 15){
                        Text("Each space and line above symbolizes a musical note 🎵.")
                        Text("Musical notes are denoted as alphabets. A, B, C, D, E, F, and G.")
                    }
                    .frame(width: 500)
                    .matchedGeometryEffect(id: "bottomTextP1", in: namespace)
                    
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
                    

                // ========== PAGE 3 ============= //
                } else if currentPage == 3 {
                    
                        VStack(alignment: .leading, spacing: 15){
                            Text("I went ahead and placed down some notes for you. I also labeled them so you can better understand!")
                                .matchedGeometryEffect(id: "topTextP21", in: namespace)
                                .matchedGeometryEffect(id: "topTextP31", in: namespace)
                            
                            Text("As you can see, the notes either go on a space or a line on the musical staff. Also, each of the notes present below are called **quarter notes**, we will talk more above this later.")
                                .matchedGeometryEffect(id: "topTextP23", in: namespace)
                                .matchedGeometryEffect(id: "topTextP32", in: namespace)
                            
                            
                        }
                        .frame(width: 500)
                        .matchedGeometryEffect(id: "topTextP33", in: namespace)

                        TrebbleCleffStaffWithoutMeasuresWithBasicNotes()
                            .matchedGeometryEffect(id: "musicStaffP2", in: namespace)
                            .matchedGeometryEffect(id: "musicStaffP3", in: namespace)

                        Text("However, as stated before, we are in the **treble clef**, these are not all the notes present in this musical staff!")
                            .padding(.top, 70)
                            .padding(.bottom, 10)
                            .frame(width: 500)
                            .matchedGeometryEffect(id: "bottomTextP1", in: namespace)
                            .matchedGeometryEffect(id: "bottomText2", in: namespace)

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
                    
                // ========== PAGE 4 ============= //
                } else if currentPage == 4 {
                    VStack(alignment: .leading, spacing: 15){
                        Text("Here are the rest of the notes in the treble clef. As you can see, it is a wide range of notes. Since the letters are repeating, we typically number each note to uniquely identify them. ")
                            .matchedGeometryEffect(id: "topTextP31", in: namespace)
                        
                        Text("For example, the leftmost C in this musical staff is known as **C4** or **middle C**. The numbering increments when another C is reached. So the next C is labled **C5** and the final C is labled **C6** and each note in between follows that number D4, E4, etc.")
                            .matchedGeometryEffect(id: "topTextP32", in: namespace)
                        
                        Text("Additionally, there are notes that are placed outside the five main lines of the musical staff. These notes are marked with lines that are called **ledger lines** to easily determine them.")
                            .matchedGeometryEffect(id: "topTextP33", in: namespace)
                        
                        
                    }
                    .frame(width: 500)

                    TrebbleCleffStaffWithoutMeasuresWithFullNotes()
                        .matchedGeometryEffect(id: "musicStaffP3", in: namespace)
                        .matchedGeometryEffect(id: "musicStaffP4", in: namespace)
                    
                    Text("Feel free to press the play button above the hear the notes! 🎶")
                        .padding(.top, 70)
                        .padding(.bottom, 10)
                        .frame(width: 500)
                        .matchedGeometryEffect(id: "bottomText2", in: namespace)
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
                
                // ========== PAGE 5 ============= //
                } else if currentPage == 5 {
                    
                    VStack(alignment: .leading, spacing: 15){
                        Text("Now you might be thinking, how do musicians keep track of timing? 🧐⏰")
                            .matchedGeometryEffect(id: "topTextP31", in: namespace)
                        
                        Text("Musicians note the timing (known as a **time signature**) with the symbol beside the treble clef. For this app playground, we have decided with a 4/4 time signature. The top 4 indicates that there are 4 beats per measure and the bottom 4 indicates that a quarter note symbolizes one beat.")
                            .matchedGeometryEffect(id: "topTextP32", in: namespace)
                        
                        Text("Now that we know that, we can seperate the sheet music by **measures**, each having four beats as indicated by the time signature.")
                            .matchedGeometryEffect(id: "topTextP33", in: namespace)
                        
                        
                    }
                    .frame(width: 500)
                    
                    TrebbleCleffStafWithMeasures()
                    .matchedGeometryEffect(id: "musicStaffP4", in: namespace)
                    
                    
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
                
                // ========== PAGE 6 ============= //

                } else if currentPage == 6 {
                    
                }
                
            }
        }
    }

