//
//  MMNoteEditTextView.swift
//  Memo
//
//  Created by dai.fengyi on 15/7/31.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

import UIKit
import Colours
class MMNoteEditTextView: UITextView {
  var locationInfo: UILabel!
  var notebook: UIButton!
  var locationButton: UIButton!
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initSubviews()
    setUI()
  }
  override init(frame: CGRect, textContainer: NSTextContainer?) {
    super.init(frame: frame, textContainer: textContainer)
    initSubviews()
  }
  
  private func initSubviews() {
    locationInfo = UILabel()
    notebook = UIButton()
    locationButton = UIButton()
    self .addSubview(locationInfo)
    self .addSubview(notebook)
    self .addSubview(locationButton)
    setUI()
  }

  func setUI() {

    locationInfo.font = UIFont .systemFontOfSize(13)
    notebook .setImage(UIImage(named: "iconfont-bijiben"), forState: UIControlState.Normal)
    locationButton .setImage(UIImage(named: "iconfont-ditu"), forState: UIControlState.Normal)
  }
  
  override func layoutSubviews() {
    locationInfo.frame = CGRectMake(0, 0, self.bounds.width, 44)
//    locationInfo.backgroundColor = UIColor.redColor()
    notebook.frame = CGRectMake(8, CGRectGetMaxY(locationInfo.frame), 80, 30)
    locationButton.frame = CGRectMake(self.bounds.width - 8 - 30, notebook.frame.origin.y, 30, 30)
//    locationButton.backgroundColor = UIColor .redColor()
    self.textContainerInset = UIEdgeInsetsMake(CGRectGetMaxY(locationButton.frame), 0, 0, 0)
    
  }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
