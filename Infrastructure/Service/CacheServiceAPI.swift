//
//  CacheServiceAPI.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 13/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation


public class CacheServiceAPI {
    private struct UserForCacheToReturn: Codable {
        let email: String
        let age: Int
        let birthday: Date
        
    }
    
    static private let kUserCache = "user_key"
    
    init() {
        let birthday = Date(timeIntervalSince1970: TimeInterval(exactly: 917870400)!)
        let user = UserForCacheToReturn(email: "Bem-Vindo ao PokePoke", age: 20, birthday: birthday)
        try? store(user, for: CacheServiceAPI.kUserCache)
    }
    
    private func store<T:Codable>(_ value: T, for key: String) throws {
        let json = try JSONEncoder().encode(value)
        UserDefaults.standard.set(json, forKey: key)
    }
    
    public func retrieve<T>(fromKey key: String) -> T? where T : Codable {
        guard let json = UserDefaults.standard.data(forKey: key), let result = try? JSONDecoder()
            .decode(T.self, from: json) else { return nil }
        return result
    }
}
