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
    var score = 0
    init(nome: String) {
        super.init()
        
        //Cria a label do score
        
        
        let scoreTextNode = SKLabelNode(fontNamed: "Copperplate")
        
        scoreTextNode.text = "\(nome) : \(score)"
        
        
     
        
        scoreTextNode.fontSize = 20
        scoreTextNode.fontColor = SKColor.whiteColor()
        scoreTextNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Center
        
        
        addChild(scoreTextNode)
        
        /*
        //Cria a labe do ano
        
        var year = 0
        let yearTextNode = SKLabelNode(fontNamed: "Copperplate")
        
        yearTextNode.text = "YEARS : \(year)"
        yearTextNode.fontSize = 20
        yearTextNode.fontColor = SKColor.whiteColor()
        
        yearTextNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        addChild(yearTextNode)
        */
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

/*
// adding score
scoreTextNode = OGLabel(nome: "SCORE")
scoreTextNode!.position = CGPointMake(size.width - 760, size.height - 20)
addChild(scoreTextNode!)

// adding years counting
scoreTextNode = OGLabel(nome: "YEARS")
scoreTextNode!.position = CGPointMake(size.width - 760, size.height - 40)
addChild(scoreTextNode!)
*/
