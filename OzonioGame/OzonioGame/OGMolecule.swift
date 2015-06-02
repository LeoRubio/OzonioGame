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
        self.name = "MOLECULE"

        self.zPosition += 1
        
        
    }
    
    func update(){
        
        fatalError("MUST OVERRIDE THIS FUNCTION")
        
    }
    
    func mitosis(){
        
        fatalError("MUST OVERRIDE THIS FUNCTION")
        
    }
    
    func removeLife(){
        
        self.lifeMax--
        
        
        println(self.lifeMax)
        if self.lifeMax <= 0{
            
            self.mitosis()
            self.removeFromParent()
        }
        else if self.lifeMax <= 1{
            self.color = SKColor.redColor()
        }
        else if self.lifeMax == 2{
            self.color = SKColor.yellowColor()
        }
        
        self.colorBlendFactor = 0.7
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
