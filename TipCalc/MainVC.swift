//
//  MainVC.swift
//  TipCalc
//
//  Created by Chad Comstock on 12/28/15.
//  Copyright © 2015 Chad Comstock. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var subtotalEntry: UITextField!
    @IBOutlet weak var percFromSlider: UILabel!
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var numOfPeople: UITextField!
    @IBOutlet weak var tipPerPerson: UILabel!
    @IBOutlet weak var perPersonText: UILabel!
    @IBOutlet weak var startOver: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // repeat the background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"light_checkered_tiles")!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        
        // set value for slider
        let currentValue = Int(sliderValue.value)
        
        // update text with value
        percFromSlider.text = "\(currentValue)%"
        
    }
    
    @IBAction func calculateTipPressed(sender: AnyObject) {
        
        // check that the fields are populated
        if subtotalEntry.text == nil {
            subtotalEntry.text = "$0.00"
        }
        
        if numOfPeople.text == nil {
            numOfPeople.text = "1"
        }
        
        let subtotal = Float(subtotalEntry.text!)
        let split = Float(numOfPeople.text!)
        let perc = Int(sliderValue.value)
        
        // perform calculation
        tipPerPerson.text = "$" + String(subtotal! * (Float(perc)/100) / split!)
        
        // unhide stuff
        tipPerPerson.hidden = false
        perPersonText.hidden = false
        startOver.hidden = false
        
        // resign keyboards
        subtotalEntry.resignFirstResponder()
        numOfPeople.resignFirstResponder()
        
    }
    
    @IBAction func startOverPressed(sender: AnyObject) {
        
        // restore the defaults
        tipPerPerson.hidden = true
        perPersonText.hidden = true
        startOver.hidden = true
        
        subtotalEntry.text = nil
        sliderValue.value = 20
        percFromSlider.text = "20%"
        numOfPeople.text = nil
        tipPerPerson.text = nil
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        subtotalEntry.resignFirstResponder()
        numOfPeople.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        subtotalEntry.resignFirstResponder()
        numOfPeople.resignFirstResponder()
    }
    
    
    
    

    
}
