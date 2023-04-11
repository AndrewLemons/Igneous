//
//  ContentView.swift
//  Igneous
//
//  Created by Andrew on 4/10/23.
//

import SwiftUI
import CoreFoundation

struct ContentView: View {
    var homeUrl: String = {
        let plist = getPlist(withName: "Config")
        return plist["Home Url"] as? String ?? "https://example.com/"
    }()
    
    var webView = WebView()
    
    var body: some View {
        webView
            .cornerRadius(12)
            .padding(.bottom, 8)
            .padding(.horizontal, 8)
            .frame(
                minWidth: 250,
                minHeight: 250
            )
            .onAppear {
                webView.load(url: URL(string: homeUrl)!)
            }
            .toolbar {
                Button(action: {
                    webView.load(url: URL(string: homeUrl)!)
                }) {
                    Image(systemName: "house")
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .presentedWindowStyle(.hiddenTitleBar)
    }
}
