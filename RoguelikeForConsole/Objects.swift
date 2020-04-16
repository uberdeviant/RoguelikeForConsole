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
    let lookRange: Int
    
    var speed: Int
    var health: Int
    
    var attack: Int
    
    var coordinate: Coordinate
    
    mutating func followPlayer(player: Player){
        let xDifference = player.coordinate.x - self.coordinate.x
        let yDifference = player.coordinate.y - self.coordinate.y
        
        if (xDifference < lookRange && xDifference > -lookRange) && (yDifference < lookRange && yDifference > -lookRange){
            if player.coordinate.x > self.coordinate.x{
                self.coordinate.x += speed
            }else{
                self.coordinate.x -= speed
            }
            
            if player.coordinate.y > self.coordinate.y{
                self.coordinate.y += speed
            }else{
                self.coordinate.y -= speed
            }
            self.coordinate.x = self.coordinate.x < 0 ? 0 : coordinate.x
            self.coordinate.y = self.coordinate.y < 0 ? 0 : coordinate.y
            
            self.coordinate.x = self.coordinate.x > Coordinate.maxX ? Coordinate.maxX : coordinate.x
            self.coordinate.y = self.coordinate.y > Coordinate.maxY ? Coordinate.maxY : coordinate.y
        }
        
    }
    
    init(enemyBasicType: EnemyBasicType) {
        switch enemyBasicType {
        case .Zombie:
            self.symbol = "🧟‍♂️"
            self.name = "Zombie"
            
            self.speed = 1
            self.lookRange = 4
            self.health = 10
            
            self.attack = 10
            
            self.coordinate = Coordinate(x: Int.random(in: 0...Coordinate.maxX), y: Int.random(in: 0...Coordinate.maxY))
        case .Skeleton:
            self.symbol = "💀"
            self.name = "Skeleton"
            
            self.speed = 1
            self.lookRange = 3
            self.health = 25
            
            self.attack = 20
            
            self.coordinate = Coordinate(x: Int.random(in: 0...Coordinate.maxX), y: Int.random(in: 0...Coordinate.maxY))
        case .Ghost:
            self.symbol = "👻"
            self.name = "Skeleton"
            
            self.speed = 1
            self.lookRange = 5
            self.health = 25
            
            self.attack = 10
            
            self.coordinate = Coordinate(x: Int.random(in: 0...Coordinate.maxX), y: Int.random(in: 0...Coordinate.maxY))
        }
    }
    
    init(symbol: Character, name: String, speed: Int, health: Int, lookRange: Int, attack: Int, coordinate: Coordinate) {
        self.symbol = symbol
        self.name = name
        self.speed = speed
        self.health = health
        self.attack = attack
        self.coordinate = coordinate
        self.lookRange = lookRange
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

