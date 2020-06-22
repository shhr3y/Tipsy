//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Shrey on 14/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var tipResult = TipBrain()
    
    @IBOutlet var settingLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var recalculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recalculateButton.layer.cornerRadius = 10
        
        resultLabel.text = String(format: "%.2f", tipResult.result)
        settingLabel.text = tipResult.getSetting()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
