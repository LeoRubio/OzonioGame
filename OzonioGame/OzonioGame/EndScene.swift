//
//  EndScene.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 03/06/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit


var endNode : SKSpriteNode?
var rectColor = SKSpriteNode(imageNamed: "colorRect")
var rectColor2 = SKSpriteNode(imageNamed: "colorRect")

class EndScene: SKScene {
    
    var labelContinue = SKLabelNode(fontNamed: "Arial-BoldMT")
    var labelQuit = SKLabelNode(fontNamed: "Arial-BoldMT")
    var labelGameOverText = SKLabelNode(fontNamed: "Arial-BoldMT")
    var labelGameOverScore = SKLabelNode(fontNamed: "Arial-BoldMT")
    
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    init(size: CGSize, year: Int, score: Int) {
        
        
        super.init(size: size)
        
        endNode = SKSpriteNode(imageNamed: "gameOver")
        endNode?.name = "retry"
        endNode?.position = CGPoint(x: size.width/2, y: size.height/2)
        endNode?.size.width *= 1.5
        endNode?.size.height *= 1.5
        self.addChild(endNode!)
        
        //TO DO --> Limite de caracteres em SKLabelNode por volta de 44 -> OK
        //labelGameOverText.text = "In the year \(2015) you have eliminated \(3000) particles of pollution but the ozone layer did not survive. Also, the greenhouse effect overheated the Earth, eliminating all forms of life."
        
        //Label1 = YEAR
        rectColor.position = CGPoint(x: self.size.width/4 + 62, y: self.size.height/2 + 15)
        rectColor.size.height *= 1.5
        rectColor.size.width *= 1.5
        self.addChild(rectColor)
        labelGameOverText.fontColor = SKColor.redColor()
        labelGameOverText.text = "\(foregroundNode!.labelYears!.getValue())"
        labelGameOverText.position = CGPoint(x: self.size.width/4 + 60, y: self.size.height/2 + 3)
        labelGameOverText.fontSize = 30
        labelGameOverText.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        self.addChild(labelGameOverText)
        
        
        
        //Label2 = SCORE Particles of polution
        rectColor2.position = CGPoint(x: self.size.width/2 + 218, y: self.size.height/2 + 15)
        rectColor2.size.height *= 1.5
        rectColor2.size.width *= 1.5
        self.addChild(rectColor2)
        
        labelGameOverScore.fontColor = SKColor.redColor()
        labelGameOverScore.text = "\(foregroundNode!.labelScore!.getValue())"
        labelGameOverScore.position = CGPoint(x: self.size.width/2 + 215, y: self.size.height/2 + 2)
        labelGameOverScore.fontSize = 30
        labelGameOverScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        self.addChild(labelGameOverScore)
        
        
        
//        optionNode = SKSpriteNode(imageNamed: "option")
//        optionNode?.name = "option"
//        optionNode?.position = CGPoint(x: size.width/2, y: 50)
//        optionNode?.size.width *= 2.2
//        optionNode?.size.height *= 2.2
//        self.addChild(optionNode!)
        
        playAudio("strange.wav")
    }
    
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        for touch: AnyObject in touches {
            
            let location = (touch as! UITouch).locationInNode(self)
            var nodeTouched = self.nodeAtPoint(location)
            
            if let touch = nodeTouched.name {
                
                if touch == "option" {
                    
                    playAudio("buttons.wav")
                    
                    labelQuit.removeFromParent()
                    labelContinue.removeFromParent()
                    
                    labelContinue.name = "continue"
                    labelContinue.text = " CONTINUE? "
                    labelContinue.fontSize = 30
                    labelContinue.fontColor = SKColor.whiteColor()
                    labelContinue.position = CGPoint(x: size.width/2 + 128, y: 60)
                    addChild(labelContinue)
                    
                    labelQuit.name = "sair"
                    labelQuit.text = " SAIR? "
                    labelQuit.fontSize = 30
                    labelQuit.fontColor = SKColor.whiteColor()
                    labelQuit.position = CGPoint(x: size.width/2 + 75, y: 20)
                    addChild(labelQuit)
                    
                    
                } else if touch == "continue"{
                    
                    playAudio("buttons.wav")
                    
                    labelQuit.removeFromParent()
                    labelContinue.removeFromParent()
                    
                } else if touch == "retry" {
                    
                    playAudio("buttons.wav")
                    
                    labelQuit.removeFromParent()
                    labelContinue.removeFromParent()
                    layerCount = 32
                    
                    let doorsTransition = SKTransition.doorwayWithDuration(1.0)
                    let gameScene = GameScene(size: size)
                    self.scene?.view?.presentScene(gameScene, transition: doorsTransition)
                    
                } else if touch == "sair" {
                    playAudio("pngs.wav")
                    exit(0)
                }
            }
        }
    }
    
    
    func playAudio(name: String){
        let playSoundAction = SKAction.playSoundFileNamed(name, waitForCompletion: false)
        runAction(playSoundAction)
    }
    
}