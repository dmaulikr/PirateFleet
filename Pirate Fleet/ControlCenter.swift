//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_{
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(_ human: Human) {
        let smallShip = Ship(length: 2, location: GridLocation(x: 3, y: 3), isVertical: true)
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 0, y: 1), isVertical: true)
        let largeShip = Ship(length: 4, location: GridLocation(x: 1, y:3), isVertical: true)
        let extraLargeShip = Ship(length: 5, location: GridLocation(x: 4, y:0), isVertical: true)
        
        human.addShipToGrid(smallShip)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(extraLargeShip)
        
        let mine1 = Mine(location: GridLocation(x: 5, y: 5), explosionText: "Mine1: Haha!")
        let mine2 = Mine(location: GridLocation(x: 2, y: 4), explosionText: "Mine2: Haha!")
        
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        let totalShipCount = 5
    

        var finalScore: Int
        
        // I am unsure of whether I am supposed to create separate variables for "numberOfGuesses" etc.
        // It would be better readable I think, but maybe this is not the scope of this project.
        finalScore = (totalShipCount - gameStats.enemyShipsRemaining) * gameStats.sinkBonus +
                     (totalShipCount - gameStats.humanShipsSunk) * gameStats.shipBonus -
                     (gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman) * gameStats.guessPenalty
    
        return finalScore
    }
}
