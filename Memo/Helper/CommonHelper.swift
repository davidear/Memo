//
//  CommonHelper.swift
//  Memo
//
//  Created by dai.fengyi on 15/7/30.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

import Foundation
import MBProgressHUD

class CommonHelper: NSObject {
  //MARK:- HUD
  // 显示提示信息
  func showMsg(message: String) {
    let hud = CommonHelper.HUD()
    hud.labelText = message
    hud.mode = MBProgressHUDMode.Text
    hud.labelFont = UIFont.systemFontOfSize(13)
    hud.show(true)
    hud.hide(true, afterDelay: 1.0)
  }
  
  // 显示加载中...
  func showLoading(message: String?) {
    let hud = CommonHelper.HUD()
    hud.labelText = message
    hud.mode = MBProgressHUDMode.Text
    hud.labelFont = UIFont.systemFontOfSize(13)
    hud.show(true)
  }
  
  // 隐藏所有指示器
  func hideHUD() {
    let hud = MBProgressHUD(forView: APP.keyWindow)
    hud.hide(true)
  }
  
  //MARK: PRIVATE
  private class func HUD() ->MBProgressHUD {
    var hud = MBProgressHUD(forView: APP.keyWindow!)
    if hud != nil {
      hud .removeFromSuperview()
    }else {
      hud = MBProgressHUD(window:APP.keyWindow)
      hud.removeFromSuperViewOnHide = true
    }
    APP.keyWindow?.addSubview(hud)
    return hud
  }

  //MARK:-
  //检测手机号码是否合法
  func validateMobile(mobile: String) -> Bool {
    return true
  }
  //MARK:- ANIMATION
  
}
