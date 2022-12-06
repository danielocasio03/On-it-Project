//
//  ViewController.swift
//  On it! - Task Scheduling
//
//  Created by Daniel Efrain Ocasio on 11/2/22.
//

import UIKit

class MainVC: UIViewController {
	let colorManager = ColorManager()
	let segmentedControl = UISegmentedControl(items: ["Completed", "Pending", "Overdue"])
	let newTaskButton = UIButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = colorManager.color3
		segmentedControlConfig()
		newTaskButtonConfig()
	}
	
//MARK: - UI Element Configurations
	
	//SEGMENTED CONTROL - configuratiions for Segmented control
	func segmentedControlConfig() {
		view.addSubview(segmentedControl)
		segmentedControl.backgroundColor = colorManager.color1
		segmentedControl.selectedSegmentTintColor = colorManager.color2
		
		segmentedControl.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			segmentedControl.widthAnchor.constraint(equalToConstant: 390)]
		)
		}
	
	//NEWTASK UIBUTTON - configurations for the new task button on screen
	func newTaskButtonConfig () {
		view.addSubview(newTaskButton)
		newTaskButton.backgroundColor = colorManager.color2
		let plusImageConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .semibold, scale: .medium)
		let plusImage = UIImage(systemName: "plus", withConfiguration: plusImageConfig)
		newTaskButton.setImage(plusImage, for: .normal)
		newTaskButton.tintColor = colorManager.color3
		
		//Makes it to where when the button is clicked it runs the function for opening the user input screen
		newTaskButton.addTarget(self, action: #selector(self.newTaskHit), for: .touchUpInside)
		
		newTaskButton.layer.cornerRadius = 40
		newTaskButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			newTaskButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15),
			newTaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			newTaskButton.widthAnchor.constraint(equalToConstant: 80),
			newTaskButton.heightAnchor.constraint(equalToConstant: 80)
		])
	}
	
	@objc func newTaskHit() {
		present(UserInputVC(), animated: true)
	}
	
	
}

