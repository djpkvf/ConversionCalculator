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
        
        updateConversion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func appendNumber(_ number: Double) {
        
    }
    
    func updateConversion() {
        convertFromTextField.text = conversion.from.rawValue
        convertToTextField.text = conversion.to.rawValue
    }

    @IBAction func converterPressed(_ sender: Any) {
        // this example uses the .actionSheet style.  It could be set to another style such as .alert
        let alert = UIAlertController(title: "Select Your Conversion", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "fahrenheit to celcius", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.conversion.to = .celcius
            self.conversion.from = .fahrenheit
            self.updateConversion()
        }))
        alert.addAction(UIAlertAction(title: "celcius to fahrenheit", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.conversion.to = .fahrenheit
            self.conversion.from = .celcius
            self.updateConversion()
        }))
        alert.addAction(UIAlertAction(title: "miles to kilometers", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.conversion.to = .kilometers
            self.conversion.from = .miles
            self.updateConversion()
        }))
        alert.addAction(UIAlertAction(title: "kilometers to miles", style: UIAlertActionStyle.default, handler: {
            (alertAction) -> Void in
            self.conversion.to = .miles
            self.conversion.from = .kilometers
            self.updateConversion()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func clearPressed(_ sender: Any) {
        convertFromTextField.text = conversion.from.rawValue
        convertToTextField.text = conversion.to.rawValue
    }
    @IBAction func invertSignPressed(_ sender: Any) {
    }
    @IBAction func ninePressed(_ sender: Any) {
    }
    @IBAction func eightPressed(_ sender: Any) {
    }
    @IBAction func sevenPressed(_ sender: Any) {
    }
    @IBAction func sixPressed(_ sender: Any) {
    }
    @IBAction func fivePressed(_ sender: Any) {
    }
    @IBAction func fourPressed(_ sender: Any) {
    }
    @IBAction func threePressed(_ sender: Any) {
    }
    @IBAction func twoPressed(_ sender: Any) {
    }
    @IBAction func onePressed(_ sender: Any) {
    }
    @IBAction func decimalPressed(_ sender: Any) {
    }
    @IBAction func zeroPressed(_ sender: Any) {
    }
}
