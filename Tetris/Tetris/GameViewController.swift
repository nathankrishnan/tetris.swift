//
//  GameViewController.swift
//  Tetris
//
//  Created by Nathan Krishnan on 8/10/14.
//  Copyright (c) 2014 Nathan Krishnan. All rights reserved.
//

import UIKit
import SpriteKit

// non-optional value which will eventually be instantiated
var scene: GameScene!

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view
        let skView = view as SKView
        skView.multipleTouchEnabled = false
        
        // Create and configure the scene
        var scene: GameScene!
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        // Present the scene
        skView.presentScene(scene)

    }






    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
