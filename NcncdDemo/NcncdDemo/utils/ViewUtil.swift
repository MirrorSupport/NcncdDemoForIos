//
//  ViewUtil.swift
//  NcncdDemo
//
//  Created by lihaotian on 2017/11/17.
//  Copyright © 2017年 miao. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

/// 限制输入框字数
///
/// - Parameters:
///   - textF: 输入框
///   - length: 长度
func setUpTfLength(textF: UITextField , length: Int) {
    
    let text = textF.text!
    
    if text.count > length {
        
        textF.text = text.substring(to: text.index(before: text.endIndex))
    }
}

/// 弹出提示框
///
/// - Parameters:
///   - view: view层
///   - message: 内容
func showToast(view: UIView , message: String){
    
    let toast = MBProgressHUD(view: view)
    toast.mode = .text
    toast.label.text = message
    view.addSubview(toast)
    toast.show(animated: true)
    toast.hide(animated: true, afterDelay: 1)
}


