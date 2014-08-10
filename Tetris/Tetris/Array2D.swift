//
//  Array2D.swift
//  Tetris
//
//  Created by Nathan Krishnan on 8/10/14.
//  Copyright (c) 2014 Nathan Krishnan. All rights reserved.
//

/* 

We need an array class because generic arrays in Swift are of type
struct, not class.  We need a class in this case since class objects
are passed by reference whereas structs are passed by value (copied)

*/
class Array2D<T> {
    let columns: Int
    let rows: Int
    
    /* 
    
    Declare an actual Swift array; It will be the underlying data structure that
    maintains references to the objects
    
    */
    var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        
        // Instantiate internal array structure with a size of rows * columns.
        // This guarantees that Array2D can store 200 objects
        array = Array<T?>(count:rows * columns, repeatedValue: nil)
    }
    
    // #4
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[(row * columns) + column]
        }
        set(newValue) {
            array[(row * columns) + column] = newValue
        }
    }
}