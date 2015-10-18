//
//  CSVRow.swift
//  CSVKit
//
//  Created by Jack Wilsdon on 17/10/2015.
//  Copyright © 2015 Jack Wilsdon. All rights reserved.
//

import Foundation

public func ==(lhs: CSVRow, rhs: CSVRow) -> Bool {
    return (lhs.row == nil && rhs.row == nil) || lhs.row! == rhs.row!
}

public class CSVRow: Equatable {
    public let headings: [String]?
    public let values: [CSVValue]?
    public let row: [String: CSVValue]?

    public let valid: Bool

    public init(_ csvRow: [String: CSVValue]) {
        headings = Array(csvRow.keys)
        values = Array(csvRow.values)
        row = csvRow
        valid = true
    }

    public init() {
        headings = nil
        values = nil
        row = nil
        valid = false
    }

    public func asRowObject<T: CSVRowObject>(type: T.Type) -> T {
        return T(self)
    }

    public subscript(index: String) -> CSVValue {
        if !valid {
            return CSVValue()
        }

        if let value = row![index] {
            return value
        }

        return CSVValue()
    }
}
