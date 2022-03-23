//
//  WebView.swift
//  H4X0R News
//
//  Created by Yelim Kim on 25/1/22.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeStirng = urlString {
            if let url = URL(string: safeStirng) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}

