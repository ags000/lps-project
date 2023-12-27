//
//  FetchModel.swift
//  ProyectoLPS
//
//  Created by Aula03 on 27/11/23.
//

import Foundation


struct Player: Identifiable, Decodable {
    let id: Int
    let rank: Int
    let overallRating: Int
    let position: Position
    let firstName: String
    let lastName: String
    let avatarUrl: String
}

struct Page: Decodable {
    let page: Int
    let limit: Int
}

struct Position: Decodable {
    let shortLabel: String
}

struct Response: Decodable {
    let next: Page
    let results: [Player]
}
