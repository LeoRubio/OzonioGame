//
//  OGOzone.swift
//  OzonioGame
//
//  Created by Victor D. Savariego on 11/6/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

// MOLECULA QUE CURA CAMADA DE OZONIO!

class OGOzone: OGMolecule {
    init(){
        
        super.init(imageNamed: "ozone")
        
        self.lifeMax = 1
        
        self.scoreGiven = -500
        
        self.name = "OZONEMOLECULE"
        
        self.size.width *= 0.09
        self.size.height *= 0.09
        
        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 4.0)
        self.physicsBody?.dynamic = true
        
        self.physicsBody?.mass = 0.01
        self.physicsBody?.usesPreciseCollisionDetection = true
        
        self.physicsBody!.categoryBitMask = CollisionCategoryMolecules
        self.physicsBody!.collisionBitMask = 0
        
        
        
    }
    
    override func mitosis(){
        
        var auxX:CGFloat = 0.0
        var auxY:CGFloat = 0.0
        
        for(var i = 0; i < 15; i++){
            
            let divideMolecule = OGNitric()
            
            //Se for a primeira molecula, cria pro lado oposto
//            if i%2 == 0{
//                i * -1
//            }
            var randomNumber = randNum()
            auxX = CGFloat(i * randomNumber)
            randomNumber = randNum()
            auxY = CGFloat(i * randomNumber)
            
            divideMolecule.position = CGPointMake(self.position.x + auxX, self.position.y + auxY)
            
            self.parent!.addChild(divideMolecule)

        }
        
        
        
    }
    
    func randNum () -> Int {
    
        var randomNum = Int (arc4random_uniform(120)) - 60
        return randomNum
        
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
