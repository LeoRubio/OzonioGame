//
//  OGCarbonFactory.swift
//  OzonioGame
//
//  Created by Victor D. Savariego on 28/5/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGCarbonFactory: OGFactory {
    
    init(factoryPosition position: CGPoint){
        
        super.init(imageNamed: "navio")
        
        self.name = "CARBONFACTORY"
        
        self.position.x = position.x
        self.position.y = position.y
        
        //Action de criação de moleculas
        runAction(SKAction.repeatActionForever(SKAction.sequence([
            
            SKAction.waitForDuration(3.0, withRange: 5.0),
            
            SKAction.runBlock({
                self.spawnMolecule()
            }),
            
            
            ])))
    }
    
    override func spawnMolecule(){
        
        if self.position.y < self.scene!.size.height{
            let molecule = OGCarbon()
            molecule.position = CGPoint(x: 0.0, y: 0.0)
            super.addChild(molecule)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
