//
//  GameVars.swift
//  flatMachine
//
//  Created by Margo T on 2017-04-03.
//  Copyright © 2017 Margarita Tereshchenkova - ID: 300923592. All rights reserved.
//

import Foundation

class GameVar: NSObject {
    private var _balance = 999
    private var _wins = 0
    private var _jackpot = 5000
    private var _bet = 1
    
    var balance:Int{
        get{
            return _balance
        }
        set{
            _balance = newValue
        }
    }
    var wins: Int{
        get{
            return _wins
        }
        set{
            _wins = newValue
        }
    }
    var jackpot: Int{
        get{
            return _jackpot
        }
        set{
            _jackpot = newValue
        }
    }
    var bet: Int{
        get{
            return _bet
        }
        set{
            _bet = newValue
        }
    }
}

