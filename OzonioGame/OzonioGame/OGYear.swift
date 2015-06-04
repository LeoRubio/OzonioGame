//

//  OGYear.swift

//  OzonioGame

//

//  Created by Pedro Lopes on 6/2/15.

//  Copyright (c) 2015 FantasyName. All rights reserved.

//



import UIKit

import SpriteKit



class OGYear : SKSpriteNode {
    
    
    
    
    
    
    
    init( texture: SKTexture ){
        
        
        
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        
        self.name = "ano"
        
        cria()
        
    }
    
    
    
    func cria(){
        
        var strip = SKTexture(imageNamed: "ano")
        
        
        
        
        
        //move background right to left; replace
        
        var shiftBackground = SKAction.moveByX(-strip.size().width, y: 0, duration: 50)
        
        var replaceBackground = SKAction.moveByX(strip.size().width, y:0, duration: 0)
        
        
        
        
        
        
        
        var movingAndReplacingBackground = SKAction.repeatActionForever(SKAction.sequence([shiftBackground, replaceBackground]))
        
        
        
        
        
        
        
        for var i:CGFloat = 0; i<3; i++ {
            
            //defining background; giving it height and moving width
            
            var stripFull = SKSpriteNode(texture: strip)
            
            stripFull.position = CGPoint(x: 0 + (strip.size().width * i), y: CGRectGetMidY(self.frame))
            
            stripFull.size.height = self.frame.height
            
            stripFull.runAction(movingAndReplacingBackground)
            
            
            
            self.addChild(stripFull)
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    
    
    
    func update(){
        
        
        
    }
    
    
    
    
    
    
    
}