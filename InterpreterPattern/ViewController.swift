//
//  ViewController.swift
//  InterpreterPattern
//
//  Created by Developer on 4/11/18.
//  Copyright © 2018 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var expressionInput: UITextField!
    @IBOutlet weak var evaluateButton: UIButton!
    @IBOutlet weak var resultText: UILabel!
    
    @IBAction func executeEvaluate(_ sender: UIButton) {
        let client = Client()
        resultText.text = client.parseString(input: expressionInput.text!).description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

