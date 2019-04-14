//
//  Array2D.swift
//  crosswordPuzzle
//
//  Created by Shalise Ayromloo on 4/9/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import Foundation

open class Array2D<T> {
    
    open var columns: Int
    open var rows: Int
    open var matrix: [T]
    
    public init(columns: Int, rows: Int, defaultValue: T) {
        self.columns = columns
        self.rows = rows
        matrix = Array(repeating: defaultValue, count: columns * rows)
    } //closes init
    
    open subscript(column: Int, row: Int) -> T {
        get {
            return matrix[columns * row + column]
        } //closes get
        set {
            matrix[columns * row + column] = newValue
        } //closes set
    } //closes subscript
    
    open func columnCount() -> Int {
        return self.columns
    } //closes func
    
    open func rowCount() -> Int {
        return self.rows
    } //closes func
} //closes class
