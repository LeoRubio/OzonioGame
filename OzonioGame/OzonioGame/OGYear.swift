



import UIKit

import SpriteKit



class OGYear : SKSpriteNode {
    
    init( texture: SKTexture ){
        
        super.init(texture: nil, color: UIColor.clearColor(), size: texture.size())
        self.name = "ano"
        cria()
    }
    
    
    func cria(){
        
        var strip = SKTexture(imageNamed: "ano")
        
        //move background right to left; replace
        var shiftBackground = SKAction.moveByX(-strip.size().width, y: 0, duration: 50)
        var replaceBackground = SKAction.moveByX(strip.size().width, y:0, duration: 0)

        var movingAndReplacingBackground = SKAction.repeatActionForever(SKAction.sequence([shiftBackground, replaceBackground]))
       
        for var i:CGFloat = 0; i<3; i++ {
            //defining background; giving it height and moving width
            var stripFull = SKSpriteNode(texture: strip)
            
            stripFull.size.height = self.size.height * 3
            stripFull.size.width = self.size.width * 3
            stripFull.position = CGPoint(x: 0 + (stripFull.size.width * i), y: CGRectGetMidY(self.frame))
            stripFull.runAction(movingAndReplacingBackground)
            
            self.addChild(stripFull)
        }
    }



    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    func update(){
        
        
        
    }
    
}
