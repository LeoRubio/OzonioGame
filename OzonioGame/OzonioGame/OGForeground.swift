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
    var labelScore : OGLabel?
    var labelYears : OGLabel?
    var sceneSize : CGSize?
    
    init(size: CGSize){
        
        super.init()
        
        sceneSize = size
        self.zPosition = -2
        createObjects()
        
        //Atualiza o ano a cada X segundos
        runAction(SKAction.repeatActionForever(SKAction.sequence([
            
            SKAction.waitForDuration(1.5),
            
            SKAction.runBlock({
                labelYears?.updateYears()
            }),
            
            
            ])))
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createObjects(){
        
        createScoreYearLabels()
        createYearStripNode()
        createPlayNode()
        
    }
    
    
    func createScoreYearLabels(){
        
        labelScore = OGLabel(text: "SCORE", initialValue: 0)
        labelScore!.position = CGPoint (x: sceneSize!.width/20.0, y: sceneSize!.height/1.1)
        self.addChild(labelScore!)
        
        labelYears = OGLabel(text: "YEAR", initialValue: 2015)
        labelYears!.position = CGPoint (x: sceneSize!.width/20.0, y: sceneSize!.height/1.15)
        self.addChild(labelYears!)
        
        
    }
    

    
    func createPlayNode(){
        
        playNode = OGPlayPauseNode()
        playNode!.position = CGPoint (x: 720, y: 900)
        playNode!.size.height = 2 * playNode!.size.height
        playNode!.size.width = 2 * playNode!.size.width
        addChild(self.playNode!)
        
    }
    
    func createYearStripNode(){
        let yearStrip = OGYearStrip()
        addChild(yearStrip)
        
    }
    
    
    
}
