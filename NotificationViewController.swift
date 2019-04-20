//
//  NotificationViewController.swift
//  crosswordPuzzle
//
//  Created by Shalise Ayromloo on 4/14/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } //closes viewDidLoad()
    

    @IBAction func continueButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "notiToLocation", sender: self)
    } //closes IBAction
    

} //closes class
