//
//  GameProtocol.swift
//  flatMachine
//
//  Created by Margo T on 2017-03-28.
//  Copyright © 2017 Margarita Tereshchenkova - ID: 300923592. All rights reserved.
//

protocol GameProtocol {
    func Reset()
    
    func CheckBounds()
    
    func Start()
    
    func Update()
}

