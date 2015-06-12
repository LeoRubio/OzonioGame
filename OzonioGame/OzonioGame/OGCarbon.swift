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
        
        self.scoreGiven = 10
        
        self.name = "CARBONMOLECULE"

        self.size.width *= 1.8
        self.size.height *= 1.8

        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 5.0)
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

<<<<<<< HEAD
<<<<<<< HEAD
        self.physicsBody!.applyForce(CGVectorMake(0.0, 0.3))
=======
<<<<<<< HEAD
        self.physicsBody!.applyForce(CGVectorMake(0.0, 0.4))
=======
>>>>>>> master

<<<<<<< HEAD
        self.physicsBody!.applyForce(CGVectorMake(0.0, 0.3))
<<<<<<< HEAD
>>>>>>> PedroBranch
>>>>>>> master
=======
>>>>>>> master
=======
        self.physicsBody!.applyForce(CGVectorMake(0.0, 0.6))

>>>>>>> master
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
