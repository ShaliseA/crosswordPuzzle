//
//  ReadyViewController.swift
//  crosswordPuzzle
//
//  Created by Shalise Ayromloo on 4/14/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import UIKit

class ReadyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    } //closes viewDidLoad()
    


    @IBAction func doneButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "mainVC") as! ViewController
        self.present(mainVC, animated: true, completion: nil)
    } //closes IBAction
    
} //closes class
