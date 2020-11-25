//
//  main.swift
//  ConsoleSpiral
//
//  Created by Alex Kernazhytski on 11/24/20.
//

import Foundation
//параметры спирали задаются в коде, без проверки "на дурака"
let maxCoord = 100
var outputMatrix = Array(repeating: Array(repeating: 0, count: maxCoord), count: maxCoord)
let n = 7 // кол-во витков
var outputString = ""
let a1: Double = 2 // радиус самого маленького витка
let af: Double = 50 // радиус самого большого витка
let thick: Double = 2 // толщина линии
let distance = (af - a1) / Double(n)
let gap = distance - thick
let b2 = distance / (2 * Double.pi)

for i in 0..<n * 360 {
    guard let x = closestCut((a1 + b2 * Double(i) * Double.pi / Double(180)) * cos(degrees: Double(i))),
          let y = closestCut((a1 + b2 * Double(i) * Double.pi / Double(180)) * sin(degrees: Double(i))) else { continue }
    let corrX = x + maxCoord / 2
    let corrY = y + maxCoord / 2
    outputMatrix[safe: corrX]?[safe: corrY] = 1
    for k in 1..<Int(thick) {
        let x1 = corrX - k
        let x2 = corrX + k
        let y1 = corrY - k
        let y2 = corrY + k
        outputMatrix[safe: x1]?[safe: corrY] = 1
        outputMatrix[safe: corrX]?[safe: y1] = 1
        outputMatrix[safe: x2]?[safe: corrY] = 1
        outputMatrix[safe: corrX]?[safe: y2] = 1
    }
}
for i in 0..<maxCoord {
    for j in 0..<maxCoord {
        if outputMatrix[i][j] == 1 { outputString += "*" }
        else { outputString += " " }
    }
    outputString += "\n"
}
print(outputString)

func closestCut(_ value: Double) -> Int? {
    let gap: Double = 0.5
    if abs(value.rounded() - value) < gap {
        return Int(value.rounded())
    }
    return nil
}

func sin(degrees: Double) -> Double {
    return __sinpi(degrees/180.0)
}

func cos(degrees: Double) -> Double {
    return __cospi(degrees/180.0)
}
