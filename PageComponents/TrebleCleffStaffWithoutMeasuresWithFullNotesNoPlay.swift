//
//  TrebleCleffStaffWithoutMeasuresWithFullNotesNoPlay.swift
//  Treble Tracks
//
//  Created by Joshua Tolentino on 2023-04-14.
//

import Foundation
import SwiftUI

struct TrebleCleffStaffWithoutMeasuresWithFullNotesNoPlay: View{
    
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
                                    Text("C4")
                                        .font(.system(size: 14))
                                        .position(x:10,y:50)
                                )
                                .position(x:0,y:150)
                            
                            QuarterNote()
                            
                                .background(
                                    Text("D4")
                                        .font(.system(size: 14))
                                        .position(x:10,y:61)
                                )
                                .position(x: 0,y:139)
                            
                            QuarterNote()
                                .background(
                                    Text("E4")
                                        .font(.system(size: 14))

                                        .position(x:10,y:71)
                                )
                                .position(x: 0,y:129)
                            
                            QuarterNote()
                                .background(
                                    Text("F4")
                                        .font(.system(size: 14))

                                        .position(x:10,y:82)
                                )
                                .position(x: 0,y:118)
                            
                            QuarterNote()
                                .background(
                                    Text("G4")
                                        .font(.system(size: 14))

                                        .position(x:10,y:92)
                                )
                                .position(x: 0,y:108)
                            
                            QuarterNote()
                                .background(
                                    Text("A4")
                                        .font(.system(size: 14))

                                        .position(x:10,y:104)
                                )
                                .position(x: 0,y:96)
                            
                            QuarterNote()
                                .background(
                                    Text("B4")
                                        .font(.system(size: 14))

                                        .position(x:10,y:114)
                                )
                                .position(x: 0,y:86)
                            
                            QuarterNote()
                                .background(
                                    Text("C5")
                                        .font(.system(size: 14))

                                        .position(x:10,y:126)
                                )
                                .position(x: 0,y:74)
                            
                            QuarterNote()
                                .background(
                                    Text("D5")                                        .font(.system(size: 14))

                                        .position(x:10,y:137)
                                )
                                .position(x: 0,y:63)
                            
                            QuarterNote()
                                .background(
                                    Text("E5")
                                        .font(.system(size: 14))

                                        .position(x:10,y:148)
                                )
                                .position(x: 0,y:52)
                            
                        }
                        Group{
                            QuarterNote()
                                .background(
                                    Text("F5")
                                        .font(.system(size: 14))

                                        .position(x:10,y:159)
                                )
                                .position(x: 0,y:41)
                            
                            QuarterNote()
                                .background(
                                    Text("G5")
                                        .font(.system(size: 14))

                                        .position(x:10,y:170)
                                )
                                .position(x: 0,y:30)
                            
                            QuarterNote()
                                .background(
                                    Text("A5")
                                        .font(.system(size: 14))

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
                                    Text("B5")
                                        .font(.system(size: 14))

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
                                    Text("C6")
                                        .font(.system(size: 14))

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
            .frame(height: 300)
        }
    }
}
