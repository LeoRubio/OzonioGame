//
//  OGLabel.swift
//  OzonioGame
//
//  Created by Pedro Lopes on 5/28/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGLabel: SKLabelNode {
    
    var labelValue = 0
    var labelName = ""
    let scoreTextNode = SKLabelNode(fontNamed: "Avenir Medium")
    
    
    init(text: String, initialValue: Int) {
        
        super.init()
        
        //Cria a label
        labelName = text
        labelValue = initialValue
        scoreTextNode.text = "\(labelName): \(labelValue)"
        
        scoreTextNode.fontSize = 22
        scoreTextNode.fontColor = SKColor.whiteColor()
        scoreTextNode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        scoreTextNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        
        addChild(scoreTextNode)

        
    }
    
    func getValue() -> Int{
        return labelValue
    }
    
    func updateScore(#gameScore:Int){
        labelValue += gameScore
        scoreTextNode.text = "\(labelName): \(labelValue)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


