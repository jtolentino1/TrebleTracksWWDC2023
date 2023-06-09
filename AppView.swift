//
//  AppView.swift
//  TrebleTracksWWDC2023
//
//  Created by Joshua Tolentino on 2023-04-08.
//

import SwiftUI

@main
struct AppView: App {
    var body: some Scene {
        WindowGroup {
            #if targetEnvironment(macCatalyst)
            PageView()
                .frame(width: 1024, height: 760)
                .preferredColorScheme(.light)
                .onAppear {
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                    windowScene.sizeRestrictions?.minimumSize = CGSize(width: 1024, height: 820)
                    windowScene.sizeRestrictions?.maximumSize = CGSize(width: 1024, height: 820)
                }
                .clipShape(RoundedRectangle(cornerRadius: 16))

            #else
            Text("This app is optimized to run as a Mac Catalyst app. Please relaunch it as a Mac Catalyst app.")

            #endif
//            PageView()
        }
    }

}
