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
        
        switch playerMove {
        case "paper":
            // Present GameResult viewcontroller in all code as per requirements
            var controller:GameResultViewController
            controller = self.storyboard?.instantiateViewController(withIdentifier: "GameResultViewController") as! GameResultViewController
            let (compMove,result,resultImage) = playGame(playerMove)
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
            // Present GameResult viewcontroller via segue by identifier as per requirements
            performSegue(withIdentifier: "hitRock", sender: self)
            break
        case "scissors":
            // Present GameResult viewcontroller via automatically triggered segue as per requirements
            break
        default: break
        }
    }

    func playGame(_ playerMove:String) -> (String,String,String) {
        let compMove = moves[Int(arc4random() % 3)]
        let (result,resultImage) = returnResultAndImage(playerMove, compMove)
        print("Result: \(result). Player: \(playerMove), Computer: \(compMove)")
        return (compMove,result,resultImage)
        
    }
    
    func returnResultAndImage (_ playerMove:String, _ compMove:String) -> (String,String) {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var playerMove:String
        if segue.identifier == "hitRock" {
            playerMove = "rock"
        } else { // Will be scissors
            playerMove = "scissors"
        }
        
        let controller = segue.destination as! GameResultViewController
        let (compMove,result,resultImage) = playGame(playerMove)
        controller.resultLabelText = result
        controller.resultImageName = resultImage
        controller.playerImageName = playerMove
        controller.compImageName = compMove
    }
}

