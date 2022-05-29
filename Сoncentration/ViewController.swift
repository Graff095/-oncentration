//
//  ViewController.swift
//  Сoncentration
//
//  Created by Visarg on 29.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var csrdButtons: [UIButton]!
    
    var flipCard = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


var emojiChoises: [String] = ["🦁","🐻","🦁","🐻" ]
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
    flipCard += 1
    }
    
    
}

