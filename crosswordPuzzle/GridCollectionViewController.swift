//
//  ViewController.swift
//  crosswordPuzzle
//
//  Created by Shalise Ayromloo on 4/9/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//

import UIKit

class GridCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var gridSize: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: creating a grid
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        view.addConstraints([
            NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: collectionView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 20),
            NSLayoutConstraint(item: collectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: view.frame.width) ])
        
        
        /* ----------------------------------------------------------------------
         Generate one crossword
         ---------------------------------------------------------------------- */
        
        let crosswordsGenerator = CrosswordsGenerator(columns: 13, rows: 13, words: ["saffron", "pumpernickel", "leaven", "coda", "paladin", "syncopation", "albatross", "harp", "piston", "caramel", "coral", "dawn", "pitch", "fjord", "lip", "lime", "mist", "plague", "yarn", "snicker"])
        crosswordsGenerator.generate()
        
        _ = crosswordsGenerator.result
        
        /* ---------------------------------------------------------------------- */
        
        
        /* ----------------------------------------------------------------------
         Generate the best crossword in 10 attempts
         ---------------------------------------------------------------------- */
        
        /*let crosswordsGenerator = CrosswordsGenerator()
         crosswordsGenerator.words = ["saffron", "pumpernickel", "leaven", "coda", "paladin", "syncopation", "albatross", "harp", "piston", "caramel", "coral", "dawn", "pitch", "fjord", "lip", "lime", "mist", "plague", "yarn", "snicker"]
         crosswordsGenerator.columns = 10
         crosswordsGenerator.rows = 10
         
         var bestResult: Array<CrosswordsGenerator.Word> = Array()
         let attempts = 10
         
         for _ in 0 ..< attempts {
         crosswordsGenerator.generate()
         let result = crosswordsGenerator.result
         
         if result.count > bestResult.count {
         bestResult.removeAll()
         for word in result {
         bestResult.append(word)
         }
         }
         }*/
        
        /* ---------------------------------------------------------------------- */
        
        
        /* ----------------------------------------------------------------------
         Generate the best crossword in 60 seconds
         ---------------------------------------------------------------------- */
        
        /*let crosswordsGenerator = CrosswordsGenerator()
         crosswordsGenerator.words = ["saffron", "pumpernickel", "leaven", "coda", "paladin", "syncopation", "albatross", "harp", "piston", "caramel", "coral", "dawn", "pitch", "fjord", "lip", "lime", "mist", "plague", "yarn", "snicker"]
         crosswordsGenerator.columns = 10
         crosswordsGenerator.rows = 10
         crosswordsGenerator.debug = true
         crosswordsGenerator.emptySymbol = "*"
         
         var bestResult: Array<CrosswordsGenerator.Word> = Array()
         let startTime = NSDate()
         let timeInterval: TimeInterval = 3
         
         while (fabs(startTime.timeIntervalSinceNow) < timeInterval) {
         crosswordsGenerator.generate()
         let result = crosswordsGenerator.result
         
         if result.count > bestResult.count {
         bestResult.removeAll()
         for word in result {
         bestResult.append(word)
         }
         }
         }*/
        
        /* ---------------------------------------------------------------------- */
        
        
        /* ----------------------------------------------------------------------
         Generate one crossword with 'fill all words' mode
         ---------------------------------------------------------------------- */
        
        /*let crosswordsGenerator = CrosswordsGenerator(columns: 15, rows: 10, words: ["beijing", "havana", "rome", "paris", "amsterdam"])
         crosswordsGenerator.fillAllWords = true
         crosswordsGenerator.generate()
         
         let result = crosswordsGenerator.result
         print(result)*/
        
        /* ---------------------------------------------------------------------- */
        
        
        /* ----------------------------------------------------------------------
         Other tests with 'fill all words' mode
         ---------------------------------------------------------------------- */
        
        /*let crosswordsGenerator = CrosswordsGenerator()
         crosswordsGenerator.words = ["van", "bat", "fan", "jug", "mug"]
         //crosswordsGenerator.words = ["saffron", "pumpernickel", "leaven", "coda", "paladin", "syncopation", "albatross", "harp", "piston", "caramel", "coral", "dawn", "pitch", "fjord", "lip", "lime", "mist", "plague", "yarn", "snicker"]
         crosswordsGenerator.columns = 15
         crosswordsGenerator.rows = 15
         crosswordsGenerator.fillAllWords = true
         
         var bestResult: Array<CrosswordsGenerator.Word> = Array()
         let attempts = 1
         
         for _ in 0 ..< attempts {
         crosswordsGenerator.generate()
         let result = crosswordsGenerator.result
         
         if result.count > bestResult.count {
         bestResult.removeAll()
         for word in result {
         bestResult.append(word)
         }
         }
         }
         
         print("Max column: \(crosswordsGenerator.maxColumn())")
         print("Max row: \(crosswordsGenerator.maxRow())")
         print("Letters count: \(crosswordsGenerator.lettersCount())")*/
        
        /* ---------------------------------------------------------------------- */
        
        
        /* ----------------------------------------------------------------------
         Generate one crossword with 'fill all words' mode and orientation optimization mode
         ---------------------------------------------------------------------- */
        
        /*let crosswordsGenerator = CrosswordsGenerator(columns: 15, rows: 15, words: ["beijing", "havana", "rome", "paris", "amsterdam"])
         crosswordsGenerator.fillAllWords = true
         crosswordsGenerator.generate()
         
         let result1 = crosswordsGenerator.result
         print(result1)
         
         crosswordsGenerator.orientationOptimization = true
         crosswordsGenerator.generate()
         
         let result2 = crosswordsGenerator.result
         print(result2)*/
        
    } //closes viewDidLoad()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    } //closes didReceiveMemoryWarning()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(pow(Double(gridSize), 2))
    } //closes func
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    } //closes func
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        // Set up your cells here
        cell.backgroundColor = UIColor.white
        return cell
    } //closes func
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.width / gridSize - 1
        return CGSize(width: size, height: size)
    } //closes func
    
    
    
    
} //closes class

