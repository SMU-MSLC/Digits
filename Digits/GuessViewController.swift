//
//  GuessViewController.swift
//  Digits
//
//  Created by Eric Larson on 9/13/22.
//

import UIKit

class GuessViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: UI Outlets
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var largeFeedbackLabel: UILabel!
    @IBOutlet weak var textFieldGuess: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    
    // MARK: Model
    var guessModel:GuessModel = GuessModel()
    
    // MARK: View Hierarchy Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.textFieldGuess.delegate = self
        self.textFieldGuess.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textFieldGuess.resignFirstResponder()
    }
    
    
    // MARK: UI Actions
    @IBAction func makeGuess(_ sender: Any) {
        
        if let guess = Int(self.textFieldGuess.text!),
        guess>0,
        guess<=100{
            // this is a valid guess, send to guessing
            DispatchQueue.main.async {
                self.interpret(guess: guess)
            }
            
        }else{
            // this is a valid guess, send to guessing
            DispatchQueue.main.async {
                self.feedbackLabel.text = "Please enter a valid integer 1-100"
            }
        }
    }
    
    @IBAction func tapGestureRecognized(_ sender: Any) {
        self.textFieldGuess.resignFirstResponder()
    }
    
    func interpret(guess:Int){
        // setup some animation for labels
        var anim = UIView.AnimationOptions.transitionCrossDissolve
        var duration = 0.33
        
        var textToAdd = "\(guess)"
        var textForLabel = ""
        switch self.guessModel.makeAGuess(guess) {
            case GuessValueLower:
                textForLabel = "Lower!"
                textToAdd += "<, "
            case GuessValueHigher:
                textForLabel = "Higher!"
                textToAdd += ">, "
            case GuessValueCorrect:
                textForLabel = "Correct!"
                textToAdd += " Correct!! "
                self.guessButton.isEnabled = false
                anim = .transitionFlipFromRight
                duration = 3.0
                self.textFieldGuess.resignFirstResponder()
                
            default:
                print("never be here")
        }
        
        
        // update the user feedback
        UIView.transition(with: self.largeFeedbackLabel,
              duration: duration,
              options: anim,
              animations: {
                    self.largeFeedbackLabel.text! += textToAdd
                          },
              completion: nil)
        
        
        // update the user feedback
        UIView.transition(with: self.feedbackLabel,
              duration: duration,
              options: anim,
              animations: {
            self.feedbackLabel.text = textForLabel
                          },
              completion: nil)
        
        self.textFieldGuess.text = ""
    }
}
