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
    
    
    func createFactory(factoryPosition: CGPoint, factoryType: String){
        
        var factoryNode : OGFactory?
        
        if factoryType == "Carbon"{
            //FÁBRICA BARCO
            factoryNode = OGCarbonFactory(factoryPosition: factoryPosition)
        }
        else if factoryType == "Nitrous"{
            //FÁBRICA PETROLEO
            factoryNode = OGNitrousFactory(factoryPosition: factoryPosition)
        }
        else if factoryType == "Nitric"{
            //FABRICA TERRESTRE
            factoryNode = OGNitricFactory(factoryPosition: factoryPosition)
        }

        self.addChild(factoryNode!)
        
        var smokeParticle : SKEmitterNode?
        let smokePath = NSBundle.mainBundle().pathForResource("smoke", ofType: "sks")
        smokeParticle = NSKeyedUnarchiver.unarchiveObjectWithFile(smokePath!) as? SKEmitterNode
        smokeParticle?.position = factoryNode!.position
        
        let rotate = SKAction.rotateByAngle(-1, duration: 60)
        smokeParticle!.runAction(SKAction.repeatActionForever(rotate))
        
        self.addChild(smokeParticle!)
    }
    

    
    
    
    //Chama o update de todos os filhos de Planeta
    func update(){
        
        self.enumerateChildNodesWithName("CARBONFACTORY") {
            node, stop in
            
            // CHAMA O UPDATE DE TODOS OS FILHOS CARBON FACTORY
            var factoryAux : OGCarbonFactory?
            factoryAux = node as? OGCarbonFactory
            factoryAux?.update()
            
            
        }
        
        self.enumerateChildNodesWithName("NITROUSFACTORY") {
            node, stop in
            
            // CHAMA O UPDATE DE TODOS OS FILHOS NITROUS FACTORY
            var factoryAux : OGNitrousFactory?
            factoryAux = node as? OGNitrousFactory
            factoryAux?.update()
            
            
        }
        
        self.enumerateChildNodesWithName("NITRICFACTORY") {
            node, stop in
            
            // CHAMA O UPDATE DE TODOS OS FILHOS NITRIC FACTORY
            var factoryAux : OGNitricFactory?
            factoryAux = node as? OGNitricFactory
            factoryAux?.update()
            
            
        }
        
    }
    
    func createObjects(){
        
        
        createOzoneLayer("ozonio")
        createAtmosphere("atmosfera")
        
        
        //Cria as camadas de ozonio com suas angulações
        
        for i in 0..<32 {
            
            var xPosition = sin(M_PI*(2.0 * Double(i)/32.0)) * 780
            var yPosition = cos(M_PI*(2.0 * Double(i)/32.0)) * 780
            var rotation:CGFloat = CGFloat(-M_PI*(2.0 * Double(i)/32.0 + 1/32.0))
            createOzoneParts("ozonePart", positionPart: CGPoint(x: xPosition, y: yPosition), rotationPart: rotation)
            
        }
    
        //   ********************************
            // POSICIONAR FABRICAS
            // CRIAR AVIAO CHILD
        
        createFactory(CGPointMake(randomNum(), randomNum()), factoryType: "Carbon")
        createFactory(CGPointMake(randomNum(), randomNum()), factoryType: "Nitrous")
        createFactory(CGPointMake(randomNum(), randomNum()), factoryType: "Nitric")

        createFactory(CGPointMake(randomNum(), randomNum()), factoryType: "Carbon")
        createFactory(CGPointMake(randomNum(), randomNum()), factoryType: "Nitrous")
        createFactory(CGPointMake(randomNum(), randomNum()), factoryType: "Nitric")
        
        createFactory(CGPointMake(randomNum(), randomNum()), factoryType: "Carbon")
        createFactory(CGPointMake(randomNum(), randomNum()), factoryType: "Nitrous")
        createFactory(CGPointMake(randomNum(), randomNum()), factoryType: "Nitric")

        
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

