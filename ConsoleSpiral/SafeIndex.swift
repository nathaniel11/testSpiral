//
//  SafeIndex.swift
//  ConsoleSpiral
//
//  Created by Alex Kernazhytski on 11/24/20.
//

import Foundation

extension Array {
    subscript (safe index: Index) -> Element? {
        get {
            return indices.contains(index) ? self[ index] : nil
        }
        set(newValue) {
            if let newValue = newValue, indices.contains(index) {
                self[index] = newValue
            }
        }
    }
}
