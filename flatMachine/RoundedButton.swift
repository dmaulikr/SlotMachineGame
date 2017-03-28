//
//  RoundedButton.swift
//  flatMachine
//
//  Created by Margo T on 2017-03-28.
//  Copyright © 2017 Margarita Tereshchenkova - ID: 300923592. All rights reserved.
//

import UIKit

private var rounded = false
private var cornerRadius = 5

extension UIButton {
    
    @IBInspectable var roundedButton : Bool {
        get {
            return rounded
        }
        
        set {
            rounded = newValue
            
            if rounded {
                self.layer.cornerRadius = CGFloat(cornerRadius)
            } else {
                self.layer.cornerRadius = CGFloat(cornerRadius)
            }
        }
        
    }
    
    @IBInspectable var radius: Int {
        get {
            return Int(cornerRadius)
        }
        
        set {
            cornerRadius = newValue
        }
    }
    
}

