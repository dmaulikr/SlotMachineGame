//
//  SlotMachine.swift
//  flatMachine
//
//  Created by Margo T on 2017-03-28.
//  Copyright © 2017 Margarita Tereshchenkova - ID: 300923592. All rights reserved.
//

import SpriteKit

class SlotMachine: SKSpriteNode {
    
    let ReelOne: SKSpriteNode = {
        let texture = SKTexture(image: #imageLiteral(resourceName: "cherry"))
        let node = SKSpriteNode(texture: texture, color: .white, size: CGSize(width: 55, height: 60))
        node.position = CGPoint(x: screenWidth * 0.67, y: screenHeight * 0.7)
        
        return node
    }()
    
    let ReelTwo: SKSpriteNode = {
        let texture = SKTexture(image: #imageLiteral(resourceName: "cherry"))
        let node = SKSpriteNode(texture: texture, color: .white, size: CGSize(width: 55, height: 60))
        node.position = CGPoint(x: screenWidth * 0.45, y: screenHeight * 0.7)
        
        return node
    }()
    
    let ReelThree: SKSpriteNode = {
        let texture = SKTexture(image: #imageLiteral(resourceName: "cherry"))
        let node = SKSpriteNode(texture: texture, color: .white, size: CGSize(width: 55, height: 60))
        node.position = CGPoint(x: screenWidth * 0.23, y: screenHeight * 0.7)
        
        return node
    }()
    
    let spinButton: SKSpriteNode = {
        let button = SKSpriteNode(imageNamed: "spinBtn")
        button.size = #imageLiteral(resourceName: "spinBtn").size
        button.position = CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.1)
        return button
    }()
    
    let balanceLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.text = "123456"
        label.fontSize = 30
        label.fontName = "Helvetica Neue Thin"
        label.fontColor = SKColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1)
        label.horizontalAlignmentMode = .right
        label.position = CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.35)
        return label
    }()
    
    let betLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.text = "25"
        label.fontSize = 30
        label.fontName = "Helvetica Neue Thin"
        label.fontColor = SKColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1)
        label.horizontalAlignmentMode = .right
        label.position = CGPoint(x: screenWidth * 0.2, y: screenHeight * 0.35)
        return label
    }()
    
    let winLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.text = "200"
        label.fontSize = 30
        label.fontName = "Helvetica Neue Thin"
        label.fontColor = SKColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1)
        label.horizontalAlignmentMode = .right
        label.position = CGPoint(x: screenWidth * 0.75, y: screenHeight * 0.35)
        return label
    }()


    
    init() {
        
        // initialize the object with an image
        let texture = SKTexture(image: #imageLiteral(resourceName: "slotMachine"))
        super.init(texture: texture, color: .white, size: #imageLiteral(resourceName: "slotMachine").size)
        Start()
        
        addChild(ReelOne)
        addChild(ReelTwo)
        addChild(ReelThree)
        addChild(spinButton)
        addChild(winLabel)
        addChild(betLabel)
        addChild(balanceLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func Start() {
        
        self.anchorPoint = CGPoint(x: -0.05, y: -1.25)
        
        //self.position.x = screenWidth * 0.5
        //self.position.y = screenHeight * 0.69

    }
    
    var playerStates: GameVar? {
        didSet{
            updatePlayerStates()
        }
    }
    
    func updatePlayerStates(){
        if let playerStates = playerStates{
 
            balanceLabel.text = "\(playerStates.balance)"
            betLabel.text = "\(playerStates.bet)"
            winLabel.text = "\(playerStates.wins)"
        }
        
    }
    
}
