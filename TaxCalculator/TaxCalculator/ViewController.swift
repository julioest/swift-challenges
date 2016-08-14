//
//  ViewController.swift
//  TaxCalculator
//
//  Created by Julio Estrada on 8/2/16.
//  Copyright © 2016 julioest. All rights reserved.
//

import UIKit

var stateTaxes = [
    "CA", "CO", "NY", "TX"
]

class ViewController: UIViewController {

    let amountTextField: UITextField = UITextField()
    var stateSegmentedControl = UISegmentedControl(items: stateTaxes)
    var resultLabel: UILabel = UILabel()
    let calcButton: UIButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Amount Text Field
        amountTextField.frame = CGRect(x: 20, y: 100, width: 240, height: 40)
        amountTextField.placeholder = "Enter Amount"
        amountTextField.font = UIFont.systemFontOfSize(15)
        amountTextField.borderStyle = UITextBorderStyle.RoundedRect
//        amountTextField.keyboardType = UIKeyboardType.DecimalPad
        amountTextField.returnKeyType = UIReturnKeyType.Done
        amountTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        view.addSubview(amountTextField)
        
        // State Segmented Control
        stateSegmentedControl.frame = CGRect(x: 20, y: 40, width: 320, height: 30)
        stateSegmentedControl.selectedSegmentIndex = 0
        stateSegmentedControl.tintColor = UIColor.blueColor()
        stateSegmentedControl.addTarget(self, action: (#selector(segmentedValueChanged(_:))), forControlEvents: .AllEvents)
        view.addSubview(stateSegmentedControl)

        // Result Label
        resultLabel.frame = CGRect(x: 20, y: 160, width: 200, height: 20)
        resultLabel.textColor = UIColor.blackColor()
        resultLabel.text = "Result Label"
        view.addSubview(resultLabel)
        
        // Calculate Button
        calcButton.frame = CGRect(x: 20, y: 140, width: 300, height: 40)
    }

    func segmentedValueChanged(sender:UISegmentedControl!){
        print("State of: \(sender.selectedSegmentIndex)" )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

