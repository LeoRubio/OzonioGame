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
    var scoreGiven: Int
    //    var adjustSize : SKAction
    
    
    init(imageNamed imageName:String){
        
        let color = UIColor.clearColor()
        let texture = SKTexture(imageNamed: imageName)
        let size = texture.size()
        
        self.lifeMax = 1
        self.scoreGiven = 10
        
        
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        self.name = "MOLECULE"
        
        
        self.physicsBody = SKPhysicsBody (circleOfRadius: self.size.width / 3.0)
        self.physicsBody?.dynamic = true
        
        self.physicsBody?.mass = 0.01
        self.physicsBody?.usesPreciseCollisionDetection = true
        
        self.physicsBody!.categoryBitMask = CollisionCategoryMolecules
        self.physicsBody!.collisionBitMask = 0
        
        self.zPosition += 1
        
        animateMolecules()
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func update(){
        
        fatalError("MUST OVERRIDE THIS FUNCTION")
        
    }
    
    
    func mitosis(){
        
        fatalError("MUST OVERRIDE THIS FUNCTION")
        
    }
    
    
    func giveScore() -> Int{
        return self.scoreGiven
    }
    
    
    func spawnScoreNode(){
        let spawnScoreNode : OGScorePoints?
        spawnScoreNode = OGScorePoints(scorePoints: giveScore())
        spawnScoreNode!.position = CGPointMake(self.position.x, self.position.y)
        self.parent!.addChild(spawnScoreNode!)
    }
    
    
    func removeLife() -> Int{
        
        self.lifeMax--
        
        if self.lifeMax <= 0{
            
            self.mitosis()
            self.spawnScoreNode()
            self.removeFromParent()
            return self.giveScore()
        }
        else if self.lifeMax <= 1{
            self.color = SKColor.redColor()
        }
        else if self.lifeMax == 2{
            self.color = SKColor.yellowColor()
        }
        
        self.colorBlendFactor = 0.7
        
        return 0
    }
    
    
    
    
    func animateMolecules () {
        
        let adjustSize = SKAction.scaleBy(23.0, duration: 0.6)
        
        let rotateClokAction = SKAction.rotateByAngle(3.14, duration: 1.3)
        let rotateClokAction2 = SKAction.rotateByAngle(-3.14, duration: 1.3)
        let adjustSize3 = SKAction.scaleBy(1.1, duration: 0.001)
        
        var rand = arc4random_uniform(10)
        var sequenceArray = SKAction.sequence([rotateClokAction, adjustSize3])
        
        if rand%2 == 0{
            sequenceArray = SKAction.sequence([rotateClokAction2, adjustSize3])
        }
        
        self.runAction(adjustSize)
        self.runAction(SKAction.repeatActionForever(sequenceArray))
    }
    
    
    
    
    
    
}
