//
//  ViewController.swift
//  EnumSample
//
//  Created by Rayan Sequeira on 15/02/18.
//  Copyright © 2018 Rayan Sequeira. All rights reserved.
//

import UIKit

enum Character {
    enum Weapon {
        case Bow
        case Sword
        case Lance
        case Dagger
    }
    enum Helmet {
        case Wooden
        case Iron
        case Diamond
    }
    case Thief
    case Warrior
    case Knight
}

enum State: String {
    case North
    case South
    case West
    case East
}

enum Movement: Int {
    case Left = 1
    case Right = 2
    case Up = 3
    case down = 4
}

enum Trades {
    case Buy(String, Int, Float)
    case Sell(stock: String, amount: Int, stockPrice: Float)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let character: Character = .Warrior
        let weapon: Character.Weapon = .Bow
        
        let movement: Movement = .Left
        
        let aTrade = Trades.Buy("APPL", 200, 115.5)
        if case let Trades.Buy(stock, amount, price) = aTrade {
            print("buy \(amount) of \(stock)")
        } else if case let Trades.Sell(stock, amount, price) = aTrade {
            print("sell \(amount) of \(stock)")
        }
        
        switch aTrade {
        case .Buy(let stock, let amount, _):
            process(stock, amount)
        case .Sell(let stock, let amount, _):
            process(stock, amount * -1)
        }
        
        let bTP = ("BPL", 200, 115.5)
        let bTrade = Trades.Buy(bTP)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func process(_ stock: String, _ amount: Int) {
        print ("\(amount) of \(stock)")
    }

}

