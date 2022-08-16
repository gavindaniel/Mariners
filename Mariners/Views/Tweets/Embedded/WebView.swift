//
//  WebView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/8/22.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL // url that will be passed to URLRequest
    @Binding var showLoading: Bool // optional show loading symbol
    
    func makeUIView(context: Context) -> some UIView {
        // create the web view
        let webView = WKWebView()
            webView.navigationDelegate = context.coordinator
        
        // create a URL request using a given URL
        let request = URLRequest(url: url)
        
        // load the request to the web view
        webView.load(request)
        
        // return the loaded web view
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // not needed for now
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(didStart: {
            showLoading = true
        }, didFinish: {
            showLoading = false
        })
    }
}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    var didStart: () -> Void
    var didFinish: () -> Void
    
    // initializer
    init(didStart: @escaping () -> Void = {}, didFinish: @escaping () -> Void = {}) {
        self.didStart = didStart
        self.didFinish = didFinish
    }
    
    //
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        didStart()
    }
    
    //
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinish()
    }
    
    //
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error)
    }
}
