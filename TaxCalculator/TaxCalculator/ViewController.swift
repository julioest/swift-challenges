//
//  ViewController.swift
//  TaxCalculator
//
//  Created by Julio Estrada on 8/2/16.
//  Copyright © 2016 julioest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let arrayOfDicts = ["CA":0.075, "CO":0.0925, "NY":0.045, "TX":0.0825]
    var states:[String] = []
    var taxPercents:[Double] = []
    
    let amountTextField: UITextField = UITextField()
    let statesSegmentedControl = UISegmentedControl()
    let totalLabel: UILabel = UILabel()
    let calcButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    // MARK: - Private Methods
    func setupViews() {
        // Init table
        
        amountTextField.frame = CGRect(x: 20, y: 100, width: 300, height: 40)
        amountTextField.center.x = view.center.x
        amountTextField.placeholder = "Enter Amount"
        amountTextField.font = UIFont.systemFontOfSize(15)
        amountTextField.borderStyle = .RoundedRect
        amountTextField.keyboardType = .DecimalPad
        amountTextField.returnKeyType = .Done
        amountTextField.contentVerticalAlignment = .Center
        
        // State Segmented Control
        statesSegmentedControl.frame = CGRect(x: 20, y: 40, width: 320, height: 30)
        statesSegmentedControl.center.x = view.center.x
        statesSegmentedControl.tintColor = .blueColor()
        
        for state in arrayOfDicts {
            let stateString = state.0
            let taxValue = state.1
            states.append(stateString)
            taxPercents.append(taxValue)
            statesSegmentedControl.insertSegmentWithTitle(stateString, atIndex: states.count, animated: true)
        }
        statesSegmentedControl.selectedSegmentIndex = 0
        
        // Result Label
        totalLabel.frame = CGRect(x: 20, y: 220, width: 300, height: 20)
        totalLabel.textColor = .blackColor()
        totalLabel.text = " "
        
        
        // Calculate Button
        calcButton.frame = CGRect(x: 20, y: 160, width: 300, height: 40)
        calcButton.center.x = view.center.x
        calcButton.backgroundColor = .blueColor()
        calcButton.setTitle("Calculate", forState: .Normal)
        calcButton.addTarget(self, action: #selector(buttonPressed(_:)), forControlEvents: .TouchUpInside)
        
        view.addSubview(amountTextField)
        view.addSubview(statesSegmentedControl)
        view.addSubview(totalLabel)
        view.addSubview(calcButton)
    }
    
    func getTotalResultValue(enteredAmount: Double, tax: Double) -> Double {
        let result = enteredAmount + (enteredAmount * tax)
        totalLabel.text = "\(result)"
        return result
    }
    
    // MARK: - Actions
    func buttonPressed(button: UIButton){
        var taxPercent: Double = 0.0
        switch statesSegmentedControl.selectedSegmentIndex {
        default:
            taxPercent = taxPercents[statesSegmentedControl.selectedSegmentIndex]
        }
        let amount = Double(amountTextField.text!)
        getTotalResultValue(amount!, tax: taxPercent)
    }
}
