//
//  OGNitric.swift
//  OzonioGame
//
//  Created by Victor D. Savariego on 28/5/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGNitric: OGMolecule {

    
    init(){
        
        super.init(imageNamed: "nitric")
        
        self.lifeMax = 3
        
        self.name = "NITRICMOLECULE"
        
        self.size.width *= 1.9
        self.size.height *= 1.9

        

        
    }
    
    override func mitosis(){
        
        var auxX:CGFloat = 0.0
        
        for(var i = 0; i < 2; i++){
            let divideMolecule = OGNitrous()
            
            auxX = CGFloat(i*40)
            
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
        
    }
    
    override func update() {
        var childXPosition = self.position.x + self.parent!.position.x
        var childYPosition = self.position.y + self.parent!.position.y
        //self.physicsBody!.applyImpulse(CGVectorMake(1.0, 1.0))

        self.physicsBody!.applyForce(CGVectorMake(0.0, 0.2))

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
