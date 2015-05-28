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
        
        super.init(imageNamed: "BlackCircle")
        
        self.name = "NITROUS"
        
        self.size.width *= 1
        self.size.height *= 1
        
        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width)
        
    }
    
    override func update() {
        var childXPosition = self.position.x + self.parent!.position.x
        var childYPosition = self.position.y + self.parent!.position.y
        //self.physicsBody!.applyImpulse(CGVectorMake(1.0, 1.0))
        self.physicsBody!.applyForce(CGVectorMake(10.0, 10.0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
