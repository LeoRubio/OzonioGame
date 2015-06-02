//
//  OGBackground.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 25/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGBackground : SKSpriteNode {
    
    init (){
        
        let texture = SKTexture(imageNamed: "background")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        name = "BACKGROUND"
        self.size.width *= 1.5
        self.size.height *= 1.5
        self.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        self.zPosition = -3
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   
}
