//
//  Shape.swift
//  Tetris
//
//  Created by Nathan Krishnan on 8/10/14.
//  Copyright (c) 2014 Nathan Krishnan. All rights reserved.
//

import SpriteKit

let NumOrientations: UInt32 = 4

// Enumeration helper to define the shape's orientation
// A Tetromino piece can face in one of four directions at any time (0, 90, 180, 270)
enum Orientation: Int, Printable {
    case Zero = 0, Ninety, OneEighty, TwoSeventy
    
    var description: String {
        switch self {
            case .Zero:
                return "0"
            case .Ninety:
                return "90"
            case .OneEighty:
                return "180"
            case .TwoSeventy:
                return "270"
        }
    }
    
    static func random() -> Orientation {
        return Orientation.fromRaw(Int(arc4random_uniform(NumOrientations)))!
    }
    
    // Method capable of returning the next orientation when traveling either clockwise or counterclockwise
    
    static func rotate(orientation:Orientation, clockwise: Bool) -> Orientation {
        var rotated = orientation.toRaw() + (clockwise ? 1 : -1)
        if rotated > Orientation.TwoSeventy.toRaw() {
            rotated = Orientation.Zero.toRaw()
        } else if rotated < 0 {
            rotated = Orientation.TwoSeventy.toRaw()
        }
        return Orientation.fromRaw(rotated)!
    }
    
}
