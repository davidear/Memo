//
//  MMNoteCollectionViewController.swift
//  Memo
//
//  Created by dai.fengyi on 15/7/24.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

import UIKit

class MMNoteLayout: UICollectionViewFlowLayout {
  override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
    return true
  }
  
  override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
    let offset = self.collectionView!.contentOffset
    var attrsArray = NSMutableArray(array: super.layoutAttributesForElementsInRect(rect)!)
    let minY = -collectionView!.contentInset.top
    
    if offset.y < minY {
      let headerSize = self.headerReferenceSize
      let deltaY = fabsf(Float(offset.y))
      
      for attrs in attrsArray {
        if attrs.representedElementKind == UICollectionElementKindSectionHeader {
          var headerRect = attrs.frame
          headerRect.origin.y  = max(minY, headerSize.height + CGFloat(deltaY))
          if var mutAtt = attrs as? UICollectionViewLayoutAttributes {
            mutAtt.frame = headerRect
          }
        }
//        if attrs.representedElementKind == UICollectionElementCategory.Cell {
//          var headerRect = attrs.frame
//          headerRect.origin.y = headerRect.origin.y + deltaY * attrs.indexPath.section
////          attrs.frame = headerRect
//        }
      }
    }
    
    return attrsArray as [AnyObject]
  }
}

let reuseIdentifier = "Cell"

class MMNoteCollectionViewController: UICollectionViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var layout = MMNoteLayout()
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
    layout.itemSize = CGSizeMake(300, 40)
    layout.headerReferenceSize = CGSizeMake(210, 20)
    self.collectionView?.collectionViewLayout = layout
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Register cell classes
//    self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    
    // Do any additional setup after loading the view.
  }
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  }
  */
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    //#warning Incomplete method implementation -- Return the number of sections
    return 8
  }
  
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //#warning Incomplete method implementation -- Return the number of items in the section
    return 2
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell

    // Configure the cell
    
    return cell
  }
  
  //MARK: UICollectionViewDelegateFlowLayout
  /*
  optional func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
  optional func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
  optional func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
  optional func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat
  optional func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
  optional func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
  */
  
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSizeMake(UIScreen.mainScreen().bounds.width - 40, 50)
  }
  
//  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
//    return self.collectionView!.contentOffset.y / CGFloat(10)
//    return 30
//  }
  
  
  // MARK: UICollectionViewDelegate
  
  /*
  // Uncomment this method to specify if the specified item should be highlighted during tracking
  override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
  return true
  }
  */
  
  /*
  // Uncomment this method to specify if the specified item should be selected
  override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
  return true
  }
  */
  
  /*
  // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
  override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
  return false
  }
  
  override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
  return false
  }
  
  override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
  
  }
  */
  
}
