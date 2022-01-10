//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Adam Roberts on 1/10/22.
//

import UIKit

class ViewController: UIViewController {

    var inputNumber : Double?
    var total : Double
    
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
        inputNumber1 = 0
        total = 0
        inputTextField.text?.removeAll()
        outputLabel.text = "Answer"
    }
    @IBAction func add(_ sender: UIButton) {
        calculate()
        operationChosen = .addition

    }
    
    @IBAction func subtract(_ sender: UIButton) {
        operationChosen = .subtraction
        storeInput(inputNumber: &inputNumber1)
    }
    @IBAction func multiply(_ sender: UIButton) {
        operationChosen = .multiplication
        storeInput(inputNumber: &inputNumber1)
    }
    @IBAction func divide(_ sender: UIButton) {
        operationChosen = .division
        storeInput(inputNumber: &inputNumber1)
    }
    @IBAction func calculate(_ sender: UIButton) {
        storeInput(inputNumber: &inputNumber2)
        guard let input1 = inputNumber1 else {
            print("Invalid inputNumber1")
            return
            
        }
        guard let input2 = inputNumber2 else {
            print("Invalid inputNumber2")
            return}
        var answer : Double = 0
        switch operationChosen {
        case .addition:
            answer = input1 + input2
        case .subtraction:
            answer = input1 - input2
        case .multiplication:
            answer = input1 * input2
        case .division:
            answer = input1 / input2
        }
        outputLabel.text = String(answer)
    }
    func calculate(){
        guard let input = inputNumber else {
            print("Invalid inputNumber")
            return
            
        }
        switch operationChosen {
        case .start:
            total = input
        case .addition:
            total += input
        case .subtraction:
            total -= input
        case .multiplication:
            total *= input
        case .division:
            total /= input
        }
        inputTextField.text?.removeAll()
        
    }
    func storeInput(inputNumber : inout Double?){
    
        guard let inputText = inputTextField.text else{
            print("Invalid inputText")
            return
        }
        
        inputNumber = Double(inputText )
        inputTextField.text?.removeAll()
    }

}

