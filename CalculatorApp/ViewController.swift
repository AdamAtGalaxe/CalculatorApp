//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Adam Roberts on 1/10/22.
//

import UIKit

class ViewController: UIViewController {

    var inputNumber : Double?
    var total : Double = 0.0
    
    enum Operation {
        case addition
        case subtraction
        case multiplication
        case division
        case start
    }
    var operationChosen : Operation = .start
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func clear(_ sender: UIButton) {
        inputNumber = 0
        total = 0
        inputTextField.text?.removeAll()
        inputTextField.placeholder = "0.0"
        
    }
    @IBAction func add(_ sender: UIButton) {
        inputTextField.placeholder = ""
        calculate()
        operationChosen = .addition

    }
    
    @IBAction func subtract(_ sender: UIButton) {
        inputTextField.placeholder = ""
        calculate()
        operationChosen = .subtraction
        
    }
    @IBAction func multiply(_ sender: UIButton) {
        inputTextField.placeholder = ""
        calculate()
        operationChosen = .multiplication
    }
    @IBAction func divide(_ sender: UIButton) {
        inputTextField.placeholder = ""
        calculate()
        operationChosen = .division
        
    }
    @IBAction func calculate(_ sender: UIButton) {
        
        calculate()
        inputTextField.text?.removeAll()
        inputTextField.placeholder = String(total)
        operationChosen = .start
        //inputTextField.text?.removeAll()
        
    }
    func calculate(){
        
        storeInput(&inputNumber)
        //print(inputNumber!)
        guard let input1 = inputNumber else {
            print("Invalid inputNumber")
            return
            
        }

        switch operationChosen {
        case .addition:
            total += input1
        case .subtraction:
            total -= input1
        case .multiplication:
            total *= input1
        case .division:
            total /= input1
        case .start:
            total = input1
        }
        inputTextField.text?.removeAll()
        
    }
    func storeInput(_ inputNumber : inout Double?){
    
        guard let inputText = inputTextField.text else{
            print("Invalid inputText")
            return
        }
        
        inputNumber = Double(inputText )
        inputTextField.text?.removeAll()
    }

}

