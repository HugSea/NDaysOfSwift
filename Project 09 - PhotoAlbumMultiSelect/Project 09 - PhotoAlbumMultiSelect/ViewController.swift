//
//  ViewController.swift
//  Project 09 - PhotoAlbumMultiSelect
//
//  Created by 张庆杰 on 16/4/1.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit
import AssetsLibrary

private let margin: CGFloat = 0.0
private let itemWidth = (UIScreen.mainScreen().bounds.size.width - margin * 4) / 3.0

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var pictures: NSMutableArray? = NSMutableArray()
    var collectionView: UICollectionView?
    var imageArray: NSMutableArray = NSMutableArray()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if pictures!.count == 0 {
            pictures?.addObject(UIImage(named: "hp_add")!)
        }
        
        setupCollectionView()
        
        // 获取相册列表
        getPhotoGroupsList()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    // MARK: - UICollectionViewDataSource/Delegate

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures!.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("HomepageCell", forIndexPath: indexPath) as! HomepageCollectionViewCell
        cell.bgImageView?.image = pictures![indexPath.item] as? UIImage
        cell.bgImageView?.contentMode = (indexPath.item == (pictures?.count)! - 1 ? UIViewContentMode.Center : UIViewContentMode.ScaleAspectFill)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.item == pictures!.count - 1 {
            let destVc = PhotoAlbumCollectionViewController(collectionViewLayout: UICollectionViewLayout())
            destVc.photos = imageArray
            destVc.reloadBlock = {(selectedArray: NSMutableArray?) -> Void in
                self.pictures = selectedArray
                self.pictures?.addObject(UIImage(named: "hp_add")!)
                self.collectionView?.reloadData()
            }
            let nvDestVc = UINavigationController(rootViewController: destVc)
            self.presentViewController(nvDestVc, animated: true, completion: nil)
        }
    }
    
    // MARK: - Private Methods
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(itemWidth, itemWidth)
        layout.minimumInteritemSpacing = margin
        layout.minimumLineSpacing = margin
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        self.view.addSubview(collectionView!)
        collectionView?.registerClass(HomepageCollectionViewCell.self, forCellWithReuseIdentifier: "HomepageCell")
        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
}

extension ViewController {
    // 获取相册中所有的文件夹
    func getPhotoGroupsList() {
        let groupListBlock: ALAssetsLibraryGroupsEnumerationResultsBlock = {(group, stop) -> Void in
            // 过滤相片
            let onlyPhotosFilter = ALAssetsFilter.allPhotos()
            if let group = group {
                group.setAssetsFilter(onlyPhotosFilter)
                if group.numberOfAssets() > 0 {
                    self.getPhotosList(group)
                }
            }
        }
        self.defaultAssetsLibrary().enumerateGroupsWithTypes(ALAssetsGroupSavedPhotos, usingBlock: groupListBlock, failureBlock: nil)
    }
    // 单例
    func defaultAssetsLibrary() -> ALAssetsLibrary {
        struct Singleton {
            static var onceToken: dispatch_once_t = 0
            static var library: ALAssetsLibrary?
        }
        dispatch_once(&Singleton.onceToken) { () -> Void in
            Singleton.library = ALAssetsLibrary()
        }
        return Singleton.library!
    }
    
    // 获取文件夹中每一个相片对象
    func getPhotosList(group: ALAssetsGroup) {
        let photosListBlock: ALAssetsGroupEnumerationResultsBlock = {(asset, index, stop) -> Void in
            if asset != nil {
                if asset.valueForProperty(ALAssetPropertyType).isEqualToString(ALAssetTypePhoto) {
                    self.imageArray.addObject(UIImage(CGImage: asset.aspectRatioThumbnail().takeUnretainedValue()))
                }
            }
        }
        let onlyPhoto = ALAssetsFilter.allPhotos()
        group.setAssetsFilter(onlyPhoto)
        group.enumerateAssetsUsingBlock(photosListBlock)
    }
}
