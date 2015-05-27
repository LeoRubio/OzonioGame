//
//  OGFactory.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 26/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit


var molecule = OGMolecule()

class OGFactory: SKSpriteNode {
    init(texture: SKTexture, position: CGPoint){
        
        let texture = SKTexture(imageNamed: "BlackSquare")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        name = "FACTORY"

        self.position.x = position.x
        self.position.y = position.y
        
        let createMolecule = SKAction.sequence([SKAction.runBlock({
            self.spawnMolecule() }),
            SKAction.waitForDuration(1)])
        runAction(createMolecule)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func spawnMolecule(){
            
        
        molecule.position = CGPoint(x: 0.0, y: 200.0)
        addChild(molecule)
        
    }
    
    func update(){
        molecule.update()
        
    }
}
