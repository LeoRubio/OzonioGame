//
//  OGScorePoints.swift
//  OzonioGame
//
//  Created by Victor D. Savariego on 18/6/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGScorePoints: SKLabelNode {
   
    var points:Int = 0
    let labelTextNode = SKLabelNode(fontNamed: "Avenir Medium")
    
    
    init(scorePoints: Int){
        super.init()
        
        points = scorePoints
        
        if points > 0{
            labelTextNode.text = "+\(points)"
        }
        else {
            labelTextNode.text = "\(points)"
        }
        
        
        labelTextNode.fontSize = 24
        labelTextNode.fontColor = SKColor.whiteColor()
        labelTextNode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        labelTextNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        
        self.name = "SCOREPOINTS"
        
        self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(1, 1))
        self.physicsBody?.dynamic = true
        
        self.physicsBody?.mass = 0.01
        self.physicsBody?.usesPreciseCollisionDetection = true
        
        self.physicsBody!.categoryBitMask = CollisionCategoryMolecules
        self.physicsBody!.collisionBitMask = 0
        
        self.zPosition += 5
        
        addChild(labelTextNode)
        
        animateNode()
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        if(self.alpha != 0.0){
           self.physicsBody!.applyForce(CGVectorMake(0.0, 10.0))
        }
        else{
            self.removeFromParent()
        }
        
        
    }
    
    func animateNode () {
        
        let adjustSize = SKAction.scaleBy(20.0, duration: 5.0)
        let fade = SKAction.fadeAlphaTo(0.0, duration: 1.0)
        
        self.runAction(adjustSize)
        self.runAction(fade)
        
    }

}
