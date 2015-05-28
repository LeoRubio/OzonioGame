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
        name = "OZONELAYER"
        self.size.width *= 1.5
        self.size.height *= 1.5
    }
    
    
    func update(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
