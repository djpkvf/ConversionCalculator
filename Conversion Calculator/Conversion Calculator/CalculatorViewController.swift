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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateConversion(number: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateConversion(number: Int) {
        if var convertFromText = convertFromTextField.text, let number = Character(UnicodeScalar(number)!) {
            convertFromText.insert(number, at: convertFromText.endIndex - 2)
        }
        convertToTextField.text = conversion.to.rawValue
    }
    
    func clearBoard() {
        convertFromTextField.text = conversion.from.rawValue
        convertToTextField.text = conversion.to.rawValue
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if let number = sender.titleLabel?.text {
            updateConversion(number: Int(number)!)
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
    @IBAction func clearPressed(_ sender: Any) {
        clearBoard()
    }
}
