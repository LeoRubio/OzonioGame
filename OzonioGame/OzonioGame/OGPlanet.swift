//
//  Planet.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 25/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit


var factoryNode : OGFactory?


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
        for var i : CGFloat = 0.0; i<20.0; i++
        {
            createFactorys("BlackSquare", positionFactor: CGPointMake(10.0*i, 10.0*i))
        }
        
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
    
    
    func createFactorys(imageName: String, positionFactor: CGPoint){
        
        factoryNode = OGFactory(texture: texture!, position: CGPoint (x: 0.0, y: 200.0))
        self.addChild(factoryNode!)
    }
    
    func update(){
        
        factoryNode?.update()
        
    }
    
}

