//
//  Heroes.swift
//  RoguelikeForConsole
//
//  Created by Ramil Salimov on 07.04.2020.
//  Copyright © 2020 Ramil Salimov. All rights reserved.
//

import Foundation

struct Player{
    let symbol: Character = "👮‍♀️"
    
    var speed: Int = 1
    var health: Int = 100
    var shield: Int = 50
    
    var coordinate: Coordinate
    
    init(coordinate: Coordinate) {
        self.coordinate = coordinate
    }
}

struct Pickup{
    enum PowerUpType {
        case speedUp
    }
    let symbol: Character
    let type: PowerUpType
    let coordinate: Coordinate
    
    init(type: PowerUpType) {
        self.symbol = "🍕"
        self.type = type
        self.coordinate = Coordinate(x: Coordinate.getXCoordinate(by: Int.random(in: 0...CoordinateX.x9.rawValue)), y: Coordinate.getYCoordinate(by: Int.random(in: 0...CoordinateY.y4.rawValue)))
        
    }

}

