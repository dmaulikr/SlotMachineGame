//
//  GameScene.swift
//  flatMachine
//
//  Created by Margo T on 2017-03-27.
//  Copyright © 2017 Margarita Tereshchenkova - ID: 300923592. All rights reserved.
//

import SpriteKit
import GameplayKit

let gravField = SKFieldNode.radialGravityField();
let screenSize = UIScreen.main.bounds
var screenWidth:CGFloat?
var screenHeight:CGFloat?

class GameScene: SKScene {
    
    var slotMachineSprite: SlotMachine?
    var slotItem1Sprite: SlotItem1?
    var slotItem2Sprite: SlotItem2?
    var slotItem3Sprite: SlotItem3?
    
    
    
    override func didMove(to view: SKView) {
        
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        
        // add SlotMachine
        slotMachineSprite = SlotMachine()
        self.addChild(slotMachineSprite!)
        
        // add item1
        slotItem1Sprite = SlotItem1()
        self.addChild(slotItem1Sprite!)
        
        // add item2
        slotItem2Sprite = SlotItem2()
        self.addChild(slotItem2Sprite!)
        
        // add item3
        slotItem3Sprite = SlotItem3()
        self.addChild(slotItem3Sprite!)

    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered

    }

    
}
