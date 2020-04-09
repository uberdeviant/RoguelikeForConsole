//
//  Heroes.swift
//  RoguelikeForConsole
//
//  Created by Ramil Salimov on 07.04.2020.
//  Copyright © 2020 Ramil Salimov. All rights reserved.
//

import Foundation

protocol ObjectProtocol{
    var symbol: Character {get}
    var coordinate: Coordinate {get set}
}

struct Player: ObjectProtocol{
    let symbol: Character = "👮‍♀️"
    
    var speed: Int = 1
    var health: Int = 100
    var shield: Int = 50
    
    var coordinate: Coordinate
    
    init(coordinate: Coordinate) {
        self.coordinate = coordinate
    }
}

struct Enemy: ObjectProtocol {
    
    enum EnemyBasicType{
        case Zombie
        case Skeleton
        case Ghost
    }
    
    let symbol: Character
    let name: String
    
    var speed: Int
    var health: Int
    
    var attack: Int
    
    var coordinate: Coordinate
    
    init(enemyBasicType: EnemyBasicType) {
        switch enemyBasicType {
        case .Zombie:
            self.symbol = "🧟‍♂️"
            self.name = "Zombie"
            
            self.speed = 1
            self.health = 10
            
            self.attack = 10
            
            self.coordinate = Coordinate(x: Int.random(in: 0...Coordinate.maxX), y: Int.random(in: 0...Coordinate.maxY))
        case .Skeleton:
            self.symbol = "💀"
            self.name = "Skeleton"
            
            self.speed = 1
            self.health = 25
            
            self.attack = 20
            
            self.coordinate = Coordinate(x: Int.random(in: 0...Coordinate.maxX), y: Int.random(in: 0...Coordinate.maxY))
        case .Ghost:
            self.symbol = "👻"
            self.name = "Skeleton"
            
            self.speed = 2
            self.health = 25
            
            self.attack = 10
            
            self.coordinate = Coordinate(x: Int.random(in: 0...Coordinate.maxX), y: Int.random(in: 0...Coordinate.maxY))
        }
    }
    
    init(symbol: Character, name: String, speed: Int, health: Int, attack: Int, coordinate: Coordinate) {
        self.symbol = symbol
        self.name = name
        self.speed = speed
        self.health = health
        self.attack = attack
        self.coordinate = coordinate
    }
}

struct Pickup: ObjectProtocol{
    enum PowerUpType {
        case speedUp
    }
    let symbol: Character
    let type: PowerUpType
    var coordinate: Coordinate
    
    init(type: PowerUpType) {
        self.symbol = "🍕"
        self.type = type
        self.coordinate = Coordinate(x: Int.random(in: 0...Coordinate.maxX), y: Int.random(in: 0...Coordinate.maxY))
        
    }

}

