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
        
        super.init(imageNamed: "BlackCircle")
        
        self.name = "CARBON"
        
        self.size.width *= 0.5
        self.size.height *= 0.5
        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 2)
  
    }
    
    override func update() {
        var childXPosition = self.position.x + self.parent!.position.x
        var childYPosition = self.position.y + self.parent!.position.y
        //self.physicsBody!.applyImpulse(CGVectorMake(1.0, 1.0))
        self.physicsBody!.applyForce(CGVectorMake(1.0, 1.0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
