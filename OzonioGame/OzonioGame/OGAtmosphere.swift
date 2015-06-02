//
//  OGAtmosphere.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 02/06/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGAtmosphere : SKSpriteNode {
    
    init( texture: SKTexture ){
        
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        name = "ATMOSPHERE"
        self.size.width *= 1.5
        self.size.height *= 1.5
        self.zPosition = -1
    }
    
    
    func update(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
