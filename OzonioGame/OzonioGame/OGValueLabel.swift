//
//  OGValueLabel.swift
//  OzonioGame
//
//  Created by Pedro Lopes on 5/28/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit

class OGValueLabel : SKLabelNode {
    
    var labelValue = 0
    var labelName = "", labelText = ""
    let labelTextNode = SKLabelNode(fontNamed: "Avenir Medium")
    
    
    init(text: String, initialValue: Int) {
        
        super.init()
        
        //Cria a label
        labelName = text
        labelValue = initialValue
        
        labelText = "\(labelName): \(labelValue)"
        
        labelTextNode.text = labelText
        
        labelTextNode.fontSize = 22
        labelTextNode.fontColor = SKColor.whiteColor()
        labelTextNode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        labelTextNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        
        addChild(labelTextNode)

        
    }
    
    func getValue() -> Int{
        return labelValue
    }
    
    func updateText(){
        labelText = "\(labelName): \(labelValue)"
    }
    
    func updateScore(#gameScore:Int){
        
        labelValue += gameScore
        
        //Garante que não tenha score negativo!
        if labelValue < 0{
            labelValue = 0
        }
        
        updateText()
        labelTextNode.text = labelText
    }
    
    func updateYears() {
        labelValue++
        
        updateText()
        labelTextNode.text = labelText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


