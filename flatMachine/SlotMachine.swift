//
//  SlotMachine.swift
//  flatMachine
//
//  Created by Margo T on 2017-03-28.
//  Copyright © 2017 Margarita Tereshchenkova - ID: 300923592. All rights reserved.
//

import SpriteKit

class SlotMachine: GameObject {
    
    init() {
        
        // initialize the object with an image
        super.init(imageString: "slotMachine", initialScale: 1.35)
        Start()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _reset() {
        self.position.y = 0
    }
    
    private func _checkBounds() {
    }
    
    override func Start() {
        
        self.position.x = screenWidth! * 0.5
        self.position.y = screenHeight! * 0.7

    }
    
    override func Update() {
    }
}
