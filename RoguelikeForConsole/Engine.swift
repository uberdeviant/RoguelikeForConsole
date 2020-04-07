//
//  Engine.swift
//  RoguelikeForConsole
//
//  Created by Ramil Salimov on 07.04.2020.
//  Copyright © 2020 Ramil Salimov. All rights reserved.
//

import Foundation

enum CoordinateX: Int, CaseIterable{
    case x0 = 0
    case x1 = 1
    case x2 = 2
    case x3 = 3
    case x4 = 4
    case x5 = 5
    case x6 = 6
    case x7 = 7
    case x8 = 8
    case x9 = 9
}

enum CoordinateY: Int, CaseIterable{
    case y0 = 0
    case y1 = 1
    case y2 = 2
    case y3 = 3
    case y4 = 4
}

struct Coordinate: Equatable{
    var x: CoordinateX
    var y: CoordinateY
    
    static func getXCoordinate(by number: Int) -> CoordinateX{
        switch number {
        case 0:
            return CoordinateX.x0
        case 1:
            return CoordinateX.x1
        case 2:
            return CoordinateX.x2
        case 3:
            return CoordinateX.x3
        case 4:
            return CoordinateX.x4
        case 5:
            return CoordinateX.x5
        case 6:
            return CoordinateX.x6
        case 7:
            return CoordinateX.x7
        case 8:
            return CoordinateX.x8
        case 9:
            return CoordinateX.x9
        default:
            return CoordinateX.x0
        }
    }
    
    static func getYCoordinate(by number: Int) -> CoordinateY{
        switch number {
        case 0:
            return CoordinateY.y0
        case 1:
            return CoordinateY.y1
        case 2:
            return CoordinateY.y2
        case 3:
            return CoordinateY.y3
        case 4:
            return CoordinateY.y4
        default:
            return CoordinateY.y0
        }
    }
    
    mutating func addOrMinusCoordinate(xNumber: Int, yNumber: Int){
            var numberX = x.rawValue{
                didSet{
                    if numberX < 0{
                        numberX = 0
                    }else if numberX >= CoordinateX.x9.rawValue{
                        numberX = 9
                    }
                }
            }
            numberX += xNumber
            x = Coordinate.getXCoordinate(by: numberX)
        
            var numberY = y.rawValue{
                didSet{
                    if numberY < 0{
                        numberY = 0
                    }else if numberY >= CoordinateY.y4.rawValue{
                        numberY = 4
                    }
                }
            }
            numberY += yNumber
            y = Coordinate.getYCoordinate(by: numberY)
    }
}

struct MapSegment {
    let coordinte: Coordinate
    let symbol: Character = "_"
}

struct Engine{
    var map: [MapSegment] = []
    var pickups: [Pickup] = [Pickup(type: Pickup.PowerUpType.speedUp)]
    var player = Player(coordinate: Coordinate(x: .x4, y: .y2))
    
    init() {
        map = createMap()
    }
    
    
    func printMap(){
        var line = ""
        print("❤️\(player.health)|🛡\(player.shield)|******|👟\(player.speed)")
        for mapSegment in map{
            if mapSegment.coordinte == player.coordinate{
                line.append(player.symbol)
            }else if pickups.contains(where: {$0.coordinate == mapSegment.coordinte}){
                for pickup in pickups{
                    if pickup.coordinate == mapSegment.coordinte{
                        line.append(pickup.symbol)
                    }
                }
            }else{
                line.append(" ")
                line.append(mapSegment.symbol)
            }
            if mapSegment.coordinte.x == .x9{
                print(line)
                line = ""
            }
        }
        
    }
    
    
    private func createMap() -> [MapSegment]{
        var map: [MapSegment] = []
        
        for numberY in 0...4{
            for numberX in 0...9{
                let mapSegment = MapSegment(coordinte: Coordinate(x: Coordinate.getXCoordinate(by: numberX), y: Coordinate.getYCoordinate(by: numberY)))
                map.append(mapSegment)
            }
        }
        
        return map
    }
    
    
}
