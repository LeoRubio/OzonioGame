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
        
        self.destroyScore = 10
        
        self.name = "CARBONMOLECULE"
<<<<<<< HEAD
=======
        self.size.width *= 1.8
        self.size.height *= 1.8
>>>>>>> leoooo-branch

        self.size.width *= 1.2
        self.size.height *= 1.2
        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 1.5)
        self.physicsBody?.dynamic = true

        self.physicsBody?.mass = 0.01
        self.physicsBody?.usesPreciseCollisionDetection = true
        
        self.physicsBody!.categoryBitMask = CollisionCategoryMolecules
        self.physicsBody!.collisionBitMask = 0

    }
    
    override func mitosis(){
        //NÃO SE DIVIDE!
    }
    
    override func update() {
        
        var childXPosition = self.position.x + self.parent!.position.x
        var childYPosition = self.position.y + self.parent!.position.y
        //self.physicsBody!.applyImpulse(CGVectorMake(1.0, 1.0))

<<<<<<< HEAD
=======
        self.physicsBody!.applyForce(CGVectorMake(0.0, 0.6))
>>>>>>> leoooo-branch

        self.physicsBody!.applyForce(CGVectorMake(0.0, 0.3))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
