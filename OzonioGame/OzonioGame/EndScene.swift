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


class EndScene: SKScene {
    
    var labelContinue = SKLabelNode(fontNamed: "Arial-BoldMT")
    var labelQuit = SKLabelNode(fontNamed: "Arial-BoldMT")
    
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override init(size: CGSize) {
        
        
        super.init(size: size)
        endNode = SKSpriteNode(imageNamed: "gameOver")
        endNode?.name = "retry"
        endNode?.position = CGPoint(x: size.width/2, y: size.height/2)
        endNode?.size.width *= 1.5
        endNode?.size.height *= 1.5
        self.addChild(endNode!)
        
        optionNode = SKSpriteNode(imageNamed: "option")
        optionNode?.name = "option"
        optionNode?.position = CGPoint(x: size.width/2, y: 50)
        optionNode?.size.width *= 2.2
        optionNode?.size.height *= 2.2
        self.addChild(optionNode!)
        
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