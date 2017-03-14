//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Chris Leung on 3/13/17.
//  Copyright © 2017 Chris Leung. All rights reserved.
//

import UIKit

class MakeMoveViewController: UIViewController {

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
        
        switch playerMove {
        case .paper:
            // Present GameResult viewcontroller in all code
            var controller:GameResultViewController
            controller = self.storyboard?.instantiateViewController(withIdentifier: "GameResultViewController") as! GameResultViewController
            break
        case .rock:
            // Present GameResult viewcontroller via segue by identifier
            break
        case .scissors:
            // Present GameResult viewcontroller via automatically triggered segue
            break
        default: break
        }
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

