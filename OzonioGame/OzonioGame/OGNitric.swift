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
        
        self.scoreGiven = 80
        
        self.name = "NITRICMOLECULE"
        
        self.size.width *= 0.11
        self.size.height *= 0.11
 
        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 6.0)
        self.physicsBody?.dynamic = true
        
        self.physicsBody?.mass = 0.01
        self.physicsBody?.usesPreciseCollisionDetection = true
        
        self.physicsBody!.categoryBitMask = CollisionCategoryMolecules
        self.physicsBody!.collisionBitMask = 0
        

        
    }
    
    override func mitosis(){
        
        var auxX:CGFloat = 0.0
        
        for(var i = 0; i < 2; i++){
            
            let divideMolecule = OGNitrous()
            
            //Se for a primeira molecula, cria pro lado oposto
            if i == 0{
                i * -1
            }
            
            auxX = CGFloat(i*90)
            
            divideMolecule.position = CGPointMake(self.position.x + auxX, self.position.y)
            
            
            self.parent!.addChild(divideMolecule)
        }
        

        
    }
    
    override func update() {
        var childXPosition = self.position.x + self.parent!.position.x
        var childYPosition = self.position.y + self.parent!.position.y

        self.physicsBody!.applyForce(CGVectorMake(0.0, 1.0))

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
