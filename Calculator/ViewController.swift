//
//  ViewController.swift
//  Calculator
//
//  Created by yolanda yuan on 8/6/2017.
//  Copyright © 2017 yolanda yuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //unwrap 做的事情 （ a! ）就是提取 .Some 中的 value 变量
    @IBOutlet weak var display: UILabel!
    
    var userInTheMiddleOfTyping = false

    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }else {
            display.text = digit
            userInTheMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
           display.text = String(newValue)
        }
    }

    @IBAction func performOperation(_ sender: UIButton) {
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
                case "π":
                    displayValue = Double.pi
                case "√":
                    displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }
}
