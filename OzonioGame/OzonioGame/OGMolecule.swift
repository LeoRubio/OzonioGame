//
//  OGMolecule.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 26/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit


class OGMolecule: SKSpriteNode {
    init(){
        let texture = SKTexture(imageNamed: "BlackCircle")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        name = "MOLECULE"
        //        self.size.width *= 1.5
        //        self.size.height *= 1.5
        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 2)
        
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.applyForce(CGVector(dx: 0.0, dy: 10.0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
