//
//  OGCarbon.swift
//  OzonioGame
//
//  Created by Victor D. Savariego on 28/5/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGCarbon : OGMolecule {
    

    
    init(){

        super.init(imageNamed: "carbon")
        
        self.lifeMax = 1
        
        self.name = "CARBONMOLECULE"
        self.size.width *= 1.2
        self.size.height *= 1.2
        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 1.5)
        self.physicsBody?.dynamic = true
<<<<<<< HEAD
        self.physicsBody!.mass = 0.2
=======
        self.physicsBody?.mass = 0.01
        self.physicsBody?.usesPreciseCollisionDetection = true
>>>>>>> leoooo-branch
        
        self.physicsBody!.categoryBitMask = CollisionCategoryMolecules
        self.physicsBody!.collisionBitMask = 0

    }
    
    
    override func update() {
        
        var childXPosition = self.position.x + self.parent!.position.x
        var childYPosition = self.position.y + self.parent!.position.y
        //self.physicsBody!.applyImpulse(CGVectorMake(1.0, 1.0))
<<<<<<< HEAD
        self.physicsBody!.applyForce(CGVectorMake(1.0, 12.0))
=======
        self.physicsBody!.applyForce(CGVectorMake(0.0, 0.3))
>>>>>>> leoooo-branch
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
