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
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func spawnMolecule(){
        
        fatalError("MUST OVERRIDE THIS FUNCTION")
        
    }
    
    func update(){
        
        fatalError("MUST OVERRIDE THIS FUNCTION")
        
    }
    
}
