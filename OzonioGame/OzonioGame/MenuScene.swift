//
//  MenuScene.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 02/06/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit



var nodeMenu : SKSpriteNode?
var optionNode : SKSpriteNode?
var gameScene : GameScene?


class MenuScene: SKScene {
    
    var labelContinue = SKLabelNode(fontNamed: "Arial-BoldMT")
    var labelQuit = SKLabelNode(fontNamed: "Arial-BoldMT")
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override init(size: CGSize) {
        
        
        
        super.init(size: size)
        
        nodeMenu = SKSpriteNode(imageNamed: "menu")
        nodeMenu?.name = "menu"
        nodeMenu?.position = CGPoint(x: size.width/2, y: size.height/2)
        nodeMenu?.size.width *= 1.5
        nodeMenu?.size.height *= 1.5
        self.addChild(nodeMenu!)
        
        optionNode = SKSpriteNode(imageNamed: "option")
        optionNode?.name = "option"
        optionNode?.position = CGPoint(x: size.width/2, y: 50)
        optionNode?.size.width *= 2.2
        optionNode?.size.height *= 2.2
        //self.addChild(optionNode!)
        
        gameScene = GameScene(size: size)
        
        playAudioBegin("intro.mp3")
    }
    
    
    func playAudioBegin (name: String) {
        let playSoundAction = SKAction.playSoundFileNamed(name, waitForCompletion: true)
        
        runAction(SKAction.repeatActionForever(playSoundAction))
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
                    
                } else if touch == "menu" {
                    
                    playAudio("buttons.wav")
                    
                    labelQuit.removeFromParent()
                    labelContinue.removeFromParent()
                    
                    
                    self.runAction(SKAction.waitForDuration(0.2))
                    let endTransition = SKTransition.moveInWithDirection(SKTransitionDirection.Down, duration: 1.0)
                    self.scene?.view?.presentScene(gameScene, transition: endTransition)
                
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
