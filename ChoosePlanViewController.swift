//
//  LocationViewController.swift
//  crosswordPuzzle
//
//  Created by Shalise Ayromloo on 4/14/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import UIKit

class ChoosePlanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } //closes viewDidLoad()
    

 

    @IBAction func choosePlanBasicButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "choosePlanToBasic", sender: self)
    } //closes IBAction
    
    
    
    @IBAction func choosePlanPlusButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "choosePlanToPlus", sender: self)
    }
    
} //closes class

