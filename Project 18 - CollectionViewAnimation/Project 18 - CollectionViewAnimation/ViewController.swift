//
//  ViewController.swift
//  Project 18 - CollectionViewAnimation
//
//  Created by 张庆杰 on 16/4/28.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let pictures = ["1", "2", "3", "4", "5"]
    let desc = "Our walking and cycling self-guided holidays give you the flexibility of choosing your own departure dates on any day of the week, when you stop for breaks along the way and if you simply want to spend the day relaxing. There are trips for all abilities and they’re suitable for families, groups and solo travellers."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - UICollectionViewDelegate/DataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HomeCell", forIndexPath: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.picImageView.image = UIImage(named: self.pictures[indexPath.item % 5])
        cell.descLabel.text = self.desc
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(UIScreen.mainScreen().bounds.size.width * 0.5, 250)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        guard let cell = collectionView.cellForItemAtIndexPath(indexPath) as? HomeCollectionViewCell else {
            return
        }
        cell.backBtn.hidden = false
        cell.superview!.bringSubviewToFront(cell)
        collectionView.scrollEnabled = false
        UIView.animateWithDuration(0.5) { () -> Void in
            cell.frame = collectionView.bounds
        }
        cell.backBlock = {
            cell.backBtn.hidden = true;
            collectionView.reloadItemsAtIndexPaths([indexPath])
            collectionView.scrollEnabled = true
        }
    }

}

