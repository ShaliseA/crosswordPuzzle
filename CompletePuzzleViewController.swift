//
//  CompletePuzzleViewController.swift
//  crosswordPuzzle
//
//  Created by Shalise Ayromloo on 4/25/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import UIKit

class CompletePuzzleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } //closes viewDidLoad()
    

    @IBAction func continueToReady(_ sender: UIButton) {
        self.performSegue(withIdentifier: "enforcementToReady", sender: self)
    } //closes IBAction
    

} //closes class
