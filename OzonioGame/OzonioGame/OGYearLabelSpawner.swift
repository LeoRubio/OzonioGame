//
//  OGYearLabelSpawner.swift
//  OzonioGame
//
//  Created by Pedro Lopes on 6/3/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit

import SpriteKit

class OGYearLabelSpawner: OGFactory {
   
init(factoryPosition position: CGPoint){
    
    super.init(imageNamed: "BlackSquare")
    
    self.name = "YEARSPAWNER"
    
    self.position.x = 10
    self.position.y = 50
    
    //Action de criação de moleculas
    runAction(SKAction.repeatActionForever(SKAction.sequence([
        
        SKAction.waitForDuration(5.0),
        
        SKAction.runBlock({
            self.spawnMolecule()
        }),
        
        
        ])))
}

override func spawnMolecule(){
    
   //if self.position.y < self.scene!.size.height{
        let molecule = OGYearLabel()
        molecule.position = CGPoint(x: 0.0, y: 0.0)
        super.addChild(molecule)
    //}
    
}

override func update() {
    self.enumerateChildNodesWithName("YearLabel") {
        node, stop in
        
        // CHAMA O UPDATE DE TODOS OS FILHOS MOLECULA
        var moleculeAux : OGYearLabel?
        moleculeAux = node as? OGYearLabel
        moleculeAux?.update()
        //stop.memory = true
        
    }
    
}

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
}
