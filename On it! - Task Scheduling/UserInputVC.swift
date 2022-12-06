//
//  UserInputVC.swift
//  On it! - Task Scheduling
//
//  Created by Daniel Efrain Ocasio on 11/15/22.
//
import UIKit
import Foundation


class UserInputVC: UIViewController {
	let colorManager = ColorManager()
	let taskField = UITextField()
	let dateField = UITextField()
	let textSpacing = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 1))
	let datePicker = UIDatePicker()
	
	
	override func viewDidLoad() {
		view.backgroundColor = colorManager.color3
		taskFieldConfig()
		dateFieldConfig()
		
	}
	 
	
	func taskFieldConfig() {
		view.addSubview(taskField)
		//customization for textfield and text
		taskField.backgroundColor = colorManager.color1
		taskField.textColor = colorManager.color2
		taskField.attributedPlaceholder = NSAttributedString(
			string: "Enter your text here",
			attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
		
		//this is the config for adding spacing to the left side of the text field
		taskField.leftView = textSpacing
		taskField.leftViewMode = .always
		
		//customization for textfield location and look
		taskField.layer.cornerRadius = 6.0
		taskField.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			taskField.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
			taskField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			taskField.widthAnchor.constraint(equalToConstant: 325),
			taskField.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	//MARK: - DATEFIELD AND DATEPICKER SECTION
	func  dateFieldConfig() {
		view.addSubview(dateField)
		dateField.backgroundColor = colorManager.color1
		dateField.attributedPlaceholder = NSAttributedString(
			string: "Enter the date for your task",
			attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
	
		//this is the config for adding spacing to the left side of the text field
		dateField.leftView = textSpacing
		dateField.leftViewMode = .always
		
		//datePicker configurations and call to config function
		datePickerConfig()
		dateField.inputView = datePicker
		datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
		
		
		dateField.layer.cornerRadius = 6.0
		dateField.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			dateField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
			dateField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			dateField.widthAnchor.constraint(equalToConstant: 325),
			dateField.heightAnchor.constraint(equalToConstant: 50)])
	}
	//makes date picker in date mode and use wheels to display
	func datePickerConfig() {
		datePicker.datePickerMode = .date
		datePicker.preferredDatePickerStyle = .wheels
		
	}
	//this is called when the date is changed; date format is formatted and then set to the text of datefield
	@objc func dateChanged () {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MMMM dd, yyyy"
		let formattedDate = dateFormatter.string(from: datePicker.date)
		dateField.text = formattedDate
	}
	
	
	
}
