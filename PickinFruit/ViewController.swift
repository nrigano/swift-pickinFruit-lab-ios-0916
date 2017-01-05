//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.fruitPicker.delegate = self
        //self.fruitPicker.dataSource = self
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
    }
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        
        print("Spin button tapped")
//        let spin1 generate random numbers, turn into INTs for all 3
        let randomNum1:UInt32 = arc4random_uniform(UInt32(fruitsArray.count))
        let randomNum2:UInt32 = arc4random_uniform(UInt32(fruitsArray.count))
        let randomNum3:UInt32 = arc4random_uniform(UInt32(fruitsArray.count))
        
        fruitPicker.selectRow(Int(randomNum1), inComponent: 0, animated: true)
        fruitPicker.selectRow(Int(randomNum2), inComponent: 1, animated: true)
        fruitPicker.selectRow(Int(randomNum3), inComponent: 2, animated: true)
        
        if (randomNum1, randomNum2) == (randomNum2, randomNum3) {
            resultLabel.text = "WINNER!"
        }
        else {
            resultLabel.text = "Try again"
        }
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
    }
    

}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



