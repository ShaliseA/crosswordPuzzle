//
//  PositiveEnforcementViewController.swift
//  crosswordPuzzle
//
//  Created by Shalise Ayromloo on 4/25/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import UIKit

class PositiveEnforcementViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } //closes viewDidLoad()
    

    @IBAction func continueToCompleteButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "enforcementToCompletePuzzle", sender: self)
    } //closes IBAction
    

} //closes class
