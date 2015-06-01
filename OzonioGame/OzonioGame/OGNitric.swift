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
        
        super.init(imageNamed: "BlackCircle")
        
        self.lifeMax = 3
        
        self.name = "NITRICMOLECULE"
        
        self.size.width *= 1.5
        self.size.height *= 1.5
        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 1.5)
        self.physicsBody?.dynamic = true
        self.physicsBody!.mass = 0.2
        
        
    }
    
    override func update() {
        var childXPosition = self.position.x + self.parent!.position.x
        var childYPosition = self.position.y + self.parent!.position.y
        //self.physicsBody!.applyImpulse(CGVectorMake(1.0, 1.0))
        self.physicsBody!.applyForce(CGVectorMake(1.0, 12.0))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
