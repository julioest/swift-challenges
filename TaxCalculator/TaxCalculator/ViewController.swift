//
//  ViewController.swift
//  TaxCalculator
//
//  Created by Julio Estrada on 8/2/16.
//  Copyright © 2016 julioest. All rights reserved.
//

import UIKit

let states = ["CA", "CO", "NY", "TX"]
let taxPercents = [0.075, 0.0925, 0.045, 0.0825]

class ViewController: UIViewController {

    let amountTextField: UITextField = UITextField()
    let statesSegmentedControl = UISegmentedControl(items: states)
    let totalLabel: UILabel = UILabel()
    let calcButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Amount Text Field
        amountTextField.frame = CGRect(x: 20, y: 100, width: 300, height: 40)
        amountTextField.center.x = view.center.x
        amountTextField.placeholder = "Enter Amount"
        amountTextField.font = UIFont.systemFontOfSize(15)
        amountTextField.borderStyle = UITextBorderStyle.RoundedRect
        amountTextField.keyboardType = UIKeyboardType.DecimalPad
        amountTextField.returnKeyType = UIReturnKeyType.Done
        amountTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        
        // State Segmented Control
        statesSegmentedControl.frame = CGRect(x: 20, y: 40, width: 320, height: 30)
        statesSegmentedControl.center.x = view.center.x
        statesSegmentedControl.selectedSegmentIndex = 0
        statesSegmentedControl.tintColor = UIColor.blueColor()
//        statesSegmentedControl.addTarget(self, action: (#selector(segmentedValueChanged(_:))), forControlEvents: .AllEvents)


        // Result Label
        totalLabel.frame = CGRect(x: 20, y: 220, width: 300, height: 20)
        totalLabel.textColor = UIColor.blackColor()
        totalLabel.text = " "
        
        
        // Calculate Button
        calcButton.frame = CGRect(x: 20, y: 160, width: 300, height: 40)
        calcButton.center.x = view.center.x
        calcButton.backgroundColor = UIColor.blueColor()
        calcButton.setTitle("Calculate", forState: .Normal)
        calcButton.addTarget(self, action: #selector(buttonPressed(_:)), forControlEvents: .TouchUpInside)

        view.addSubview(amountTextField)
        view.addSubview(statesSegmentedControl)
        view.addSubview(totalLabel)
        view.addSubview(calcButton)
    }

//    func segmentedValueChanged(sender: UISegmentedControl!){
//        print("State: \(sender.selectedSegmentIndex)" )
//    }

//    func convertTaxPercent(percent: Double) -> Double {
//
//        var taxPercent: Double = 0.0
//
//        for tax in taxPercents {
//            taxPercent = taxPercent + tax
//        }
//
//        return taxPercent
//
//    }


    func buttonPressed(button: UIButton){

        // Testing out convertTaxPercent
        var taxPercent: Double = 0.0

        for tax in taxPercents {
            taxPercent = (100 * tax)
        }

        print(taxPercent)
    }


}

