//
//  Planet.swift
//  OzonioGame
//
//  Created by Leonardo Rubio 1 on 25/05/15.
//  Copyright (c) 2015 FantasyName. All rights reserved.
//

import UIKit
import SpriteKit





class OGPlanet : SKSpriteNode {
    
    init(){
        
        let texture = SKTexture(imageNamed: "terra")
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        name = "PLANET"
        self.size.width *= 1.3
        self.size.height *= 1.3
        //açao de girar Terra e Camadas
        let rotate = SKAction.rotateByAngle(1, duration: 60)
        self.runAction(SKAction.repeatActionForever(rotate))
        

        createObjects()

        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createOzoneLayer (imageName: String){
        
        let ozoneNode : OGOzoneLayer?
        
        let texture = SKTexture(imageNamed: imageName)
        
        ozoneNode = OGOzoneLayer(texture: texture)
        ozoneNode!.position = CGPoint (x: 0.0, y: 0.0)
        self.addChild(ozoneNode!)
    }
    

    
    func createAtmosphere (imageName: String){
        
        let atmosphereNode : OGAtmosphere?
        
        let texture = SKTexture(imageNamed: imageName)
        
        atmosphereNode = OGAtmosphere(texture: texture)
        atmosphereNode!.position = CGPoint (x: 0.0, y: 0.0)
        self.addChild(atmosphereNode!)
    }
    
    
    
    
    
    func createFactory(positionFactory: CGPoint){
        
        let factoryNode = OGCarbonFactory(factoryPosition: positionFactory)
        self.addChild(factoryNode)
        
    }
    
    func createOil (positionFactory: CGPoint){
    
        let factoryNitrousNode = OGNitrousFactory(factoryPosition: positionFactory)
        self.addChild(factoryNitrousNode)
    
    }
    
    func createBoat (positionFactory: CGPoint){
        let factoryNitricNode = OGNitricFactory(factoryPosition: positionFactory)
        self.addChild(factoryNitricNode)
    }
    
    
    //Chama o update de todos os filhos de Planeta
    func update(){
        
        self.enumerateChildNodesWithName("CARBONFACTORY") {
            node, stop in
            
            // CHAMA O UPDATE DE TODOS OS FILHOS CARBON FACTORY
            var factoryAux : OGCarbonFactory?
            factoryAux = node as? OGCarbonFactory
            factoryAux?.update()
            
            //stop.memory = true
            
        }
        
        self.enumerateChildNodesWithName("NITROUSFACTORY") {
            node, stop in
            
            // CHAMA O UPDATE DE TODOS OS FILHOS NITROUS FACTORY
            var factoryAux : OGNitrousFactory?
            factoryAux = node as? OGNitrousFactory
            factoryAux?.update()
            
            //stop.memory = true
            
        }
        
        self.enumerateChildNodesWithName("NITRICFACTORY") {
            node, stop in
            
            // CHAMA O UPDATE DE TODOS OS FILHOS NITRIC FACTORY
            var factoryAux : OGNitricFactory?
            factoryAux = node as? OGNitricFactory
            factoryAux?.update()
            
            //stop.memory = true
            
        }
        
    }
    
    func createObjects(){
        
        
        createOzoneLayer("ozonio")
        createAtmosphere("atmosfera")
        
        
        for i in 0..<32 {
            
            var xPosition = sin(M_PI*(2.0 * Double(i)/32.0)) * 780
            var yPosition = cos(M_PI*(2.0 * Double(i)/32.0)) * 780
            var rotation:CGFloat = CGFloat(-M_PI*(2.0 * Double(i)/32.0 + 1/32.0))
            createOzoneParts("ozonePart", positionPart: CGPoint(x: xPosition, y: yPosition), rotationPart: rotation)
            //xPosition += 157  ; yPosition -= 17  ; rotation -= 0.2
        }
    
//    ********************************
        // POSICIONAR FABRICAS
            // CRIAR AVIAO CHILD
        
        createFactory(CGPointMake(randomNum(), randomNum()))
        createBoat(CGPointMake(randomNum(), randomNum()))
        createOil(CGPointMake(randomNum(), randomNum()))
        createFactory(CGPointMake(randomNum(), randomNum()))
        createFactory(CGPointMake(randomNum(), randomNum()))
        createBoat(CGPointMake(randomNum(), randomNum()))
        createOil(CGPointMake(randomNum(), randomNum()))
        createFactory(CGPointMake(randomNum(), randomNum()))
        createFactory(CGPointMake(randomNum(), randomNum()))
        createBoat(CGPointMake(randomNum(), randomNum()))
        createOil(CGPointMake(randomNum(), randomNum()))

        
        //    ********************************

        
    }
    
    
    
    func createOzoneParts (imageName: String, positionPart : CGPoint, rotationPart : CGFloat){
        
        let ozonePartNode : OGOzonePart?
        let texture = SKTexture(imageNamed: imageName)
        ozonePartNode = OGOzonePart(texture: texture)
        ozonePartNode!.position = positionPart
        ozonePartNode!.zRotation = rotationPart
        self.addChild(ozonePartNode!)
        
    }
    
    
    
    func randomNum() -> CGFloat{
        var random = CGFloat(arc4random_uniform(400))
        if random > 200 {
            random = (random - 200) * -1
        }
        return random
    }
    
}

