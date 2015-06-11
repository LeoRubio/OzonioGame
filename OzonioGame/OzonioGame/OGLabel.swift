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
    let labelTextNode = SKLabelNode(fontNamed: "Avenir Medium")
    
    
    init(text: String, initialValue: Int) {
        
        super.init()
        
        //Cria a label
        labelName = text
        labelValue = initialValue
        labelTextNode.text = "\(labelName): \(labelValue)"
        
        labelTextNode.fontSize = 22
        labelTextNode.fontColor = SKColor.whiteColor()
        labelTextNode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        labelTextNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        
        addChild(labelTextNode)

        
    }
    
    func getValue() -> Int{
        return labelValue
    }
    
    func updateScore(#gameScore:Int){
        labelValue += gameScore
        labelTextNode.text = "\(labelName): \(labelValue)"
    }
    
    func updateYears() {
        labelValue++
        labelTextNode.text = "\(labelName): \(labelValue)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


