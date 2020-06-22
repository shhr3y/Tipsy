//
//  TipBrain.swift
//  Tipsy
//
//  Created by Shrey on 14/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct TipBrain {
    var amount:Double = 0
    var percentage:Double = 0.2
    var split:Double = 1.0
    var result:Double = 0
    
    mutating func calcTip(_ userAmount:Double,_ userPercentage:Double,_ userSplit:Double){
        amount = userAmount
        percentage = userPercentage
        split = userSplit
        result = (userAmount + (userAmount * userPercentage))/userSplit
    }
    
    func getSetting()->(String){
        return "Split between \(String(format: "%.0f",split)) people, with \(Int(percentage*100))% tip!"
    }
}
