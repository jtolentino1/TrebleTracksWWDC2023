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
    @Namespace var namespace
    
    var body: some View {
            VStack {
                
                // ========== PAGE 1 ============= //
                
                if currentPage == 1 {
                    VStack{
                        Text("Treble Tracks")
                            .fontWeight(.bold)
                            .font(.system(size: 36))
                        
                        Text("WWDC 2023 Submission By: Joshua Tolentino")
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
                            .padding(.vertical, 10)
                            .frame(width: 500)
                            .matchedGeometryEffect(id: "bottomText", in: namespace)
                    
                        
                        Button("Get Started") {
                            withAnimation(.easeInOut(duration: 0.1)){
                                self.currentPage = 2
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
                        
                            
                            Text("The fancy symbol you see on the left is called the **treble clef**. It notates what notes the spaces and lines symbolizes.")
                            
                        }
                        .frame(width: 500)
                        .matchedGeometryEffect(id: "topTextP1", in: namespace)
                        .matchedGeometryEffect(id: "topTextP2", in: namespace)
                        
                    TrebbleCleffStaffWithoutMeasures()
                        .matchedGeometryEffect(id: "musicStaff", in: namespace)
                        .matchedGeometryEffect(id: "musicalStaffP1", in: namespace)
                    
                    
                    VStack(alignment: .leading, spacing: 15){
                        Text("Each space and line above symbolizes a musical note 🎵.")
                        Text("Musical notes are denoted as alphabets. A, B, C, D, E, F, and G.")
                    }
                    .frame(width: 500)
                    .matchedGeometryEffect(id: "bottomText", in: namespace)
                    
                    HStack(alignment: .center, spacing: 100){
                        Button(
                            action: {
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
                            
                            Text("As you can see, the notes either go on a space or a line on the musical staff. Also, each of the notes present below are called **quarter notes**, we will talk more above this later.")
                            
                            
                        }
                        .frame(width: 500)
                        .matchedGeometryEffect(id: "topTextP2", in: namespace)
                        .matchedGeometryEffect(id: "topTextP3", in: namespace)

                    
                        TrebbleCleffStaffWithoutMeasuresWithBasicNotes()
                            .matchedGeometryEffect(id: "musicStaff", in: namespace)
                            .matchedGeometryEffect(id: "musicStaff2", in: namespace)

                        Text("However, as stated before, we are in the **treble clef**, these are not all the notes present in this musical staff!")
                            .padding(.top, 70)
                            .padding(.bottom, 10)
                            .frame(width: 500)
                            .matchedGeometryEffect(id: "bottomText", in: namespace)
                            .matchedGeometryEffect(id: "bottomText2", in: namespace)

                    HStack(alignment: .center, spacing: 100){
                        Button(
                            action: {
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
                        
                        Text("For example, the leftmost C in this musical staff is known as **C4** or **middle C**. The numbering increments when another C is reached. So the next C is labled **C5** and the final C is labled **C6** and each note in between follows that number D4, E4, etc.")
                        
                        
                    }
                    .frame(width: 500)
                    .matchedGeometryEffect(id: "topTextP3", in: namespace)

                    TrebbleCleffStaffWithoutMeasuresWithFullNotes()
                        .matchedGeometryEffect(id: "musicStaff2", in: namespace)
                
                    Text("Feel free to press the play button above the hear the notes! 🎶")
                        .padding(.top, 70)
                        .padding(.bottom, 10)
                        .frame(width: 500)
                        .matchedGeometryEffect(id: "bottomText2", in: namespace)

                HStack(alignment: .center, spacing: 100){
                    Button(
                        action: {
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
                
                }
                
            }
        }
    }

