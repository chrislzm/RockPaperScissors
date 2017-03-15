//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Chris Leung on 3/13/17.
//  Copyright © 2017 Chris Leung. All rights reserved.
//

import UIKit

class MakeMoveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playPaper(_ sender:AnyObject) {
        let playerMove = "paper"
        
        // Present GameResult viewcontroller in all code as per requirements
        var controller:GameResultViewController
        controller = self.storyboard?.instantiateViewController(withIdentifier: "GameResultViewController") as! GameResultViewController
        playGamePushResults(playerMove,controller)
        self.present(controller, animated: true, completion: nil)
    }

    @IBAction func playRock(_ sender:AnyObject) {
        performSegue(withIdentifier: "playRock", sender: self)
    }

    func playGamePushResults(_ playerMove:String,_ controller:GameResultViewController) {
        let moves = ["rock","paper","scissors"]
        let compMove = moves[Int(arc4random() % 3)]
        let (result,resultImage) = returnResultAndImage(playerMove, compMove)
        controller.resultLabelText = result
        controller.resultImageName = resultImage
        controller.playerImageName = playerMove
        controller.compImageName = compMove
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
    
    // Will only be called if player hits rock or scissors buttons
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var playerMove:String
        
        if segue.identifier == "playRock" {
            playerMove = "rock"
        } else { // Will be scissors
            playerMove = "scissors"
        }
        
        let controller = segue.destination as! GameResultViewController
        playGamePushResults(playerMove,controller)
    }
}

