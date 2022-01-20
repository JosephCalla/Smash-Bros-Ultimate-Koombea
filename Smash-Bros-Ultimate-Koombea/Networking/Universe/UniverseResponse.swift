//
//  UniverseResponse.swift
//  Smash-Bros-Ultimate-Koombea
//
//  Created by Joseph Estanislao Calla Moreyra on 20/01/22.
//

import Foundation
// MARK: - UniverseResponse
struct UniverseResponseElement: Codable {
    let objectID: String
    let name: String
    let universeDescription: String

    enum CodingKeys: String, CodingKey {
        case objectID, name
        case universeDescription = "description"
    }
}
