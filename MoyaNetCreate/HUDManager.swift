//
//  HUDManager.swift
//  WisdomParty
//
//  Created by hg w on 2017/3/30.
//  Copyright © 2017年 tton. All rights reserved.
//

import Foundation
import PKHUD

class HUDManager {
    fileprivate static let timeInterval:TimeInterval = 1.0
    
    
    //MARK:----提示(success,error),默认显示时间2秒
    static func showTip(tipType: HUDContentType!) {
        HUD.flash(tipType, delay: timeInterval)
    }
    
    
    //MARK:----提示文本
    static func showStringTip(content:String?) {
        HUD.flash(.label(content), delay: timeInterval)
    }
    
    //MARK:----加载(可以更换图片,默认不消失)
    static func showProgress(image:UIImage?, title:String?, subTitle:String?) {
        if image == nil {
            //HUD.show(.labeledProgress(title: title, subtitle: subTitle))
            HUD.flash(.labeledProgress(title: title, subtitle: subTitle), onView: UIApplication.shared.keyWindow, delay: 15, completion: nil)
        }else {
            HUD.show(.labeledRotatingImage(image: image, title: title, subtitle: subTitle))
        }
    }
    
    //MARK:----提示框消失
    static func dismissHUD(after:TimeInterval, action: @escaping (Bool) -> Void) {
        HUD.hide(afterDelay: after, completion: action)
    }
}



