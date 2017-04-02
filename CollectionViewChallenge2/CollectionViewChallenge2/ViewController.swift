//
//  ViewController.swift
//  CollectionViewChallenge2
//
//  Created by Gabrielle Brandenburg dos Anjos on 3/11/16.
//  Copyright © 2016 Gabrielle Brandenburg dos Anjos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!

    var array = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let margin = 0.01*width
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 5, right: margin)
        layout.minimumInteritemSpacing = margin
        layout.itemSize = CGSize(width: (width-(4*margin))/3, height: (width-(4*margin))/3)
        
        layout.minimumLineSpacing = margin

        //populate_array(50, array: array)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.white
        
        
        self.view.addSubview(collectionView)
        print(array.count)
        
    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.hidden = true
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.gray
        cell.label.text = "\(indexPath.row+1)"

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showPolygon", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPolygon" {
            
            let indexPaths = self.collectionView.indexPathsForSelectedItems!
            let indexPath = indexPaths[0] as IndexPath
        
            let vc = segue.destination as! ViewController2
            
            vc.sid = indexPath.row + 1
            
            
        }
    }
    
    func populate_array(_ numberOfItems: Int, array: [Int]) {
        var array = array
        for i in 0...numberOfItems {
            array.append(i)
        }
    }



}

