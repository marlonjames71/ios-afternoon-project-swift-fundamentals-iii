//
//  ViewController.swift
//  Currency-Converter
//
//  Created by Marlon Raskin on 6/3/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class CurrencyConverterViewController: UIViewController {

	var currencyType: CurrencyType = .cad
	
	
	@IBOutlet var toCurrencyTextField: UITextField!
	@IBOutlet var fromCurrencyTextField: UITextField!
	@IBOutlet var toCurrencyLabel: UILabel!
	@IBOutlet var cadButton: UIButton!
	@IBOutlet var mxnButton: UIButton!
	@IBOutlet var convertButton: UIButton!
	
	@IBAction func cadButtonPressed(_ sender: UIButton) {
		cadButton.isSelected.toggle()
		mxnButton.isSelected = false
		toCurrencyLabel.text = "Currency (CAD)"
	}
	@IBAction func mxnButtonPressed(_ sender: UIButton) {
		mxnButton.isSelected.toggle()
		cadButton.isSelected = false
		toCurrencyLabel.text = "Currency (MXN)"
	}
	
	
	@IBAction func convertButtonPressed(_ sender: UIButton) {
		guard let userInput = fromCurrencyTextField.text else {
			fromCurrencyTextField.text = "Invalid amount entered"
			return
		}
		toCurrencyTextField.text = currencyFormatter.string(for: convert(dollars: Double(userInput) ?? 0.0, to: currencyType))
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor(red: 0.56, green: 0.89, blue: 0.83, alpha: 1)
		convertButton.backgroundColor = UIColor(red: 0.40, green: 0.22, blue: 0.94, alpha: 1)
		convertButton.tintColor = UIColor.white
		convertButton.layer.cornerRadius = 18
		cadButton.tintColor = UIColor(red: 0.40, green: 0.22, blue: 0.94, alpha: 1)
		cadButton.isSelected = true
		mxnButton.tintColor = UIColor(red: 0.40, green: 0.22, blue: 0.94, alpha: 1)
		
	}

	
	enum CurrencyType {
		case cad
		case mxn
	}
	
	var currencyFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		return formatter
	}()
	
	func convert(dollars: Double, to unit: CurrencyType) -> Double {
		let cad = dollars * 1.34
		let mxn = dollars * 19.77
		var outcome: Double
		
		switch unit {
		case .cad:
			outcome = cad
		case .mxn:
			outcome = mxn
		}
		return outcome
	}

}

