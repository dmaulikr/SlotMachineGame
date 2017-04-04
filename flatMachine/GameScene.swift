//
//  GameScene.swift
//  flatMachine
//
//  Created by Margo T on 2017-03-27.
//  Copyright © 2017 Margarita Tereshchenkova - ID: 300923592. All rights reserved.
//

import SpriteKit
import GameplayKit


var screenSize = UIScreen.main.bounds
var screenWidth = screenSize.width
var screenHeight = screenSize.height

class GameScene: SKScene {
    
    
    var gameVar = GameVar()
    let slotMachine = SlotMachine()
    
    
    //: Set all variables
    
    let maxBet = 50
    
    enum itemsTally: String {
        
        case blank
        case slot
        case apple
        case orange
        case grapes
        case cherry
        case heart
        case diamond
        
    }
    
    var blanks = 0
    var slot = 0
    var apple = 0
    var orange = 0
    var grapes = 0
    var cherry = 0
    var heart = 0
    var diamond = 0
    
    
    
    override func didMove(to view: SKView) {
        
        addChild(slotMachine)
        showPlayerStates()
        
        
        //TODO: Score Manager

    }
    
    func showPlayerStates(){
        slotMachine.playerStates = gameVar
    }
    
    func resetGameVars(){
        gameVar.jackpot = 50000
        gameVar.bet = 0
        gameVar.balance = 1000
        gameVar.wins = 0
    }
    
    func resetTally(){
         blanks = 0
         slot = 0
         apple = 0
         orange = 0
         grapes = 0
         cherry = 0
         heart = 0
         diamond = 0
    }
    
    func makeBet(amount: Int){
        if gameVar.balance <= 0 {
            gameVar.bet = 0
            print("not enough money")
            return
        }
        
        if gameVar.balance >= (amount + gameVar.bet) {
            if gameVar.bet > maxBet {
                gameVar.bet = 1
            } else {
                gameVar.bet += amount
            }
            
        } else {
            if gameVar.bet >= gameVar.balance {
                gameVar.bet = 1
            } else {
                gameVar.bet += amount
            }
        }
    }
    
    func betMax() {
        if gameVar.balance >= maxBet {
            gameVar.bet = maxBet
        } else {
            gameVar.bet = gameVar.balance
        }
    }
    
    
    
    func determineWinnings(){
        if blanks == 0
        {
            if (grapes == 3) {
                gameVar.wins = gameVar.bet * 10;
            }
            else if(apple == 3) {
                gameVar.wins = gameVar.bet * 20;
            }
            else if (orange == 3) {
                gameVar.wins = gameVar.bet * 30;
            }
            else if (cherry == 3) {
                gameVar.wins = gameVar.bet * 40;
            }
            else if (slot == 3) {
                gameVar.wins = gameVar.bet * 50;
            }
            else if (heart == 3) {
                gameVar.wins = gameVar.bet * 75;
            }
            else if (diamond == 3) {
                gameVar.wins = gameVar.bet * 100;
            }
            else if (grapes == 2) {
                gameVar.wins = gameVar.bet * 2;
            }
            else if (apple == 2) {
                gameVar.wins = gameVar.bet * 2;
            }
            else if (orange == 2) {
                gameVar.wins = gameVar.bet * 3;
            }
            else if (cherry == 2) {
                gameVar.wins = gameVar.bet * 4;
            }
            else if (slot == 2) {
                gameVar.wins = gameVar.bet * 5;
            }
            else if (heart == 2) {
                gameVar.wins = gameVar.bet * 10;
            }
            else if (diamond == 2) {
                gameVar.wins = gameVar.bet * 20;
            }
            else if (diamond == 1) {
                gameVar.wins = gameVar.bet * 5;
            }
            else {
                gameVar.wins = gameVar.bet * 1;
            }
            
            gameVar.balance += gameVar.wins
        }
        else
        {
            gameVar.balance -= gameVar.bet
            gameVar.wins = 0
            makeBet(amount: 0) // use to revalidate remaining credit
            print("you lose")
        }
        
        resetTally()
        
    }
    
    func reels(){
        if gameVar.bet == 0 {
            print("can't spin when bet coin is 0")
            return
        }
        var betLine:[itemsTally] = [itemsTally.blank,itemsTally.blank,itemsTally.blank]
        
        var outcome = [0,0,0]
        
        for spin in 0...2 {
            outcome[spin] = GKARC4RandomSource().nextInt(upperBound: 65) + 1
            getBetLineValue(betLineValue: &betLine[spin], outComeValue: outcome[spin])
            
            //see real value
            //print(outcome[spin])
            print(betLine[spin])
            
        }
        print("--------")
        
        getBetLineImage(betLine: betLine)
        //checkJackPot()
        determineWinnings()
    }
    
    func getBetLineImage(betLine: [itemsTally]) {
        slotMachine.ReelOne.texture = SKTexture(imageNamed: betLine[0].rawValue)
        slotMachine.ReelTwo.texture = SKTexture(imageNamed: betLine[1].rawValue)
        slotMachine.ReelThree.texture = SKTexture(imageNamed: betLine[2].rawValue)

    }
    
    func getBetLineValue(betLineValue:inout itemsTally ,outComeValue: Int) {
        switch outComeValue {
        // 41.5% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 1, upperBounds: 27):
            betLineValue = .blank
            blanks += 1
        // 15.4% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 28, upperBounds: 37):
            betLineValue = .grapes
            grapes += 1
        // 13.8% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 38, upperBounds: 46):
            betLineValue = .apple
            apple += 1
        // 12.3% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 47, upperBounds: 54):
            betLineValue = .orange
            orange += 1
        //  7.7% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 55, upperBounds: 59):
            betLineValue = .cherry
            cherry += 1
        //  4.6% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 60, upperBounds: 62):
            betLineValue = .slot
            slot += 1
        //  3.1% probability
        case checkRange(outComeValue: outComeValue, lowerBounds: 63, upperBounds: 64):
            betLineValue = .heart
            heart += 1
        case checkRange(outComeValue: outComeValue, lowerBounds: 65, upperBounds: 65):
            betLineValue = .diamond
            diamond += 1
        default:
            betLineValue = .blank
            blanks += 1
        }
    }
    
    func checkRange(outComeValue value:Int, lowerBounds:Int, upperBounds: Int) -> Int{
        if value >= lowerBounds && value <= upperBounds {
            return value
        } else {
            return 0
        }
    }
    

    func touchUp(atPoint pos : CGPoint) {
        if slotMachine.spinButton.contains(pos){
            reels()
            //print("spinButton Tapped")
        } else if slotMachine.tenBetButton.contains(pos) {
            makeBet(amount: 10)
            print("bet 10")
        } else if slotMachine.maxBetButton.contains(pos) {
            betMax()
            print("bet Max")
        } else if slotMachine.resetButton.contains(pos) {
            resetGameVars()
            print("reset")
        } else if slotMachine.exitButton.contains(pos) {
            let exitScene = ExitScene(size: (self.view?.frame.size)!)
            self.scene?.view?.presentScene(exitScene)
            print("exit")
        }
        slotMachine.updatePlayerStates()
    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

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

    
}
