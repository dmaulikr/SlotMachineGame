//
//  SlotItem3.swift
//  flatMachine
//
//  Created by Margo T on 2017-03-28.
//  Copyright © 2017 Margarita Tereshchenkova - ID: 300923592. All rights reserved.
//

import SpriteKit

class SlotItem3: GameObject {
    
    init() {
        
        // initialize the object with an image
        super.init(imageString: "006-slot-machine", initialScale: 0.13)
        Start()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func _reset() {
    }
    
    private func _checkBounds() {
    }
    
    override func Start() {
        
        self.position.x = screenWidth! * 0.63
        self.position.y = screenHeight! * 0.7
        self.zPosition = 2
        
    }
    
    override func Update() {
    }
}
