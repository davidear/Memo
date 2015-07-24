//
//  MMTabBarController.swift
//  Memo
//
//  Created by dai.fengyi on 15/7/24.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

import UIKit

class MMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      initSubControllers()
    }
  private func initSubControllers() {
    let storyBoard = UIStoryboard(name: "Note", bundle: nil)
    self.viewControllers = [storyBoard.instantiateInitialViewController()]

    
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
