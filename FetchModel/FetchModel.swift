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
    let stats: Stats
    let team: TeamPlayer
    
}



struct Page: Decodable {
    let page: Int
    let limit: Int
}

struct Position: Decodable {
    let shortLabel: String
}

struct Stats: Decodable {
    let acceleration: Acceleration
    let aggression: Aggression
    let agility: Agility
    let balance: Balance
    let ballControl: BallControl
    let defensiveAwareness: DefensiveAwareness
    let dribbling: Dribbling
    let freeKickAccuracy: FreeKickAccuracy
    let longShots: LongShots
    let sprintSpeed: SprintSpeed
    let shotPower: ShotPower
}



struct Acceleration: Decodable {
    let value: Int
}

struct Dribbling: Decodable {
    let value: Int
}

struct Aggression: Decodable {
    let value: Int
}

struct Agility: Decodable {
    let value: Int
}

struct Balance: Decodable {
    let value: Int
}

struct BallControl: Decodable {
    let value: Int
}

struct DefensiveAwareness: Decodable {
    let value: Int
}

struct FreeKickAccuracy: Decodable {
    let value: Int
}

struct LongShots: Decodable {
    let value: Int
}

struct SprintSpeed: Decodable {
    let value: Int
}

struct ShotPower: Decodable {
    let value: Int
}

struct Equipo: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let image: String
}
struct TeamPlayer: Identifiable, Decodable {
    let id = UUID()
    let label: String
    let imageUrl: String
    let isPopular: Bool
}
struct Response: Decodable {
    let next: Page
    let results: [Player]
}


