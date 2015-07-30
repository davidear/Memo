//
//  MMNoteCollectionViewController.swift
//  Memo
//
//  Created by dai.fengyi on 15/7/24.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

import UIKit
var i = 0
class MMNoteLayout: UICollectionViewFlowLayout {
  override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
    i++
    //    println("shouldInvalidateLayoutForBoundsChange \(i)")
    return true
  }
  
  override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
    //    println("layoutAttributesForElementsInRect \(i)")
    let offset = self.collectionView!.contentOffset
    var attrsArray = NSMutableArray(array: super.layoutAttributesForElementsInRect(rect)!)
    let topMinY = -collectionView!.contentInset.top
    let bottomMaxY = max(collectionView!.contentSize.height + collectionView!.contentInset.bottom - UIScreen.mainScreen().bounds.height, 0)
    
    if offset.y < topMinY {
      let headerSize = self.headerReferenceSize
      let deltaY = fabsf(Float(offset.y - topMinY) / 10)
      
      for a in attrsArray {
        if let attrs = a as? UICollectionViewLayoutAttributes {//从NSMutableArray中取元素，必须unwrap
          if attrs.representedElementKind == nil {//必须判断是否有值
            var headerRect = attrs.frame
            headerRect.origin.y = CGFloat(Float(headerRect.origin.y) + deltaY * Float(attrs.indexPath.section))
            attrs.frame = headerRect
          }
        }
      }
    }
    
    println("offset is \(offset.y), collectionView contentSize is \(collectionView?.contentSize.height)")
    if offset.y > bottomMaxY {
      let headerSize = self.headerReferenceSize
      let deltaY = fabsf(Float(offset.y - bottomMaxY) / 10)
      
      for a in attrsArray {
        if let attrs = a as? UICollectionViewLayoutAttributes {//从NSMutableArray中取元素，必须unwrap
          if attrs.representedElementKind == nil {//必须判断是否有值
            var headerRect = attrs.frame
            //            headerRect.origin.y = CGFloat(Float(headerRect.origin.y) + deltaY * Float(attrs.indexPath.section))
            headerRect.origin.y = collectionView!.contentSize.height + collectionView!.contentInset.bottom - 10 - CGFloat(deltaY) * CGFloat(collectionView!.numberOfSections() - attrs.indexPath.section) - CGFloat(20) * CGFloat(collectionView!.numberOfSections() - attrs.indexPath.section - 1) - CGFloat(44) * CGFloat(collectionView!.numberOfSections() - attrs.indexPath.section)
            attrs.frame = headerRect
          }
        }
      }
    }
    return attrsArray as [AnyObject]
  }
}

  let reuseIdentifier = "Cell"
  
  class MMNoteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ammount: UILabel!
  }
  
  class MMNoteCollectionViewController: UICollectionViewController {
    var dataArray: Array<Dictionary<String,String>>!
    @IBOutlet weak var noteLayout: MMNoteLayout!
    
    required init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      loadData()
    }
    override func viewDidLoad() {
      super.viewDidLoad()
      setUI()
    }
    
    private func loadData() {
      let path = NSBundle.mainBundle().pathForResource("NoteList", ofType: "plist")
      let arr = NSArray(contentsOfFile: path!)
      dataArray = arr as! Array
    }
    
    /*
    var minimumLineSpacing: CGFloat
    var minimumInteritemSpacing: CGFloat
    var itemSize: CGSize
    @availability(iOS, introduced=8.0)
    var estimatedItemSize: CGSize // defaults to CGSizeZero - setting a non-zero size enables cells that self-size via -preferredLayoutAttributesFittingAttributes:
    var scrollDirection: UICollectionViewScrollDirection // default is UICollectionViewScrollDirectionVertical
    var headerReferenceSize: CGSize
    var footerReferenceSize: CGSize
    var sectionInset: UIEdgeInsets*/
    private func setUI() {
      noteLayout.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.width - 40, 44)
      //    noteLayout.headerReferenceSize = CGSizeMake(UIScreen.mainScreen().bounds.width - 40, <#height: CGFloat#>)
      noteLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
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
      return dataArray.count
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      //#warning Incomplete method implementation -- Return the number of items in the section
      return 1
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
      
      // Configure the cell
      
      return cell
    }
    
    // MARK: UICollectionViewDelegate
//    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//      let noteEditVC = self.storyboard!.instantiateViewControllerWithIdentifier("NoteEditViewController") as! MMNoteEditViewController
//      self.navigationController!.pushViewController(noteEditVC, animated: true)
//    }
    
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
