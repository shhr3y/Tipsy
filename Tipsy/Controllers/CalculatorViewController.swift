//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipBrain = TipBrain()
    var tipValue:Double = 0.2
    
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPercentButton: UIButton!
    @IBOutlet var tenPercentButton: UIButton!
    @IBOutlet var twentyPercentButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    @IBOutlet var calculateButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.layer.cornerRadius = 10
    }

    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        tipValue = buttonTitleAsANumber / 100
    }
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let amount = Double(billTextField.text!) ?? 0.0
        let split = Double(splitNumberLabel.text!)!
        
        tipBrain.calcTip(amount,tipValue,split)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestinationVC = segue.destination as! ResultsViewController
        DestinationVC.tipResult = tipBrain
    }
    
}

