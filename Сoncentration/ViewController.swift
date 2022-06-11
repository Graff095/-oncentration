//
//  ViewController.swift
//  Сoncentration
//
//  Created by Visarg on 29.05.2022.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
     // экземляр класса для того чтобы viewcontroler мог общаться с моделью
     //numberOfPairsOfCards: cardButtons.count/2 добавили разделив количесток кнопок на два карточки
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var FlipsLabel: UILabel!
   
    
    var flipCard = 0{
        didSet{
            FlipsLabel.text = "Flips: \(flipCard)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


var emojiChoises: [String] = ["🦁","🐻","🦁","🐻" ]
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
    flipCard += 1
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.choseCard(at: cardNumber) // передаем индекс карты в модель Concentration чтоб  запустить алгоритм
            upDateVIewFromModel ()
    } else {
        print ("Нет такой карточки")
    }
    
    }
    
    func upDateVIewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index] // передали индекс кнопки
            let cards = game.cards[index] // передали индексы карт
            if cards.isFaceUp {button.setTitle(emojiIndentifeir(for: cards), for: .normal)
                button.backgroundColor = .systemBackground
                
            } // если карта перевернутая то меняем цвет на белый и тсавим эмодзи
            else {button.setTitle("", for: .normal)
                button.backgroundColor = cards.isMatched ? .black : .systemOrange
                // если карты совпали фон станет черным если нет то оранживым
                
            } // если карта  не перевернутая то ставим оранживый цвет
        }
                
    }// обвновлении экрана после нажатия
    
    
    
    
    
    
//    func flipCard (wihtEmoji emoji: String, on button:UIButton){
//        if button.currentTitle == emoji{
//            button.setTitle("", for: .normal)
//            button.backgroundColor = .systemOrange
//        } else {
//            button.setTitle(emoji, for: .normal)
//            button.backgroundColor = .systemBackground
//        }
//    }
    


}
    
    

