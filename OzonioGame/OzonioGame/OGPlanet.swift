//
//  Planet.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 25/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGPlanet : SKSpriteNode {
    
    init(){
        
        let texture = SKTexture(imageNamed: "terra")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        name = "PLANET"
        self.size.width *= 1.5
        self.size.height *= 1.5
        
        createOzoneLayer("ozonio-01")
        createOzoneLayer("ozonio-02")
        createOzoneLayer("ozonio-03")
        createFactorys("BlackSquare")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createOzoneLayer (imageName: String){
        
        let ozoneNode : OGOzoneLayer?
        
        let texture = SKTexture(imageNamed: imageName)
        
        ozoneNode = OGOzoneLayer(texture: texture)
        ozoneNode!.position = CGPoint (x: 0.0, y: 0.0)
        self.addChild(ozoneNode!)
    }
    
    
    func createFactorys(imageName: String){
        
        let factoryNode : OGFactory?
        
        let texture = SKTexture(imageNamed: imageName)
        
        factoryNode = OGFactory(texture: texture, position: CGPoint (x: 0.0, y: 200.0))
//        factoryNode!.position = CGPoint(x: 0.0, y: 200.0)
        self.addChild(factoryNode!)
    }
    
}

