//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Chris Leung on 3/13/17.
//  Copyright © 2017 Chris Leung. All rights reserved.
//

import UIKit

class MakeMove: UIViewController {

    enum RockPaperScissorMove: Int {
        case rock = 0, paper, scissors
    }
    
    enum Winner: Int {
        case player = 0, computer, tie
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func moveMade(_ sender:AnyObject) {
        let button = sender as! UIButton
        
        let playerMove = RockPaperScissorMove.init(rawValue: button.tag)!
        let compMove = RockPaperScissorMove.init(rawValue: Int(arc4random() % 3))!
        
        let result = returnWinner(playerMove, compMove)
        print("Result: \(result). Player: \(playerMove), Computer: \(compMove)")
    }

    func returnWinner (_ playerMove:RockPaperScissorMove, _ compMove:RockPaperScissorMove) -> Winner {
        if (playerMove == .rock && compMove == .scissors || playerMove == .scissors && compMove == .paper || playerMove == .paper && compMove == .rock) {
            return Winner.player
        } else if (compMove == .rock && playerMove == .scissors || compMove == .scissors && playerMove == .paper || compMove == .paper && playerMove == .rock) {
            return Winner.computer
        } else {
            return Winner.tie
        }
    }
}

