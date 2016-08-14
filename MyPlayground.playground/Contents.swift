//: Playground - noun: a place where people can play

import UIKit

let amountTextField: UITextField = UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))

    // Amount Text Field
    amountTextField.placeholder = "Enter Amount Here"
    amountTextField.font = UIFont.systemFontOfSize(15)
    amountTextField.borderStyle = UITextBorderStyle.RoundedRect
    amountTextField.keyboardType = UIKeyboardType.DecimalPad
    amountTextField.returnKeyType = UIReturnKeyType.Done
    amountTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center



var dynamicLabel: UILabel = UILabel()

dynamicLabel.frame = CGRect(x: 20, y: 160, width: 200, height: 20)
dynamicLabel.textColor = UIColor.blackColor()
dynamicLabel.text = "Result Label"
