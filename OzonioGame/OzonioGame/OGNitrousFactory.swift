//
//  OGNitrousFactory.swift
//  OzonioGame
//
//  Created by Victor D. Savariego on 28/5/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGNitrousFactory: OGFactory {
    init(factoryPosition position: CGPoint){
        
        super.init(imageNamed: "BlackSquare")
        
        self.name = "NITROUSFACTORY"
        
        self.position.x = position.x
        self.position.y = position.y
        
        self.size.height *= 1.5;
        self.size.width *= 1.5
        
        //Action de criação de moleculas
        runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock({self.spawnMolecule()}), SKAction.waitForDuration(8.0)])))
    }

    override func spawnMolecule(){
        
        let molecule = OGNitrous()
        molecule.position = CGPoint(x: 0.0, y: 0.0)
        super.addChild(molecule)
        
    }
    
    override func update() {
        self.enumerateChildNodesWithName("NITROUS") {
            node, stop in
            
            // CHAMA O UPDATE DE TODOS OS FILHOS MOLECULA
            var moleculeAux : OGNitrous?
            moleculeAux = node as? OGNitrous
            moleculeAux?.update()
            
            //stop.memory = true
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
