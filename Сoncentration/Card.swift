//
//  Card.swift
//  Сoncentration
//
//  Created by Visarg on 03.06.2022.
//

import Foundation

struct Card {
    struct Card {
        
        var isFaceUp = false
        var isMatched = false
        var indentifier: Int
        static var identifierNumber = 0
         static func identifierGenerator () -> Int {
             identifierNumber += 1
             return identifierNumber
         }
         // static - это означает что данная функ или переменая не пренадленит классу и мы можем использовать данную функ или перем без иницелизации
         init () {
             self.indentifier = Card.identifierGenerator()
         }
         // испол инит перейдаем значение
     }

}
