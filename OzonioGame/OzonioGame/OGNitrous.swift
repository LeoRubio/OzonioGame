//
//  OGNitrous.swift
//  OzonioGame
//
//  Created by Victor D. Savariego on 28/5/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGNitrous: OGMolecule {
    
    
    init(){
        
        super.init(imageNamed: "nitrous")
        
        self.lifeMax = 2
        
        self.scoreGiven = 40
        
        self.name = "NITROUSMOLECULE"
        
        self.size.width *= 2.2
        self.size.height *= 2.2

        
        
    }
    
    override func mitosis(){
        
        var auxX:CGFloat = 0.0
        
        for(var i = -1; i < 2; i+=2){
            let divideMolecule = OGCarbon()
            
            auxX = CGFloat(i*70)
            
            divideMolecule.position = CGPointMake(self.position.x + auxX, self.position.y)
            self.parent!.addChild(divideMolecule)
        }
        
        self.size.width *= 1.5
        self.size.height *= 1.5
        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 1.5)
        self.physicsBody?.dynamic = true

        self.physicsBody?.mass = 0.01
        self.physicsBody?.usesPreciseCollisionDetection = true
        
        self.physicsBody!.categoryBitMask = CollisionCategoryMolecules
        self.physicsBody!.collisionBitMask = 0
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> PedroBranch
>>>>>>> master
=======
>>>>>>> master

        
    }
    
    override func update() {
        var childXPosition = self.position.x + self.parent!.position.x
        var childYPosition = self.position.y + self.parent!.position.y

        self.physicsBody!.applyForce(CGVectorMake(0.0, 0.8))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
