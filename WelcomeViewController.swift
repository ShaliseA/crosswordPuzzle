//
//  WelcomeViewController.swift
//  crosswordPuzzle
//
//  Created by Shalise Ayromloo on 4/25/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } //closes viewDidLoad()
    


    @IBAction func startTourButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "welcomeToSamplePuzzle", sender: self)
    } //closes IBAction
    
    
    
    @IBAction func skipTourButton(_ sender: UIButton) {
    }
    
} //closes class
