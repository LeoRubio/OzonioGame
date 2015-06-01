//
//  OGNitricFactory.swift
//  OzonioGame
//
//  Created by Victor D. Savariego on 28/5/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGNitricFactory: OGFactory {
   
    init(factoryPosition position: CGPoint){
        
        super.init(imageNamed: "BlackSquare")
        
        self.name = "NITRICFACTORY"
        
        self.position.x = position.x
        self.position.y = position.y
        
        self.size.height *= 1
        self.size.width *= 1
        
        //Action de criação de moleculas
        //Action de criação de moleculas
        runAction(SKAction.repeatActionForever(SKAction.sequence([
            
            SKAction.waitForDuration(0.5),
            
            SKAction.runBlock({
                self.spawnMolecule()
            }),
            
            SKAction.waitForDuration(16.0)
            
            ])))
    }
    
    override func spawnMolecule(){
        
        let molecule = OGNitric()
        molecule.position = CGPoint(x: 0.0, y: 0.0)
        super.addChild(molecule)
        
    }
    
    override func update() {
        self.enumerateChildNodesWithName("NITRICMOLECULE") {
            node, stop in
            
            // CHAMA O UPDATE DE TODOS OS FILHOS MOLECULA
            var moleculeAux : OGNitric?
            moleculeAux = node as? OGNitric
            moleculeAux?.update()
            
            //stop.memory = true
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
