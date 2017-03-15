//
//  GameResult.swift
//  RockPaperScissors
//
//  Created by Chris Leung on 3/13/17.
//  Copyright © 2017 Chris Leung. All rights reserved.
//

import UIKit

class GameResultViewController: UIViewController {

    // Label and ImageViews
    @IBOutlet var resultLabel:UILabel!
    @IBOutlet var resultImageView:UIImageView!
    @IBOutlet var playerImageView:UIImageView!
    @IBOutlet var compImageView:UIImageView!
    
    // Stores data used for respective Label and ImageView
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

    /**
     *    dismiss this view controller
     */
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }

}
