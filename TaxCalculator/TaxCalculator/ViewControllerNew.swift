//
//  ViewController.swift
//  TaxCalculator
//
//  Created by Julio Estrada on 8/2/16.
//  Copyright © 2016 julioest. All rights reserved.
//

import UIKit

let statesNew = ["CA", "CO", "NY", "TX"]
let taxPercentsNew = [0.075, 0.0925, 0.045, 0.0825]

class ViewControllerNew: UIViewController {
    
    let amountTextField: UITextField = UITextField()
    let statesSegmentedControl = UISegmentedControl(items: statesNew)
    let totalLabel: UILabel = UILabel()
    let calcButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        amountTextField.frame = CGRect(x: 20, y: 100, width: 300, height: 40)
        amountTextField.center.x = view.center.x
        amountTextField.placeholder = "Enter Amount"
        amountTextField.font = .systemFontOfSize(15)
        amountTextField.borderStyle = .RoundedRect
        amountTextField.keyboardType = .DecimalPad
        amountTextField.returnKeyType = .Done
        amountTextField.contentVerticalAlignment = .Center
        
        // State Segmented Control
        statesSegmentedControl.frame = CGRect(x: 20, y: 40, width: 320, height: 30)
        statesSegmentedControl.center.x = view.center.x
        statesSegmentedControl.selectedSegmentIndex = 0
        statesSegmentedControl.tintColor = .blueColor()
        //        statesSegmentedControl.addTarget(self, action: (#selector(segmentedValueChanged(_:))), forControlEvents: .AllEvents)
        
        
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
    
    
    // MARK: - Actions
    func buttonPressed(button: UIButton){
        var tax:Double = 0.0
        switch statesSegmentedControl.selectedSegmentIndex {
        case 1:
            tax  = taxPercentsNew[1]
            break
        case 2:
            tax = taxPercentsNew[2]
            break
        case 3:
            tax = taxPercentsNew[3]
            break
        default:
            tax = taxPercentsNew[0]
            break
        }
        
        let input = Double(self.amountTextField.text!)
        calculateTaxAmountWith(input!, tax: tax)
    }
    
    
    // MARK: - Private Methods
    func calculateTaxAmountWith(amount: Double, tax: Double) -> Double {
        let result = amount + (amount * tax)
        print(result)
        return result
    }
    
}

