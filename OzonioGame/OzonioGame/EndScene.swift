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
var rectColor : SKSpriteNode?
var rectColor2 : SKSpriteNode?


var fontName = "Avenir Medium"

class EndScene: SKScene {
    
    var labelContinue = SKLabelNode(fontNamed: "Arial-BoldMT")
    var labelQuit = SKLabelNode(fontNamed: "Arial-BoldMT")
    
    var labelGameOverText = SKLabelNode(fontNamed: fontName)
    var labelGameOverScore = SKLabelNode(fontNamed: fontName)
    
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    init(size: CGSize, year: Int, score: Int) {
        
        
        super.init(size: size)
        
        paused = false
        
        endNode = SKSpriteNode(imageNamed: "gameOver")
        endNode?.name = "retry"
        endNode?.position = CGPoint(x: size.width/2, y: size.height/2)
        endNode?.size.width *= 1.5
        endNode?.size.height *= 1.5
        
        
        self.addChild(endNode!)
        
        
        
        
        //Label1 = YEAR
        rectColor = SKSpriteNode(imageNamed: "colorRect")
        
        rectColor?.position = CGPoint(x: self.size.width/4 + 62, y: self.size.height/2 + 15)
        rectColor?.size.height *= 1.5
        rectColor?.size.width *= 1.5
        self.addChild(rectColor!)
        labelGameOverText.fontColor = SKColor.redColor()
        labelGameOverText.text = "\(foregroundNode!.labelYears!.getValue())"
        labelGameOverText.position = CGPoint(x: self.size.width/4 + 60, y: self.size.height/2 + 3)
        labelGameOverText.fontSize = 30
        labelGameOverText.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        self.addChild(labelGameOverText)
        
        
        //Label2 = SCORE Particles of polution
        rectColor2 = SKSpriteNode(imageNamed: "colorRect")
        rectColor2?.position = CGPoint(x: self.size.width/2 + 218, y: self.size.height/2 + 15)
        rectColor2?.size.height *= 1.5
        rectColor2?.size.width *= 1.5
        self.addChild(rectColor2!)
        labelGameOverScore.fontColor = SKColor.redColor()
        labelGameOverScore.text = "\(foregroundNode!.labelScore!.getValue())"
        labelGameOverScore.position = CGPoint(x: self.size.width/2 + 215, y: self.size.height/2 + 2)
        labelGameOverScore.fontSize = 30
        labelGameOverScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        self.addChild(labelGameOverScore)
        
        
        
        
        
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
                    
                    
                    let endTransition = SKTransition.crossFadeWithDuration(0.7)
                    let gameScene = GameScene(size: size)
                    self.scene?.view?.presentScene(gameScene, transition: endTransition)
                    
                    
//                } else if touch == "sair" {
//                    playAudio("pngs.wav")
//                    exit(0)
                    
                }
            }
        }
    }
    
    
    func playAudio(name: String){
        let playSoundAction = SKAction.playSoundFileNamed(name, waitForCompletion: false)
        runAction(playSoundAction)
    }
    
}