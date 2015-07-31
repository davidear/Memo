//
//  MMNoteEditViewController.swift
//  Memo
//
//  Created by dai.fengyi on 15/7/30.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

import UIKit
class MMNoteEditViewController: MMViewController {
  var editTextView: MMNoteEditTextView!
  
  //  required init(coder aDecoder: NSCoder) {
  //    super.init(coder: aDecoder)
  //    initSubviews()
  //
  //  }
  //  required init() {
  //    super.init(nibName: nil, bundle: nil)
  //    initSubviews()
  //  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    editTextView.locationInfo.text = "中国科学院深圳先进院"
  }
  
  override func setUI() {
    self.automaticallyAdjustsScrollViewInsets = true
    let rect = UIScreen .mainScreen().applicationFrame
    if let navBarHeight = self.navigationController?.navigationBar.bounds.height {
      //      containerHeightConstraint.constant = UIScreen.mainScreen().applicationFrame.height - navBarHeight
      editTextView.snp_makeConstraints{ (make) -> Void in
        make.top.equalTo(self.view).offset(0)
        make.left.equalTo(self.view).offset(0)
        make.right.equalTo(self.view).offset(0)
        make.bottom.equalTo(self.view).offset(0)
      }
    }
  }
  
  override func initSubviews() {
    editTextView = MMNoteEditTextView(frame: CGRectZero)
    self.view .addSubview(editTextView)
  }
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
  //MARK:- INHERIT
  override func keyboardWillChangeFrameNotification(aNotification: NSNotification) {
    let userInfo = aNotification.userInfo as! Dictionary<String, AnyObject>
    let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey]!.doubleValue
    let keyboardHeight = userInfo[UIKeyboardFrameEndUserInfoKey]!.CGRectValue().size.height
    let frame = self.view.frame
    //    editTextView.contentInset = UIEdgeInsetsMake(0, 0, keyboardHeight, 0)
    //    let range = self.editTextView.selectedRange
    
    //    self.editTextView.scrollRangeToVisible(range)
    //    UIView .animateWithDuration(animationDuration, animations: { () -> Void in
    //      
    //      
    //    })
  }
}
