//
//  OGOzonePart.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 02/06/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit



class OGOzonePart : SKSpriteNode {
    
    
    var layerLife : Int
    
    init( texture: SKTexture ){

        self.layerLife = 5

        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        name = "OZONE"
        self.size.width *= 1.5
        self.size.height *= 1.5
        
        self.physicsBody = SKPhysicsBody(texture: texture, alphaThreshold: 0.0, size: self.size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.dynamic = false
        
        self.physicsBody!.categoryBitMask = CollisionCategoryOzoneLayer
        self.physicsBody!.contactTestBitMask = CollisionCategoryMolecules
        self.physicsBody!.collisionBitMask = 0
        
    }
    
    
    func update(){
        
    }
    
    func layerDamage(){
        
        
        self.layerLife--
        
        if self.layerLife <= 0{
            self.removeFromParent()
            layerCount--
            playAudio("coracao.wav")
        }
            
        else if self.layerLife < 3{
            self.color = SKColor.redColor()
        }
            
        else if self.layerLife < 5{
            self.color = SKColor.yellowColor()
        }
        
        self.colorBlendFactor = 0.7
    }
    
    

    
    func playAudio(name: String){
        let playSoundAction = SKAction.playSoundFileNamed(name, waitForCompletion: false)
        runAction(playSoundAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}