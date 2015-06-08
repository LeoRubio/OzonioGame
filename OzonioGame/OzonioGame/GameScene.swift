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

var layerCount : Int = 32


let CollisionCategoryMolecules : UInt32 = 0x1 << 1
let CollisionCategoryOzoneLayer : UInt32 = 0x1 << 2



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    
    override init(size: CGSize) {
        
        
        
        super.init(size: size)
        
        playSound("yoda.wav")
        
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
        scoreTextNode!.position = CGPointMake(100, 935)
        addChild(scoreTextNode!)
        
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> master
//        // adding years counting
//        scoreTextNode = OGLabel()
//        scoreTextNode!.position = CGPointMake(size.width/2, size.height - 130)
//        addChild(scoreTextNode!)
//        
        
        //açao de girar Terra e Camadas
//        let rotate = SKAction.rotateByAngle(1, duration: 60)
//        planetNode!.runAction(SKAction.repeatActionForever(rotate))
        
>>>>>>> PedroBranch
=======
>>>>>>> master
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
                    playSound("Plop.wav")
                    moleculeParticle(location)
                    
                } else if touch == "NITROUSMOLECULE" {
                    
                    nitrousMolecule = nodeTouched as! OGNitrous
                    nitrousMolecule.removeLife()
                    playSound("Plop.wav")
                    moleculeParticle(location)
                    
                    
                } else if touch == "NITRICMOLECULE" {
                    
                    nitricMolecule = nodeTouched as! OGNitric
                    nitricMolecule.removeLife()
                    playSound("Plop.wav")
                    moleculeParticle(location)
                    
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
                    playSound("impact.wav")
                    ozoneImpactParticle(   nodeA)
                    nodeB.removeFromParent()
                }
                
                var damage : OGOzonePart
                damage = nodeA as! OGOzonePart
                damage.layerDamage()
                if layerCount <= 30 {
                    playSound("gameOver.wav")
                    playSound("strange.wav")
                    playSound("gameOver2.wav")
                    endParticleEffect()
//                    let doorsTransition = SKTransition.doorwayWithDuration(3.0)
//                    let gameOverScene = EndScene(size: size)
//                    self.scene?.view?.presentScene(gameOverScene, transition: doorsTransition)
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
        self.addChild(endParticle!)
        
        
    }
    
    
    func playSound (nome: String){
        let playSoundAction = SKAction.playSoundFileNamed(nome, waitForCompletion: false)
        runAction(playSoundAction)
    }
    

    
}
