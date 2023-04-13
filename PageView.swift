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
                        VStack(alignment: .leading, spacing: 15){
                            Text("Have you ever wished you could play a beautiful melody 🎶 on an instrument 🎸 or create your own music?")
                            Text("Learning to read sheet music unlocks a whole new world of musical possibilities! It's like a secret code that tells you which notes to play, how long to hold them, and even how loud or soft to play them.")
                            Text("Once you master this language, you can play any song you want and even create your own music. It's like having a superpower that lets you express yourself through music.")
                        }
                        .matchedGeometryEffect(id: "topTextP1", in: namespace)
                        .frame(width: 500)
                        
                        Text("Ready to get started?")
                            .padding(.vertical, 10)
                            .matchedGeometryEffect(id: "bottomText", in: namespace)
                            .frame(width: 500)
                    
                        
                        Button("Get Started") {
                            withAnimation(.easeInOut(duration: 0.1)){
                                self.currentPage = 2
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.black)
                        .matchedGeometryEffect(id: "nextButton", in: namespace)

                    
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
                        
                        TrebbleCleffStafWithoutMeasures()
                        .matchedGeometryEffect(id: "musicStaff", in: namespace)
                    
                    
                    VStack(alignment: .leading, spacing: 15){
                        Text("Each space and line above symbolizes a musical note 🎵.")
                        Text("Musical notes are denoted as alphabets. A, B, C, D, E, F, and G.")
                    }
                    .frame(width: 500)
                    .matchedGeometryEffect(id: "bottomText", in: namespace)
                    
                    Button("Next") {
                            
                        withAnimation(.easeInOut(duration: 0.1)){
                            self.currentPage = 3
                        }
                            
                    }
                    .padding(.top, 5)
                    .buttonStyle(.borderedProminent)
                    .tint(.black)
                    .matchedGeometryEffect(id: "nextButton", in: namespace)

                // ========== PAGE 3 ============= //
                } else if currentPage == 3 {
                    
                    VStack(alignment: .leading, spacing: 15){
                            Text("I went ahead and placed down some notes for you. I also labeled them so you can better understand!")
                            
                            Text("As you can see, the notes either go on a space or a line on the musical staff.")
                            
                        }
                        .frame(width: 500)
                        .matchedGeometryEffect(id: "topTextP2", in: namespace)

                    TrebbleCleffStafWithoutMeasures()
                        .matchedGeometryEffect(id: "musicStaff", in: namespace)

                    
                    
                }
            }
        }
    }

struct TrebbleCleffStafWithoutMeasures: View{
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
