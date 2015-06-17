//
//  GameViewController.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 21/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var scene: MenuScene!
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. Configure the main view
        let skView = view as! SKView
        //skView.showsFPS = true
        //skView.showsPhysics = true
        //skView.showsNodeCount = true
        
        // 2. Create and configure our game scene
        scene = MenuScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        // 3. Show the scene.
        skView.presentScene(scene)
    }
}
