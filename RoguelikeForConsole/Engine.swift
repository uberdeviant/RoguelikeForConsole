//
//  Engine.swift
//  RoguelikeForConsole
//
//  Created by Ramil Salimov on 07.04.2020.
//  Copyright © 2020 Ramil Salimov. All rights reserved.
//

import Foundation

struct Coordinate: Equatable{
    var x: Int
    var y: Int
    
    static let maxX = 9
    static let maxY = 4
    
    
    mutating func addOrMinusCoordinate(xNumber: Int, yNumber: Int){
            var numberX = x{
                didSet{
                    if numberX < 0{
                        numberX = 0
                    }else if numberX >= Coordinate.maxX{
                        numberX = 9
                    }
                }
            }
            numberX += xNumber
            x = numberX
        
            var numberY = y{
                didSet{
                    if numberY < 0{
                        numberY = 0
                    }else if numberY >= Coordinate.maxY{
                        numberY = 4
                    }
                }
            }
            numberY += yNumber
            y = numberY
    }
}

struct MapSegment {
    let coordinte: Coordinate
    let symbol: Character = "_"
}

struct Engine{
    var map: [MapSegment] = []
    var enemies: [Enemy] = [Enemy(enemyBasicType: .Ghost), Enemy(enemyBasicType: .Skeleton), Enemy(enemyBasicType: .Zombie)]
    var pickups: [Pickup] = [Pickup(type: Pickup.PowerUpType.speedUp)]
    var player = Player(coordinate: Coordinate(x: 4, y: 2))
    
    init() {
        map = createMap()
    }
    
    
    func printMap(){
        var line = ""
        print("❤️\(player.health)|🛡\(player.shield)|******|👟\(player.speed)")
        for mapSegment in map{
            if mapSegment.coordinte == player.coordinate{
                line.append(player.symbol)
            }else if enemies.contains(where: {$0.coordinate == mapSegment.coordinte}){
                let symbol = addObject(from: enemies, mapSegment: mapSegment.coordinte)
                if symbol != nil{
                    line.append(symbol!)
                }
            }else if pickups.contains(where: {$0.coordinate == mapSegment.coordinte}){
                let symbol = addObject(from: pickups, mapSegment: mapSegment.coordinte)
                if symbol != nil{
                    line.append(symbol!)
                }
            }else{
                line.append(" ")
                line.append(mapSegment.symbol)
            }
            if mapSegment.coordinte.x == 9{
                print(line)
                line = ""
            }
        }
    }
    
    private func addObject(from array: [ObjectProtocol], mapSegment coordinate: Coordinate) -> Character?{
        for object in array{
            if object.coordinate == coordinate{
                return object.symbol
            }
        }
        return nil
    }
    
    
    private func createMap() -> [MapSegment]{
        var map: [MapSegment] = []
        
        for numberY in 0...4{
            for numberX in 0...9{
                let mapSegment = MapSegment(coordinte: Coordinate(x: numberX, y: numberY))
                map.append(mapSegment)
            }
        }
        
        return map
    }
    
    
}
