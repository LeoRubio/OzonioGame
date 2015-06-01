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
        
        super.init(imageNamed: "BlackSquare")
        
        self.name = "CARBONFACTORY"
        
        self.position.x = position.x
        self.position.y = position.y
        
        //Action de criação de moleculas
        runAction(SKAction.repeatActionForever(SKAction.sequence([
            
            SKAction.waitForDuration(0.5),
            
            SKAction.runBlock({
                self.spawnMolecule()
            }),
            
            SKAction.waitForDuration(2.0)
            
            ])))
    }
    
    override func spawnMolecule(){
        
        let molecule = OGCarbon()
        molecule.position = CGPoint(x: 0.0, y: 0.0)
        super.addChild(molecule)
        
    }
    
    override func update() {
        self.enumerateChildNodesWithName("CARBONMOLECULE") {
            node, stop in
            
            // CHAMA O UPDATE DE TODOS OS FILHOS MOLECULA
            var moleculeAux : OGCarbon?
            moleculeAux = node as? OGCarbon
            moleculeAux?.update()
            //stop.memory = true
            
        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
