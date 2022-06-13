//
//  ViewController.swift
//  Сoncentration
//
//  Created by Visarg on 29.05.2022.
//

import UIKit

class ViewController: UIViewController {

   private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
     // экземляр класса для того чтобы viewcontroler мог общаться с моделью
     //numberOfPairsOfCards: cardButtons.count/2 добавили разделив количесток кнопок на два карточки
    // private - чтоб не кто не мог меняет количество праных кнопок
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1)/2
        // создали отделную переменую что бы легко вычеслин количество панных карточекff
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet weak private var FlipsLabel: UILabel!
   
    
    
    private (set) var flipCard = 0{
        didSet{
            FlipsLabel.text = "Flips: \(flipCard)"
        }
    } // private (set)  - чтоб не кто не мог дать новое значение этой переменной
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    private var emojiDictoanary = [Int:String] ()
    
    private var emojiChoises: [String] = ["🐻","🦁","🐔","🐧","🐸","🐓","🦝","🐓"]
    // колекция аутлетов сделана для того  чтоб не создовать для каждой кномки одельный аутлет
    //emojiChoises - массив эмоджи чтоб дать каждой кнопки тайтлы
    
    private func emojiIndentifeir (for card: Card) ->String{
       
        if emojiDictoanary[card.indentifier] == nil{ // если в эмодзиДикшаране нет эмоджи по индефекатору карты то
            let randomIndex = Int(arc4random_uniform (UInt32(emojiChoises.count))) // создаем переменую рандомным значением из эмодзиКолекции
            emojiDictoanary[card.indentifier] = emojiChoises.remove(at: randomIndex) // добавляем эмодзи согласно это индификатоку
        }
        
        return emojiDictoanary[card.indentifier] ?? "?" // если эмодзиДикшарены не пустой то возрошаем его а если пустокй то впоросительный знак возрошаем
    }
    
   
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        flipCard += 1
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.choseCard(at: cardNumber) // передаем индекс карты в модель Concentration чтоб  запустить алгоритм
            upDateVIewFromModel ()
    } else {
        print ("Нет такой карточки")
    }
    
    }
    
    private  func upDateVIewFromModel(){
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
    
    

