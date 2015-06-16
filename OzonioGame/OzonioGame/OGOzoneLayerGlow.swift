//
//  OGOzoneLayer.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 25/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGOzoneLayerGlow : SKSpriteNode {
   
    init( texture: SKTexture ){
        
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        name = "ozoneGlow"
        self.size.width *= 0.95
        self.size.height *= 0.95
        
        self.color = SKColor.blueColor()
        
        self.colorBlendFactor = 0.5
        self.zPosition = 1
        
        animateGlow()
        
    }
    
    
    func update(){
        
        if layerCount == 31 {
            self.color = SKColor.redColor()
            self.colorBlendFactor = 1
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func animateGlow () {

        let adjustSize3 = SKAction.scaleBy(2.0, duration: 0.2)
        let adjustSize4 = SKAction.scaleBy(0.5, duration: 0.2)

        var sequenceArray = SKAction.sequence([adjustSize3, adjustSize4])
        
        self.runAction(SKAction.repeatActionForever(sequenceArray))
    }
    
    
}
