//
//  AuthManager.swift
//  Spotify
//
//  Created by Рамиль Мухаррямов on 12.02.2022.
//

import Foundation

final class AuthManager {
    static var shared = AuthManager()
    
    private init() {}
    
    struct Constants {
        static let clientId = "50bd57d9984d41eba7a615a081bd011b"
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
        static let clientSecret = "beda80d400aa4a309179c9d6cf0ceaa9"
    }
    
    public var signInUrl: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://instagram.com/ramalike"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientId)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var acessToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    public func exchangeCodeForToken(code: String, complition: @escaping(Bool) -> Void) {
        //get token
        
        guard let url = URL(string: Constants.tokenAPIURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
       var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value : "authorization_code"),
            URLQueryItem(name: "code", value : code),
            URLQueryItem(name: "redirect_uri", value : "https://instagram.com/ramalike")
        ]
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
               complition(false)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(json)
            }
            catch {
                print(error)
                complition(false)
            }
        }
    }
    public func refreshAccessToken() {
        
    }
    private func cacheToken() {
        
    }
}
