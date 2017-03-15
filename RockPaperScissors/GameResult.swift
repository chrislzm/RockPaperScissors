//
//  GameResult.swift
//  RockPaperScissors
//
//  Created by Chris Leung on 3/13/17.
//  Copyright © 2017 Chris Leung. All rights reserved.
//

import UIKit

class GameResultViewController: UIViewController {

    @IBOutlet var resultLabel:UILabel!
    @IBOutlet var resultImageView:UIImageView!
    @IBOutlet var playerImageView:UIImageView!
    @IBOutlet var compImageView:UIImageView!
    
    var resultLabelText:String?
    var resultImageName:String?
    var playerImageName:String?
    var compImageName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = resultLabelText
        resultImageView.image = UIImage(named: resultImageName!)
        playerImageView.image = UIImage(named: playerImageName!)
        compImageView.image = UIImage(named: compImageName!)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /**
     *    dismiss this view controller
     */
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }

}
