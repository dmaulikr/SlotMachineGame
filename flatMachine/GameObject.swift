//
//  GameObject.swift
//  flatMachine
//
//  Created by Margo T on 2017-03-28.
//  Copyright © 2017 Margarita Tereshchenkova - ID: 300923592. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameObject: SKSpriteNode, GameProtocol {
    
    // Instance Variables

    var width:CGFloat?
    var height:CGFloat?

    var scale:CGFloat?

    
    // Constructor

    
    init(textureImage: UIImage) {
        
        let texture = SKTexture(image: textureImage)
        let color = UIColor.white
        super.init(texture: texture, color: color, size: texture.size())
        width = texture.size().width
        height = texture.size().height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func Reset() { }
    
    public func CheckBounds() { }
    
    public func Start() { }
    
    public func Update() { }
    
    
}
