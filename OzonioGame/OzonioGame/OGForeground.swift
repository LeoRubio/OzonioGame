//
//  OGForeground.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 02/06/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGForeground : SKNode {
    
    var playNode : OGPlayPauseNode?
    var scoreNode : OGScoreNode?
    
    override init(){
        
        super.init()
        self.zPosition = -2
        createObjects()
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createObjects(){
        
        createYearNode("ano")
        createScoreNode("score")
        createPlayNode()
        
    }
    
    
    func createScoreNode(imageName: String){

       
            
        let texture = SKTexture(imageNamed: imageName)
            
        scoreNode = OGScoreNode(texture: texture)
        scoreNode!.position = CGPoint (x: 100.0, y: 937.0)
        scoreNode!.size.height =  scoreNode!.size.height
        scoreNode!.size.width = 1.2 * scoreNode!.size.width
        self.addChild(scoreNode!)
        
        
    }
    
    
    func createPlayNode(){
        
        playNode = OGPlayPauseNode()
        playNode!.position = CGPoint (x: 720, y: 900)
        playNode!.size.height = 2 * playNode!.size.height
        playNode!.size.width = 2 * playNode!.size.width
        addChild(self.playNode!)
        
        
    }
    
    
    
    
    func createYearNode(imageName: String){
        
        let yearNode : OGYear?
        
        let texture = SKTexture(imageNamed: imageName)
        
        yearNode = OGYear(texture: texture)
        yearNode!.position = CGPoint (x: 500, y: 960)
        yearNode!.size.height = 3 * yearNode!.size.height
        yearNode!.size.width = 3 * yearNode!.size.width
        self.addChild(yearNode!)
        
        
    }
    
//    func createLabel(imageName: String){
//        
//        let yearSpawner : OGYearLabelSpawner
//        
//        let texture = SKTexture(imageNamed: imageName)
//        
//        yearSpawner = OGYearLabelSpawner(texture: texture)
//        yearSpawner.position = CGPoint (x: 720, y: 900)
//        yearSpawner.size.height = 2 * yearSpawner.size.height
//        yearSpawner.size.width = 2 * yearSpawner.size.width
//        self.addChild(yearSpawner)
//        
//    }
//
//    
    
    

    
    
}
