//
//  CalculatorViewController.swift
//  Conversion Calculator
//
//  Created by Dominic Pilla on 7/26/17.
//  Copyright © 2017 Dominic Pilla. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var convertFromTextField: UITextField!
    @IBOutlet weak var convertToTextField: UITextField!
    
    var conversion = Conversion(convertFrom: Conversion.Symbols.fahrenheit, convertTo: Conversion.Symbols.celcius)
    var isDecimalAdded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearBoard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateConversion(number: String) {
        if let convertFromText = convertFromTextField, let number = UnicodeScalar(number) {
            convertFromText.text!.insert(Character(number), at: convertFromText.text!.index(convertFromText.text!.endIndex, offsetBy: -2))
            convertToTextField.text = conversion.convertValues(convertFrom: convertFromText.text!, convertTo: conversion.to)
        }
    }
    
    func clearBoard() {
        convertFromTextField.text = conversion.from.rawValue
        convertToTextField.text = conversion.to.rawValue
        isDecimalAdded = false
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if let number = sender.titleLabel?.text {
            if number == "." && isDecimalAdded == false && (convertFromTextField.text?.characters.count)! > 2 {
                isDecimalAdded = true
                updateConversion(number: number)
            } else if number == "." && isDecimalAdded == true {
                return
            } else {
                updateConversion(number: number)
            }
        }
    }
    

    @IBAction func converterPressed(_ sender: Any) {
        // this example uses the .actionSheet style.  It could be set to another style such as .alert
        let alert = UIAlertController(title: "Select Your Conversion", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Fahrenheit to Celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.conversion.to = .celcius
            self.conversion.from = .fahrenheit
            self.clearBoard()
        }))
        alert.addAction(UIAlertAction(title: "Celcius to Fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.conversion.to = .fahrenheit
            self.conversion.from = .celcius
            self.clearBoard()
        }))
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.conversion.to = .kilometers
            self.conversion.from = .miles
            self.clearBoard()
        }))
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.conversion.to = .miles
            self.conversion.from = .kilometers
            self.clearBoard()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signChangePressed(_ sender: Any) {
        if var convertFromText = convertFromTextField.text {
            if convertFromText.characters.count == 2 {
                return
            } else if convertFromText.contains("-") {
                convertFromText.remove(at: convertFromText.startIndex)
            } else {
                convertFromText = "-\(convertFromText)"
            }
            convertFromTextField.text = convertFromText
            convertToTextField.text = conversion.convertValues(convertFrom: convertFromText, convertTo: conversion.to)
        }
    }
    
    @IBAction func clearPressed(_ sender: Any) {
        clearBoard()
    }
}
