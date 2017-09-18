//
//  ViewController.swift
//  CalculatorSilver
//
//  Created by Julio Estrada on 8/26/17.
//  Copyright © 2017 jestrada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Properties
    let calculator = Calculator()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextfield()
    }

    // MARK: - Outlets
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var operationsSegmentendControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!

    // MARK: - Interactions
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let sliderValue = Int(sender.value)
        sliderValueLabel.text = String(sliderValue)
    }

    @IBAction func handleCalculate(_ sender: UIButton) {
        calculate()
    }

    // MARK: - Functions
    func setupTextfield() {
        textfield.delegate = self
        textfield.becomeFirstResponder()
        textfield.keyboardType = .decimalPad
    }

    func displayWarning(_ string: String) {
        totalLabel.textColor = .red
        totalLabel.text = string
    }

    func calculate() {
        // Check if user entered something in textfield
        guard let number = textfield.text, number != "" else {
            displayWarning("Please enter a number")
            return
        }

        // Check if user incremented slider
        guard let sliderValue = sliderValueLabel.text, sliderValue != "0" else {
            displayWarning("Please increment slider value")
            return
        }

        // Select operation and perform math
        let operation = operationsSegmentendControl.selectedSegmentIndex
        var total:Double = 0.00

        switch operation {
        case 0:
            total = calculator.add(a: number, b: sliderValue)
        case 1:
            total = calculator.subtract(a: number, b: sliderValue)
        case 2:
            total = calculator.multiply(a: number, b: sliderValue)
        case 3:
            total = calculator.divide(a: number, b: sliderValue)
        default:
            break
        }

        // Update total text label
        totalLabel.text = "Total: \(String(total))"
        totalLabel.textColor = .black
    }

    // MARK: - Textfield Setup

    // Only allow decimals digits, no letters
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty { return true }

        let currentText = textField.text ?? ""
        let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)

        return isValidDouble(replacementText, maxDecimalPlaces: 2)
    }

    // Check if replacementString is valid
    func isValidDouble(_ string: String, maxDecimalPlaces: Int) -> Bool {

        let formatter = NumberFormatter()
        formatter.allowsFloats = true
        let decimalSeparator = formatter.decimalSeparator ?? "."

        if formatter.number(from: string) != nil {
            let split = string.components(separatedBy: decimalSeparator)
            let digits = split.count == 2 ? split.last ?? "" : ""
            return digits.characters.count <= maxDecimalPlaces
        }

        return false
    }

    // Hide keyboard when user taps away
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.view.endEditing(true)
    }
}




















