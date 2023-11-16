//
//  Animaluwu.swift
//  MemoriApp
//
//  Created by Miguel Lezama on 14/11/23.
//

import Foundation

struct Animaluwu: Identifiable, Hashable, Equatable{
    var nombre: String
    var id: UUID = .init()
}

extension Array where Element == Animaluwu{
    static let animales:[Animaluwu] = [
        .init(nombre: "gato"),
        .init(nombre: "perro"),
        .init(nombre: "vaca"),
        .init(nombre: "leon"),
        .init(nombre: "tigre"),
        .init(nombre: "pato"),
        .init(nombre: "foca"),
        .init(nombre: "rana"),
        .init(nombre: "delfin"),
        .init(nombre: "borrego")
    ]
}

extension Array {
    subscript (randomPick n: Int) -> [Element] {
        var copy = self
        for i in stride(from: count - 1, to: count - n - 1, by: -1) {
            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }
        return Array(copy.suffix(n))
    }
}
