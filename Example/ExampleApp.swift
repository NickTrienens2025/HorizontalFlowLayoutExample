//
//  ExampleApp.swift
//  Example
//
//  Created by Nick Trienens on 3/19/25.
//

import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView.withTabs()
        }
    }
}


// Extension to ContentView to add a tab view
extension ContentView {
    static func withTabs() -> some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Constriction", systemImage: "arrow.left.and.right")
                }
            
            RemovableTagsView()
                .tabItem {
                    Label("Removable Tags", systemImage: "tag")
                }
            
            FailingContentView()
                .tabItem {
                    Label("Too Tight", systemImage: "arrow.left.and.right")
                }
            
        }
    }
}
