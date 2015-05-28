//
//  OGSun.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 25/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGSun : SKSpriteNode {
    
    init () {
        let texture = SKTexture (imageNamed: "sol")
        var sunFire : SKEmitterNode?
        
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        name = "SUN"
 
        self.size.height /= 3
        self.size.width /= 3
        
        //adding sunFire
        let sunFirePath = NSBundle.mainBundle().pathForResource("fireSun", ofType: "sks")
        sunFire = NSKeyedUnarchiver.unarchiveObjectWithFile(sunFirePath!) as? SKEmitterNode
        self.addChild(sunFire!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
