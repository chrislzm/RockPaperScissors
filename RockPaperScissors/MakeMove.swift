//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Chris Leung on 3/13/17.
//  Copyright © 2017 Chris Leung. All rights reserved.
//

import UIKit

class MakeMoveViewController: UIViewController {

    let moves = ["rock","paper","scissors"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func moveMade(_ sender:AnyObject) {
        let button = sender as! UIButton
        
        let playerMove = moves[button.tag]
        let compMove = moves[Int(arc4random() % 3)]
        let (result,resultImage) = returnWinner(playerMove, compMove)
        
        print("Result: \(result). Player: \(playerMove), Computer: \(compMove)")
        
        switch playerMove {
        case "paper":
            // Present GameResult viewcontroller in all code
            var controller:GameResultViewController
            controller = self.storyboard?.instantiateViewController(withIdentifier: "GameResultViewController") as! GameResultViewController
            controller.resultLabelText = result
            controller.resultImageName = resultImage
            controller.playerImageName = playerMove
            controller.compImageName = compMove
            
            print("resultLabelText set as: \(controller.resultLabelText)")
            print("resultImageName set as: \(controller.resultImageName)")
            print("playerImageName set as: \(controller.playerImageName)")
            print("compImageName set as: \(controller.compImageName)")
            self.present(controller, animated: true, completion: nil)
        case "rock":
            // Present GameResult viewcontroller via segue by identifier
            break
        case "scissors":
            // Present GameResult viewcontroller via automatically triggered segue
            break
        default: break
        }
    }

    func returnWinner (_ playerMove:String, _ compMove:String) -> (String,String) {
    if playerMove == "rock" && compMove == "scissors" {
        return ("Player","RockCrushesScissors")
    } else if playerMove == "scissors" && compMove == "paper" {
        return ("Player","ScissorsCutPaper")
    } else if playerMove == "paper" && compMove == "rock" {
            return ("Player","PaperCoversRock")
    } else if compMove == "rock" && playerMove == "scissors" {
        return ("Computer","RockCrushesScissors")
    } else if compMove == "scissors" && playerMove == "paper" {
        return ("Computer","ScissorsCutPaper")
    } else if compMove == "paper" && playerMove == "rock" {
        return ("Computer","PaperCoversRock")
    } else {
        return ("Tie","itsATie")
        }
    }
}

