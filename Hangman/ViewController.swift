//
//  ViewController.swift
//  Hangman
//
//  Created by Hazen on 4/11/15.
//  Copyright (c) 2015 Hazen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pickedButtons = [UIButton]()
    let stagePictures = [
        UIImage(named: "gallows"),
        UIImage(named: "head"),
        UIImage(named: "body"),
        UIImage(named: "left-arm"),
        UIImage(named: "right-arm"),
        UIImage(named: "left-leg"),
        UIImage(named: "right-leg"),
        UIImage(named: "hands"),
        UIImage(named: "feet")
    ]
    var stage = 0
    
    @IBOutlet weak var gallows: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePicture(0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updatePicture(newStage: Int) {
        stage = newStage
        gallows.image = stagePictures[stage]
    }
    
    @IBAction func letterPushed(sender: UIButton) {
        println("User pushed " + sender.currentTitle!)
        sender.enabled = false
        pickedButtons.append(sender)
        if stage < stagePictures.count - 1 {
            updatePicture(stage + 1)
        }
        //This function responds to buttons pushed
    }
    
    @IBAction func newGame(sender: UIButton) {
        println("New game")
        for i in pickedButtons{
            i.enabled = true
        }
        pickedButtons = []
        updatePicture(0)
        //this starts a new game
    }
}

