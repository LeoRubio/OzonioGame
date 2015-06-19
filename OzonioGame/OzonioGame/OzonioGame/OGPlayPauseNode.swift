//
//  OGPauseNode.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 02/06/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGPlayPauseNode : SKSpriteNode {
    
    var state:Bool
    
    init(){
        
        self.state = true
        
        let texture = SKTexture(imageNamed: "pause")
        
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        
        self.zPosition = 100 // Só pra garantir
        self.name = "PLAYPAUSE"
        
    }
    
    func switchState(){
        if !state{
            self.texture = SKTexture(imageNamed: "pause")
        }
        else{
            self.texture = SKTexture(imageNamed: "play")
        }
        
        state = !state
    }
    
    func update(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
