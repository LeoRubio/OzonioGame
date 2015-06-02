//
//  GameScene.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 21/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import SpriteKit


var backgroundNode : OGBackground?
var foregroundNode : OGForeground?
var planetNode : OGPlanet?
var sunNode : OGSun?
var scoreTextNode: OGLabel?

let CollisionCategoryMolecules : UInt32 = 0x1 << 1
let CollisionCategoryOzoneLayer : UInt32 = 0x1 << 2



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        //gravity
        physicsWorld.gravity = CGVectorMake(0.0, -0.1)
        physicsWorld.contactDelegate = self
        userInteractionEnabled = true
        
        // adding the background
        backgroundNode = OGBackground()
        backgroundNode!.position = CGPoint(x: size.width / 2.0, y: 0.0)
        addChild(backgroundNode!)
        
        
        //adding foreGround
        foregroundNode = OGForeground()
        addChild(foregroundNode!)
        
        
        // adding the planet (com camadas de ozonio e fabricas -> moleculas)
        planetNode = OGPlanet()
        planetNode!.position = CGPoint (x: size.width/2, y: 0.0)
        addChild(planetNode!)
        
        // adding the sun
        sunNode = OGSun()
        sunNode!.position = CGPoint (x: size.width/2, y: size.height)
        addChild(sunNode!)
        
        // adding score
        scoreTextNode = OGLabel(nome: "SCORE")
        scoreTextNode!.position = CGPointMake(size.width - 730, size.height - 60)
        addChild(scoreTextNode!)
        
        // adding years counting
        scoreTextNode = OGLabel(nome: "YEARS")
        scoreTextNode!.position = CGPointMake(size.width - 730, size.height - 80)
        addChild(scoreTextNode!)
        
        
        //açao de girar Terra e Camadas
        //        let rotate = SKAction.rotateByAngle(1, duration: 60)
        //        planetNode!.runAction(SKAction.repeatActionForever(rotate))
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        super.update(currentTime)
        planetNode!.update()
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        
        for touch: AnyObject in touches {
            
            let location = (touch as! UITouch).locationInNode(self)
            
            var nodeTouched = self.nodeAtPoint(location)
            
            var carbonMolecule = OGCarbon()
            var nitrousMolecule = OGNitrous()
            var nitricMolecule = OGNitric()
            
            
            if let touch = nodeTouched.name {
                
                if touch == "CARBONMOLECULE" {
                    carbonMolecule = nodeTouched as! OGCarbon
                    carbonMolecule.removeLife()
                    
                } else if touch == "NITROUSMOLECULE" {
                    
                    nitrousMolecule = nodeTouched as! OGNitrous
                    nitrousMolecule.removeLife()
                    
                    
                } else if touch == "NITRICMOLECULE" {
                    
                    nitricMolecule = nodeTouched as! OGNitric
                    nitricMolecule.removeLife()
                    
                }
                else if touch == "PLAYPAUSE"{
                    foregroundNode?.playNode!.switchState()
                }
            }
            
        }
    }
    
        func didBeginContact(contact: SKPhysicsContact) {
            
            if  contact.bodyB!.node != nil && contact.bodyA.node != nil{
                
                var nodeA = contact.bodyA!.node!
                var nodeB = contact.bodyB!.node!
                if nodeB.name == "CARBONMOLECULE" || nodeB.name == "NITROUSMOLECULE" || nodeB.name == "NITRICMOLECULE" {
                    nodeB.removeFromParent()
                }
                
                
                var ozoneDamage = SKAction.colorizeWithColor(UIColor.redColor(), colorBlendFactor: 1.0, duration: 1)
                contact.bodyA!.node!.runAction(ozoneDamage)
                
            }
            
            
        }
        
        
}
