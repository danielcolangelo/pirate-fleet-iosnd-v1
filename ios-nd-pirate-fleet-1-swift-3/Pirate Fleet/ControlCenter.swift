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

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(_ human: Human) {
        // Write your code here!
        let smallShip = Ship(length: 2, location: GridLocation(x: 0, y: 5), isVertical: true)
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 1, y: 4), isVertical: false)
        let largeShip = Ship(length: 4, location: GridLocation(x: 5, y: 4), isVertical: true)
        let extraLageShip = Ship(length: 5, location: GridLocation(x: 7,y: 0), isVertical: true)
        let mine1 = Mine(location: GridLocation(x: 3, y: 0), explosionText: "A mine we hit!")
        let mine2 = Mine(location: GridLocation(x: 5, y: 3), explosionText: "Oh no! you hit a mine")
        human.addShipToGrid(smallShip)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(extraLageShip)
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
        
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        
        var finalScore: Int
        let maxShips = 5
        let enemyShipsSunk = maxShips - gameStats.enemyShipsRemaining
        let humanShipsRemaining = maxShips - gameStats.humanShipsSunk
        let numberOfGuesses = gameStats.numberOfMissesByHuman
        
        
        finalScore = (enemyShipsSunk * gameStats.sinkBonus) + (humanShipsRemaining * gameStats.shipBonus) - (numberOfGuesses * gameStats.guessPenalty)
        
        //finalScore = (enemyShipsSunk * sinkBonus) + (humanShipsRemaining * shipBonus) - (numberOfGuesses * guessPenalty)
        
        print("Your score is \(finalScore)")
        return finalScore
    }
}
