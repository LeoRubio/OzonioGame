//
//  OGFactory.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 26/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit



class OGFactory : OGHideRequired {
    
    init(imageNamed imageName:String){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        
        let rotate = SKAction.rotateByAngle(-10, duration: 60)
        self.runAction(SKAction.repeatActionForever(rotate))
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func spawnMolecule(){
        
        fatalError("MUST OVERRIDE THIS FUNCTION")
        
    }
    
    func update(){
        
        self.enumerateChildNodesWithName("CARBONMOLECULE") {
            node, stop in
            
            // CHAMA O UPDATE DE TODOS OS FILHOS MOLECULA
            var moleculeAux : OGCarbon?
            moleculeAux = node as? OGCarbon
            moleculeAux?.update()
            
            
        }
        
        self.enumerateChildNodesWithName("NITROUSMOLECULE") {
            node, stop in
            
            // CHAMA O UPDATE DE TODOS OS FILHOS MOLECULA NITROUS
            var moleculeAux : OGNitrous?
            moleculeAux = node as? OGNitrous
            moleculeAux?.update()
            
            
        }
        
        self.enumerateChildNodesWithName("NITRICMOLECULE") {
            node, stop in
            
            // CHAMA O UPDATE DE TODOS OS FILHOS MOLECULA NITRIC
            var moleculeAux : OGNitric?
            moleculeAux = node as? OGNitric
            moleculeAux?.update()
            
            
        }
        
        
    }
    
}
