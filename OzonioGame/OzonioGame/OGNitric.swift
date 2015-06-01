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
        
        self.lifeMax = 5
        
        self.name = "NITRICMOLECULE"
        
        self.size.width *= 1.8
        self.size.height *= 1.8
        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 1.5)
        self.physicsBody?.dynamic = true
        
        
        
    }
    
    override func update() {
        var childXPosition = self.position.x + self.parent!.position.x
        var childYPosition = self.position.y + self.parent!.position.y
        //self.physicsBody!.applyImpulse(CGVectorMake(1.0, 1.0))
        self.physicsBody!.applyForce(CGVectorMake(4.0, 30.0))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
