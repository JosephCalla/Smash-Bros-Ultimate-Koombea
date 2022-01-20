//
//  FighterResponse.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created by Joseph Estanislao Calla Moreyra on 20/01/22.
//

import Foundation

// MARK: - FighterElement
struct FighterResponse: Codable {
    let objectID: String
    let name: String
    let universe: String
    let price: String
    let popular: Bool
    let rate: Int
    let downloads: String
    let fighterDescription: String
    let createdAt: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case objectID, name, universe, price, popular, rate, downloads
        case fighterDescription = "description"
        case createdAt = "created_at"
        case imageURL
    }
}
