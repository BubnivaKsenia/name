//
//  ViewController.swift
//  calc
//
//  Created by 35 кабинет on 19.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNumber : Double = 0;
    var num1 : Double = 0;
    var num2 : Double = 0;
    var mathSign : Bool = false;
    var action : Int = 0;
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digit(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false;
        }
        else if sender.tag == 16{
            result.text = result.text! + "."
        }
        else {
            result.text = result.text! + String(sender.tag)
        }
        
        currentNumber = Double(result.text!)!
    }
    
    
    @IBAction func action(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            
            num1 = Double(result.text!)!
            
            if sender.tag == 11 { // division
                result.text = "/";
            }
            else if sender.tag == 12 { // multiplication
                result.text = "x";
            }
            else if sender.tag == 13 { // subtraction
                result.text = "-";
            }
            else if sender.tag == 14 { // addiiton
                result.text = "+";
            }
            
            action = sender.tag
            mathSign = true;
            
        }
        else if sender.tag == 15 { // equals
            if action == 11 {
                result.text = String(num1 / currentNumber)
            }
            else if action == 12 {
                result.text = String(num1 * currentNumber)
            }
            else if action == 13 {
                result.text = String(num1 - currentNumber)
            }
            else if action == 14 {
                result.text = String(num1 + currentNumber)
            }
        }
        else if sender.tag == 10 {
            result.text = ""
            num1 = 0
            currentNumber = 0
            action = 0
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}

