//
//  ViewController.swift
//  Home Work 3. TSD
//
//  Created by Дмитрий Яковлев on 16.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var addNumbersLabel: UILabel!
    @IBOutlet weak var guessNumbersLabel: UILabel!
    @IBOutlet weak var wordReverseLabel: UILabel!
    
    @IBOutlet weak var twoNumbers: UIButton!
    @IBOutlet weak var guessNumbers: UIButton!
    @IBOutlet weak var wordReverse: UIButton!
    @IBOutlet weak var newPlayer: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidAllButton()
        
    }
    
    @IBAction func addNumbersAction(_ sender: UIButton) {
        
//        let textField = UITextField()
//        textField.keyboardType = .numberPad
        
        let alertController = UIAlertController(title: "Add two number", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter first number" }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter second number"  }
        
        let saveAction = UIAlertAction(title: "Result", style: .default) { (saveAction) in
               
            let firstTextField = Int((alertController.textFields?.first?.text)!)
            let secondTextField = Int((alertController.textFields?.last?.text)!)
            
            self.addNumbersLabel.text = "\(firstTextField! + secondTextField!)"
        }
        
        alertController.addAction(saveAction)
        
        self.present(alertController, animated: true, completion: nil)

    }
    
    
    
    
    @IBAction func guesNumberAction(_ sender: UIButton) {
        let guesAC = UIAlertController(title: "Gues tne number", message: "Enter number from 1 to 10", preferredStyle: .alert)
        
        guesAC.addTextField { (textField) in
            textField.placeholder = "Enter number" }
        
        let okAction = UIAlertAction(title: "Game", style: .default) { (okAction) in
            
            let randomNumber = Int.random(in: 1...10)
            let userNumber = guesAC.textFields?.first?.text
            if String(randomNumber) == userNumber {
                self.guessNumbersLabel.text = "You guessed the number"
               
            }else{
                self.guessNumbersLabel.text = "You didn't guess the number"
            }
            
        }
        guesAC.addAction(okAction)
        
        self.present(guesAC, animated: true, completion: nil)
    }
        
        
    
    @IBAction func wordReverseAction(_ sender: UIButton) {
        
        
        let reverseButton = UIAlertController(title: "Reverse word", message: nil, preferredStyle: .alert)
        reverseButton.addTextField { (textField) in
            textField.placeholder = "Enter word or phrase" }
        
        
        let wordAction = UIAlertAction(title: "Result", style: .default) { (wordAction) in
            
            
            let text = reverseButton.textFields?.first?.text ?? ""
            let newText = String(text.reversed())
            
            self.wordReverseLabel.text = newText
           
        }
        reverseButton.addAction(wordAction)
        
       present(reverseButton, animated: true, completion: nil)
        
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
      clearAllLabel()
        
    }
    
    @IBAction func newPlayerAction(_ sender: UIButton) {
        playerNameLabel.text = " "
hidAllButton()
clearAllLabel()
 startButton.isHidden = false
        
    }
    
    
    
    @IBAction func startButtonAction(_ sender: UIButton) {
       
       
        
        let alert = UIAlertController(title: "Player name:", message: nil, preferredStyle: .alert)
        let startButtons = UIAlertAction(title: "OK", style: .default) { (startButtons) in
            let text = alert.textFields?.first
            self.playerNameLabel.text! += ("Player name: ") + ((text?.text!)!)
            
            
        }

        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Player Name"
            
        }

        alert.addAction(startButtons)
            self.present(alert, animated: true, completion: nil)
        
        startButton.isHidden = true
        showAllButton()
        
    }
    
    
}

extension ViewController {
    private func hidAllButton(){
        twoNumbers.isHidden = true
        guessNumbers.isHidden = true
        wordReverse.isHidden = true
        newPlayer.isHidden = true
        clearButton.isHidden = true
    }
    private func clearAllLabel() {
        addNumbersLabel.text = " "
        guessNumbersLabel.text = " "
        wordReverseLabel.text = " "
    }
    private func showAllButton(){
        twoNumbers.isHidden = false
        guessNumbers.isHidden = false
        wordReverse.isHidden = false
        newPlayer.isHidden = false
        clearButton.isHidden = false
        
    }
}


/*
self.playerNameLabel.text?.isEmpty
self.showAlert(title: "Player name:", message: nil, style: .alert)
startButton.isHidden = true


extension ViewController {
    private func showAlert(title: String, message: String?, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            let text = alert.textFields?.first
            self.playerNameLabel.text! += ("Player name: ") + ((text?.text!)!)
        }
        alert.addTextField { (textField) in
            textField.placeholder = " "
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
*/
