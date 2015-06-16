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

        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 3.0)
        self.physicsBody?.dynamic = true
        
        self.physicsBody?.mass = 0.01
        self.physicsBody?.usesPreciseCollisionDetection = true
        
        self.physicsBody!.categoryBitMask = CollisionCategoryMolecules
        self.physicsBody!.collisionBitMask = 0
        
        
    }
    
    override func mitosis(){
        
        var auxX:CGFloat = 0.0
        
        for(var i = 0; i < 2; i++){
            let divideMolecule = OGCarbon()
            
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

        self.physicsBody!.applyForce(CGVectorMake(0.0, 0.8))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
