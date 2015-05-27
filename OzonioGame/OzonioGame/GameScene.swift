//
//  GameScene.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 21/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import SpriteKit


var backgroundNode : OGBackground?
var planetNode : OGPlanet?
var sunNode : OGSun?



class GameScene: SKScene {
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        //gravity
        physicsWorld.gravity = CGVectorMake(0.0, -0.1)
        
        // adding the background
        backgroundNode = OGBackground()
        backgroundNode!.position = CGPoint(x: size.width / 2.0, y: 0.0)
        addChild(backgroundNode!)
        
        // adding the planet (com camadas de ozonio e fabricas -> moleculas)
        planetNode = OGPlanet()
        planetNode!.position = CGPoint (x: size.width/2, y: 0.0)
        addChild(planetNode!)
        
        // adding the sun
        sunNode = OGSun()
        sunNode!.position = CGPoint (x: size.width/2, y: size.height)
        addChild(sunNode!)
        
        
        //açao de girar Terra e Camadas
        let rotate = SKAction.rotateByAngle(1, duration: 10)
        planetNode!.runAction(SKAction.repeatActionForever(rotate))
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        super.update(currentTime)
        planetNode!.update()
        
    }
}
