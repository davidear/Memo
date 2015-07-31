//
//  MMViewController.swift
//  Memo
//
//  Created by dai.fengyi on 15/7/31.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

import UIKit

class MMViewController: UIViewController {
  //MARK:- LIFE CYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    initSubviews()
    setUI()
    
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    registerNotification()
  }
  
  override func viewDidDisappear(animated: Bool) {
    super.viewDidDisappear(animated)
    removeNotification()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //MARK:- COMMON OPERATION
  func setUI() {
  
  }
  func initSubviews() {
  }
  
  func registerNotification() {
    NSNotificationCenter .defaultCenter() .addObserver(self, selector: Selector("keyboardWillChangeFrameNotification:"), name: UIKeyboardWillChangeFrameNotification, object: nil)
  }
  
  func removeNotification() {
    NSNotificationCenter .defaultCenter() .removeObserver(self)
  }
  
  //MARK: KEYBOARD
  func keyboardWillChangeFrameNotification(aNotification: NSNotification) {

  }
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
