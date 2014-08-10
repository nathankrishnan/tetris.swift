//
//  GameScene.swift
//  Tetris
//
//  Created by Nathan Krishnan on 8/10/14.
//  Copyright (c) 2014 Nathan Krishnan. All rights reserved.
//

import SpriteKit

// Represents the slowest speed at which the tetris blocks will travel
let TickLengthLevelOne = NSTimeInterval(600)

class GameScene: SKScene {
    
    // Defining closure and variables
    var tick:(() -> ())?
    var tickLengthMillis = TickLengthLevelOne
    var lastTick:NSDate?
    
    required init(coder aDecoder: NSCoder!) {
        fatalError("NSCoder not supported")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0, y: 1.0)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y: 1.0)
        addChild(background)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        // If lastTick is missing, we are in a paused state
        // However, if present invoke timeIntervalSinceNow
        if lastTick == nil {
            return
        }
        // Multiply result by -1000 to get positive millisecond value
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.0
        if timePassed > tickLengthMillis {
            lastTick = NSDate.date()
            tick?()
        }
    }
    
    // Accessor methos to let external classes stop and start the ticking process
    func startTicking() {
        lastTick = NSDate.date()
    }
    
    func stopTicking() {
        lastTick = nil
    }
}
