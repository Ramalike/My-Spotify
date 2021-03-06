//
//  AuthViewController.swift
//  Spotify
//
//  Created by Рамиль Мухаррямов on 12.02.2022.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate {

    public var completionHandler: ((Bool) -> Void)?
    
    private let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero , configuration: config)
        return webView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign in"
        view.backgroundColor = .systemBackground
        webView.navigationDelegate = self
        view.addSubview(webView)
        guard let url = AuthManager.shared.signInUrl else { return }
        webView.load(URLRequest(url: url))
        
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else { return }
        
        //exchange the code for acces token
        let component = URLComponents(string: url.absoluteString)
       guard let code = component?.queryItems?.first(where: { $0.name == "code"})?.value else {
            return
        }
        print("Code:\(code)")
    }
}
