//
//  ThrowingTests.swift
//  FirstUnitTestingAppTests
//
//  Created by YILDIRIM on 7.06.2023.
//

import XCTest
enum GameError:Error {
case notPurchased
    case notInstalled
    case parentalControlsDisallowed
}

struct Game {
    let name: String

    func play() throws {
        if name == "BioBlitz" {
            throw GameError.notPurchased
        } else if name == "Blastazap" {
            throw GameError.notInstalled
        } else if name == "Dead Storm Rising" {
            throw GameError.parentalControlsDisallowed
        } else {
            print("\(name) is OK to play!")
        }
    }
}

final class ThrowingTests: XCTestCase {

    func testPlayingBlastazapThrows() {
        let game = Game(name: "Blastazap")
        
        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError, GameError.notInstalled)
        }
    }
    func testPlayingExplodingMonkeysDoesntThrow() {
        let game = Game(name: "Exploding Monkeys")
        XCTAssertNoThrow(try game.play())
    }
    func testCrashyPlaneDoesntThrow()  {
        let game = Game(name: "CrashyPlane")
        XCTAssertNoThrow(try game.play())
    }
}
