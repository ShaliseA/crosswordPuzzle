//
//  SamplePuzzleViewController.swift
//  crosswordPuzzle
//
//  Created by Shalise Ayromloo on 4/25/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import UIKit

class SamplePuzzleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } //closes viewDidLoad()
    

 
    @IBOutlet var samplePuzzleTextFields: [UITextField]!
    
    @IBAction func textFieldsTapped(_ sender: UITextField) {
        
        self.performSegue(withIdentifier: "blankBox1", sender: self)
        //
            
       
        
    } //closes IBAction
    
} //closes class
