//
//  OGNitric.swift
//  OzonioGame
//
//  Created by Victor D. Savariego on 28/5/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGNitric: OGFactory {
    
    init(){
        
        super.init(imageNamed: "BlackCircle")
        
        self.name = "NITRICMOLECULE"
        
        self.size.width *= 1.8
        self.size.height *= 1.8
        
        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 1.5)
        
    }
    
    override func update() {
        var childXPosition = self.position.x + self.parent!.position.x
        var childYPosition = self.position.y + self.parent!.position.y
        //self.physicsBody!.applyImpulse(CGVectorMake(1.0, 1.0))
        self.physicsBody!.applyForce(CGVectorMake(8.0, 20.0))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
