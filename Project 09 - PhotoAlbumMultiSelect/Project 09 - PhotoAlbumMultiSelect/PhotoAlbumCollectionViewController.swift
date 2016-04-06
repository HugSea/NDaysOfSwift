//
//  PhotoAlbumCollectionViewController.swift
//  Project 09 - PhotoAlbumMultiSelect
//
//  Created by 张庆杰 on 16/4/5.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit
import AssetsLibrary

private let reuseIdentifier = "PhotoCell"
private let margin: CGFloat = 2.0
private let itemWidth = (UIScreen.mainScreen().bounds.size.width - 4 * margin) / 3.0

class PhotoAlbumCollectionViewController: UICollectionViewController {
    
    var photos: NSMutableArray?
    var selectedPhotos: NSMutableArray? = NSMutableArray()
    var completeBtn: UIBarButtonItem?
    var reloadBlock: ((selectedArray: NSMutableArray?) -> ())?
    
    // MARK - Life Cycle
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "相册"
        
        setupNavigationBar()
        
        setupCollectionView()
        
        setupBottomView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return (photos?.count)!
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PhotoCollectionViewCell
    
        cell.bgImageView.image = photos![indexPath.item] as? UIImage
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as? PhotoCollectionViewCell

        cell!.isSelectedBtn.selected = !cell!.isSelectedBtn.selected
        if cell?.isSelectedBtn.selected == true {
            selectedPhotos?.addObject(photos![indexPath.item])
        } else {
            if ((selectedPhotos?.containsObject(photos![indexPath.item])) != nil) {
                selectedPhotos?.removeObject(photos![indexPath.item])
            }
        }
        completeBtn?.enabled = selectedPhotos?.count == 0 ? false : true
        
        // Animation
        let keyAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        keyAnimation.duration = 0.25
        keyAnimation.autoreverses = true
        keyAnimation.values = [1.0, 1.2, 1.0]
        keyAnimation.fillMode = kCAFillModeForwards
        cell?.isSelectedBtn.layer.addAnimation(keyAnimation, forKey: nil)
    }

    // MARK: - Private Methods
    
    func setupCollectionView() {
        // Register cell classes
        self.collectionView!.registerNib(UINib(nibName: String(PhotoCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(itemWidth, itemWidth)
        layout.minimumInteritemSpacing = margin
        layout.minimumLineSpacing = margin
        layout.sectionInset = UIEdgeInsetsMake(0, 2, 0, 2)
        collectionView?.collectionViewLayout = layout
        collectionView?.backgroundColor = UIColor.whiteColor()
    }
    
    func setupNavigationBar() {
        let rightBarButton = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Done, target: self, action: "cancelAction")
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func cancelAction() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setupBottomView() {
        self.navigationController?.toolbarHidden = false
        let spaceItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        let completeItem = UIBarButtonItem(title: "完成", style: UIBarButtonItemStyle.Done, target: self, action: "completeAction")
        completeItem.enabled = false
        completeBtn = completeItem
        self.setToolbarItems([spaceItem, completeItem], animated: true)
    }
    
    func completeAction() {
        reloadBlock?(selectedArray: selectedPhotos)
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
