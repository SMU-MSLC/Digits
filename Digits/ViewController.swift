//
//  ViewController.swift
//  Digits
//
//  Created by Eric Larson on 8/24/21.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var helloWorldLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.helloWorldLabel.text = "Hello MSLC World!"
    }

    @IBAction func buttonClicked(_ sender: Any) {
        
        self.helloWorldLabel.text = "Goodbye World!"
        
    }
    
}

