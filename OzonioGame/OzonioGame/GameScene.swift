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

var layerCount : Int = 32


let CollisionCategoryMolecules : UInt32 = 0x1 << 1
let CollisionCategoryOzoneLayer : UInt32 = 0x1 << 2



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override init(size: CGSize) {
        
        super.init(size: size)
        
        playMusic("intro.mp3")
        
        //gravity
        physicsWorld.gravity = CGVectorMake(0.0, -0.1)
        physicsWorld.contactDelegate = self
        userInteractionEnabled = true
        
        // adding the background
        backgroundNode = OGBackground()
        backgroundNode!.position = CGPoint(x: size.width / 2.0, y: 0.0)
        addChild(backgroundNode!)
        
        
        //adding foreGround
        foregroundNode = OGForeground(size: self.size)
        addChild(foregroundNode!)
        
        
        // adding the planet (com camadas de ozonio e fabricas -> moleculas)
        planetNode = OGPlanet()
        planetNode!.position = CGPoint (x: size.width/2, y: 0.0)
        addChild(planetNode!)
        
        // adding the sun
        sunNode = OGSun()
        sunNode!.position = CGPoint (x: size.width/2, y: size.height)
        addChild(sunNode!)
        
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        super.update(currentTime)
        
        if !self.paused {
            planetNode!.update()
        }
        
    }
    
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        
        for touch: AnyObject in touches {
            
            let location:CGPoint = (touch as! UITouch).locationInNode(self)
            
            //var nodeTouched = self.nodeAtPoint(location)
            
            for anyNode: AnyObject in self.nodesAtPoint(location) {
                
                
                let nodeTouched:SKNode = anyNode as! SKNode
                
                var carbonMolecule = OGCarbon()
                var nitrousMolecule = OGNitrous()
                var nitricMolecule = OGNitric()
                var ozoneMolecule = OGOzone()
                
                
                if let touch = nodeTouched.name {
                    
                    if !self.paused {
                        if touch == "CARBONMOLECULE" {
                            carbonMolecule = nodeTouched as! OGCarbon
                            foregroundNode?.labelScore!.updateScore(gameScore: carbonMolecule.removeLife())
                            playSound("Plop.wav")
                            moleculeParticle(location)
                            
                            
                        }else if touch == "NITROUSMOLECULE" {
                            
                            nitrousMolecule = nodeTouched as! OGNitrous
                            foregroundNode?.labelScore!.updateScore(gameScore: nitrousMolecule.removeLife())
                            playSound("Plop.wav")
                            moleculeParticle(location)
                            
                            
                            
                        }else if touch == "NITRICMOLECULE" {
                            
                            nitricMolecule = nodeTouched as! OGNitric
                            foregroundNode?.labelScore!.updateScore(gameScore: nitricMolecule.removeLife())
                            playSound("Plop.wav")
                            moleculeParticle(location)
                            
                        }
                            
                        else if touch == "OZONEMOLECULE" {
                            ozoneMolecule = nodeTouched as! OGOzone
                            foregroundNode?.labelScore!.updateScore(gameScore: ozoneMolecule.removeLife())
                            playSound("Plop.wav")
                            moleculeParticle(location)
                        }
                    }
                    
                    //Touch do botao PlayPause que não depende do pause true ou não
                    if touch == "PLAYPAUSE" {
                        self.paused = !self.paused
                        foregroundNode?.playNode!.switchState()
                    }
                }
            }
        }
    }
    
    
    
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        if  contact.bodyB!.node != nil && contact.bodyA.node != nil{
            
            var nodeA = contact.bodyA!.node!
            var nodeB = contact.bodyB!.node!
            
            if nodeB.name == "CARBONMOLECULE" || nodeB.name == "NITROUSMOLECULE" || nodeB.name == "NITRICMOLECULE" {
                // O que acontece quando a molecula de dano acerta a camada
                
                playSound("impact.wav")
                ozoneImpactParticle(nodeA)
                nodeB.removeFromParent()
                
                var damage : OGOzonePart
                damage = nodeA as! OGOzonePart
                damage.layerDamage()
            }
                
            else if nodeB.name == "OZONEMOLECULE" {
                // O que acontece quando a molecula de cura acerta a camada
                
                playSound("impact.wav")
                ozoneImpactParticle(nodeA)
                nodeB.removeFromParent()
                
                var heal : OGOzonePart
                heal = nodeA as! OGOzonePart
                heal.layerHeal()
            }
            
            
            if layerCount <= 31 {
                playSound("gameOver.wav")
                playSound("strange.wav")
                playSound("gameOver2.wav")
                endParticleEffect()
                let wait = SKAction.waitForDuration(2.5)
                self.runAction(wait, completion: { () -> Void in
                    let endTransition = SKTransition.crossFadeWithDuration(1.5)
                    let gameOverScene = EndScene(size: self.size, year: foregroundNode!.labelScore!.getValue(), score: foregroundNode!.labelScore!.getValue())
                    self.scene?.view?.presentScene(gameOverScene, transition: endTransition)
                })
            }
            
        }
        
    }
    
    
    
    
    func moleculeParticle (touchPoint : CGPoint){
        
        var moleculeExplodeParticle : SKEmitterNode?
        let explodePath = NSBundle.mainBundle().pathForResource("explodeMolecule7", ofType: "sks")
        moleculeExplodeParticle = NSKeyedUnarchiver.unarchiveObjectWithFile(explodePath!) as? SKEmitterNode
        moleculeExplodeParticle?.position = touchPoint
        self.addChild(moleculeExplodeParticle!)
        
    }
    
    
    
    func ozoneImpactParticle(ozonePart : SKNode){
        
        var ozoneImpactParticle : SKEmitterNode?
        let ozoneImpactPath = NSBundle.mainBundle().pathForResource("ozoneImpact", ofType: "sks")
        ozoneImpactParticle = NSKeyedUnarchiver.unarchiveObjectWithFile(ozoneImpactPath!) as? SKEmitterNode
        ozonePart.addChild(ozoneImpactParticle!)
    }
    
    
    
    
    func endParticleEffect(){
        
        var endParticle : SKEmitterNode?
        let endPartPath = NSBundle.mainBundle().pathForResource("finalEffect", ofType: "sks")
        endParticle = NSKeyedUnarchiver.unarchiveObjectWithFile(endPartPath!) as? SKEmitterNode
        endParticle?.position.x = self.frame.width/2
        endParticle?.position.y = self.frame.height/2
        
        self.addChild(endParticle!)
        
    }
    
    //Toca um Som curto
    func playSound (nome: String){
        let playSoundAction = SKAction.playSoundFileNamed(nome, waitForCompletion: false)
        runAction(playSoundAction)
    }
    
    //Toca uma musica em loop, esperando o tempo dela completar
    func playMusic (nome: String){
        
        let playMusicAction = SKAction.playSoundFileNamed(nome, waitForCompletion: true)
        runAction(SKAction.repeatActionForever(playMusicAction))
        
    }
    
}
