//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Adam Roberts on 1/10/22.
//

import UIKit

class ViewController: UIViewController {

    var inputNumber : Double = 0
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func clear(_ sender: UIButton) {
        if(inputTextField.text!.isEmpty){
            print("here")
            inputNumber = 0
            total = 0
            inputTextField.text?.removeAll()
            inputTextField.placeholder = "0.0"
        }
        else{
            inputTextField.text?.removeAll()
        }
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
    @IBAction func one(_ sender: UIButton) {
        inputTextField.insertText("1")
    }
    @IBAction func two(_ sender: UIButton) {
        inputTextField.insertText("2")
    }
    @IBAction func three(_ sender: UIButton) {
        inputTextField.insertText("3")
    }
    @IBAction func four(_ sender: UIButton) {
        inputTextField.insertText("4")
    }
    @IBAction func five(_ sender: UIButton) {
        inputTextField.insertText("5")
    }
    @IBAction func six(_ sender: UIButton) {
        inputTextField.insertText("6")
    }
    @IBAction func seven(_ sender: UIButton) {
        inputTextField.insertText("7")
    }
    @IBAction func eight(_ sender: UIButton) {
        inputTextField.insertText("8")
    }
    @IBAction func nine(_ sender: UIButton) {
        inputTextField.insertText("9")
    }
    @IBAction func zero(_ sender: UIButton) {
        inputTextField.insertText("0")
    }
    @IBAction func negative(_ sender: UIButton) {
        guard var digit = Double(inputTextField.text!) else{
            print("Invalid inputText")
            return
        }
        digit *= -1
        inputTextField.text = String(digit)
        
    }
    @IBAction func decimal(_ sender: UIButton) {
        inputTextField.insertText(".")
    }
    
 
    func storeInput(_ inputNumber : inout Double){
        
        var temp : Double
        //? = Double(inputTextField.text!)

        if let inputText = Double(inputTextField.text!){
            print("unwrapped")
            temp = inputText

        }
        else{
            temp = total
        }
        inputNumber = temp
        inputTextField.text?.removeAll()

    }
    
    func calculate(){
        storeInput(&inputNumber)

        switch operationChosen {
            case .addition:
                total += inputNumber
            case .subtraction:
                total -= inputNumber
            case .multiplication:
                total *= inputNumber
            case .division:
                total /= inputNumber
            case .start:
                total = inputNumber
        }
        inputTextField.text?.removeAll()
    }
}

