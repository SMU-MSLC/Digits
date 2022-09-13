//
//  GuessViewController.swift
//  Digits
//
//  Created by Eric Larson on 9/13/22.
//

import UIKit

class GuessViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.textFieldGuess.delegate = self
    }
    
    @IBOutlet weak var feedbackLabel: UILabel!
    
    @IBOutlet weak var largeFeedbackLabel: UILabel!
    
    @IBOutlet weak var textFieldGuess: UITextField!
    
    @IBOutlet weak var guessButton: UIButton!
    var guessModel:GuessModel = GuessModel()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textFieldGuess.resignFirstResponder()
    }
    
    @IBAction func makeGuess(_ sender: Any) {
        
        if let guess = Int(self.textFieldGuess.text!),
        guess>0,
        guess<=100{
            var textToAdd = "\(guess)"
            switch self.guessModel.makeAGuess(guess) {
            case GuessValueLower:
                self.feedbackLabel.text = "Lower!"
                textToAdd += "<, "
            case GuessValueHigher:
                self.feedbackLabel.text = "Higher!"
                textToAdd += ">, "
            case GuessValueCorrect:
                self.feedbackLabel.text = "Correct!"
                textToAdd += " Right!! "
                self.guessButton.isEnabled = false
                
            default:
                print("never be here")
            }
            
            self.textFieldGuess.text = ""
            self.largeFeedbackLabel.text! += textToAdd
            
            
        }
    }
    
    @IBAction func tapGestureRecognized(_ sender: Any) {
        self.textFieldGuess.resignFirstResponder()
    }
}
