//
//  Block.swift
//  Tetris
//
//  Created by Nathan Krishnan on 8/10/14.
//  Copyright (c) 2014 Nathan Krishnan. All rights reserved.
//

import SpriteKit

// Define precisely that we want to use 6 colors for the blocks
let NumberOfColors: UInt32 = 6

// Declare the enumeration; It is of type Int and implements the Printable protocol
enum BlockColor: Int, Printable {
    // Full list of enumerable options, one for each color
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    // Computed property using switch-case statements
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }
    // Computed property description
    var description: String {
        return self.spriteName
    }
    
    // Returns a random choice of colors found in BlockColor
    static func random() -> BlockColor {
        return BlockColor.fromRaw(Int(arc4random_uniform(NumberOfColors)))!
    }
}

// Declared as a "Hashable" block so that it can be stored in 2D Array
class Block: Hashable, Printable {
    // Define color property
    // Constant because a block should not be able to change colors once assigned one
    let color: BlockColor
    
    // Declare Column and Row
    // These properties represent the location of the "Block" on the game board
    // SKSpriteNode will represent the visual element of the "Block" used by the GameScene when rendering and animating each "Block"
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    // Convenient shortcut for recovering the file name of the sprite to be used when displaying the "Block"
    var spriteName: String {
        return color.spriteName
    }
    
    // Implemented this calculated property which is required to support the Hashable protocol
    // We return the XOR of our row and column property to generate a unique integer for each Block
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    // Implement the description in order to comply with the Printable protocl
    // Printing a Block will result in "blue:[8,3]"
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column:Int, row:Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}


// Creating a custom operator when comparing one Block with another.
// It returns true if both Blocks are in the same location and of the same color
// This operator is required in order to support the Hashable protocol
func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.toRaw() == rhs.color.toRaw()
}