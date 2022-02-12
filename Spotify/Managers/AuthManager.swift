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
    }
    public func refreshAccessToken() {
        
    }
    private func cacheToken() {
        
    }
}
