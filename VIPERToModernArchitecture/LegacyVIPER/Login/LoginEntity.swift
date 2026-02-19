//
//  LoginEntity.swift
//  VIPERToModernArchitecture
//
//  Created by Gökhan Taymaz on 19.02.2026.
//

import Foundation

enum LoginEntity {

    struct Request: Encodable {
        let email: String
        let password: String
    }

    struct Response: Decodable {
        let token: String
        let userId: String
    }
}
