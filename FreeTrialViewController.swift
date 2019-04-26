//
//  NotificationViewController.swift
//  crosswordPuzzle
//
//  Created by Shalise Ayromloo on 4/14/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import UIKit

class FreeTrialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } //closes viewDidLoad()
    

    
    @IBAction func freeTrialButton(_ sender: UIButton) {
         self.performSegue(withIdentifier: "freeTrialToChoosePlan", sender: self)
    } //closes IBAction
    
    
    
    @IBAction func exploreLaterButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "exploreLaterToWelcome", sender: self)
    }
    
    

    

} //closes class
