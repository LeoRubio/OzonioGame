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
        
        self.destroyScore = 150
        
        self.name = "NITROUSMOLECULE"
        
        self.size.width *= 1.6
        self.size.height *= 1.6

        
        
    }
    
    override func mitosis(){
        
        var auxX:CGFloat = 0.0
        
        for(var i = 0; i < 2; i++){
            let divideMolecule = OGCarbon()
            
            auxX = CGFloat(i*40)
            
            divideMolecule.position = CGPointMake(self.position.x + auxX, self.position.y)
            self.parent!.addChild(divideMolecule)
        }

        
    }
    
    override func update() {
        var childXPosition = self.position.x + self.parent!.position.x
        var childYPosition = self.position.y + self.parent!.position.y
        //self.physicsBody!.applyImpulse(CGVectorMake(1.0, 1.0))

        self.physicsBody!.applyForce(CGVectorMake(0.0, 0.3))

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
