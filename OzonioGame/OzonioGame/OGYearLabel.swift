////
////  OGLabel.swift
////  OzonioGame
////
////  Created by Pedro Lopes on 5/28/15.
////  Copyright (c) 2015 FantasyName. All rights reserved.
////
//
//import UIKit
//import SpriteKit
//
//class OGYearLabel: SKLabelNode {
//    
//    
//    var year = 2015
//    
//    override init() {
//        super.init()
//        
//        //Cria a label do score
//
//        
//        
//        timePass()
//        
//
//    }
//    
//    
//    
//        runAction(SKAction.repeatActionForever(SKAction.sequence([
//            
//            SKAction.waitForDuration(5.0),
//            
//            SKAction.runBlock({
//                self.timePass()
//            }),
//            
//            
//            ])))
//        
//        addChild(scoreTextNode)
//        
//        /*
//        //Cria a labe do ano
//        
//        var year = 0
//        let yearTextNode = SKLabelNode(fontNamed: "Copperplate")
//        
//        yearTextNode.text = "YEARS : \(year)"
//        yearTextNode.fontSize = 20
//        yearTextNode.fontColor = SKColor.whiteColor()
//        
//        yearTextNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
//        addChild(yearTextNode)
//        */
//        
//    }
//    
//    func timePass(){
//        year++
//        
//        let scoreTextNode = SKLabelNode(fontNamed: "Copperplate")
//        
//        scoreTextNode.text = "YEAR : \(year)"
//        
//        SKAction
//        
//        
//        
//        scoreTextNode.fontSize = 20
//        scoreTextNode.fontColor = SKColor.whiteColor()
//        scoreTextNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
//        
//        
//        
//        runAction(SKAction.repeatActionForever(SKAction.sequence([
//            
//            SKAction.waitForDuration(5.0),
//            
//            SKAction.runBlock({
//                self.increase()
//            }),
//            
//            
//            ])))
//        
//        addChild(scoreTextNode)
//        
//
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}

