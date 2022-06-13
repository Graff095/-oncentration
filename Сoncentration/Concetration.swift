//
//  Concetration.swift
//  Сoncentration
//
//  Created by Visarg on 03.06.2022.
//

import Foundation
class Concentration {
    
    private (set) var  cards = [Card] ()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{ // вычесляется индекс ранее перевернутой карты
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp { // если у нас карта индексом  октрыта
                    if foundIndex == nil  { // и елси в найденом иднексе ничего нет
                        foundIndex = index // то передаем туда индекс карты
                    } else {
                        return nil // а если есть то удаляем
                    }
                }
                
            }
                
            return foundIndex // и возрошаем найденный индекс и пердаем ранее нажатой кнопки 
            
            
        }
        
        set{
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }  // ??????
            
            
            
        }
        
        
        
    }
    
    
    // indexOfOneAndOnlyFaceUpCard - индекс одной перевернутой карточки
    
    func choseCard (at index:Int) {
        
        if !cards[index].isMatched// если наша карта не является совпавшей то;
        {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index // если индекс нажатой и перевернутой ранее кнопки не совпадает то
            {
                if cards [matchingIndex].indentifier == cards [index].indentifier // если индивикаторы ранее нажатой и сейчас нажатой кнопки совподают то
                {
                    cards [matchingIndex].isMatched = true // ранее нажатая совпала
                    cards [index].isMatched = true // сейчас нажатая совпала
                }
                cards[index].isFaceUp = true // сейчас нажатая перевернут
                            //indexOfOneAndOnlyFaceUpCard = nil // а ранее нажатую удалить из переменной
            } else {
//                for flipDown in cards.indices {
//                    cards[flipDown].isFaceUp = false
//                    // перевернуть все карты лицом вниз
//                    
//                }
//                cards[index].isFaceUp = true // перевернут нажатую карточку
                indexOfOneAndOnlyFaceUpCard = index // ????
            }
            
        }
        
        
    }
    
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
