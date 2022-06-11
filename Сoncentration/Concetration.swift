//
//  Concetration.swift
//  Сoncentration
//
//  Created by Visarg on 03.06.2022.
//

import Foundation
class Concentration {
    
    var  cards = [Card] ()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    // indexOfOneAndOnlyFaceUpCard - индекс одной перевернутой карточки
    
    
    
    init (numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
           //  cards += [card,card] // второй вариант
        }
    }
    //numberOfPairsOfCards - колчПарныхКарточек
    // пройти по парным карточкам и добавить сразу эту карту в масив cards
}
