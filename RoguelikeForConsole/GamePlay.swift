//
//  gamePlay.swift
//  RoguelikeForConsole
//
//  Created by Ramil Salimov on 07.04.2020.
//  Copyright © 2020 Ramil Salimov. All rights reserved.
//

import Foundation

struct GamePlay {
    var engine = Engine()
    
    mutating func continueToPlay(){
        let isFinished = false
        engine.printMap()
        while !isFinished{
            let text = readLine()
            if let textCommand = text{
                readCommand(from: textCommand)
                engine.printMap()
            }
        }
    }
    
    mutating func readCommand(from text: String){
        switch text {
        case "a":
            for _ in 1...engine.player.speed{
                engine.player.coordinate.addOrMinusCoordinate(xNumber: -1, yNumber: 0)
                checkCollision()
            }
        case "d":
            for _ in 1...engine.player.speed{
                engine.player.coordinate.addOrMinusCoordinate(xNumber: 1, yNumber: 0)
                checkCollision()
            }
        case "w":
            for _ in 1...engine.player.speed{
                engine.player.coordinate.addOrMinusCoordinate(xNumber: 0, yNumber: -1)
                checkCollision()
            }
        case "s":
            for _ in 1...engine.player.speed{
                engine.player.coordinate.addOrMinusCoordinate(xNumber: 0, yNumber: 1)
                checkCollision()
            }
        default:
            print("unknown command")
        }
        
    }
    
    mutating func checkCollision(){
        for (index,pickup) in engine.pickups.enumerated(){
            if pickup.coordinate == engine.player.coordinate{
                switch pickup.type {
                case .speedUp:
                    engine.player.speed += 1
                }
                engine.pickups.remove(at: index)
            }
        }
    }
}
