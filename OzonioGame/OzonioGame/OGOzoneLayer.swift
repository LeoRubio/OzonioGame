//
//  OGOzoneLayer.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 25/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGOzoneLayer : SKSpriteNode {
   
    init( texture: SKTexture ){
        
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
//        name = "OZONE"
        self.size.width *= 1.5
        self.size.height *= 1.5
        self.hidden = true
        
//        self.physicsBody = SKPhysicsBody(texture: texture, alphaThreshold: 0.0, size: self.size)
//        self.physicsBody?.affectedByGravity = false
//        self.physicsBody?.dynamic = false
//        
//        self.physicsBody!.categoryBitMask = CollisionCategoryOzoneLayer
//        self.physicsBody!.contactTestBitMask = CollisionCategoryMolecules
//        self.physicsBody!.collisionBitMask = 0
        
    }
    
    
    func update(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
