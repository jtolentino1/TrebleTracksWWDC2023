//
//  MyApp.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-08.
//

import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 1024, height: 760)
                .preferredColorScheme(.light)
            
                .onAppear {
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                    windowScene.sizeRestrictions?.minimumSize = CGSize(width: 1024, height: 760)
                    windowScene.sizeRestrictions?.maximumSize = CGSize(width: 1024, height: 760)
                }
            
        }
    }
}
