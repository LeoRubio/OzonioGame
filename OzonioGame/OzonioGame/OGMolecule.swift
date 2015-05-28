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
                self.size.width *= 0.5
                self.size.height *= 0.5
        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 2)

    }
    
    func update(){
        var childXPosition = self.position.x + self.parent!.position.x
        var childYPosition = self.position.y + self.parent!.position.y
       // self.physicsBody!.applyImpulse(CGVectorMake(0.0, 1.0))
        self.physicsBody!.applyForce(CGVectorMake(1.0, 1.0))
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
