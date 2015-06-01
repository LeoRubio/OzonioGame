//
//  OGMolecule.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 26/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit



class OGMolecule : OGHideRequired {
    
    var lifeMax: Int
    
    init(imageNamed imageName:String){
        
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        self.lifeMax = 1
        
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        
        self.zPosition += 1
        
        
    }
    
    func update(){

        fatalError("MUST OVERRIDE THIS FUNCTION")

    }
    
    func removeLife(){
        
        self.lifeMax--
        
        println(self.lifeMax)
        if self.lifeMax <= 0{

            self.removeFromParent()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
