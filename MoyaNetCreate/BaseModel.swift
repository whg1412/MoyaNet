//
//  BaseModel.swift
//  WisdomParty
//
//  Created by hg w on 2017/5/8.
//  Copyright © 2017年 tton. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseModel:Mappable {
    required init?(map: Map) {
        
    }
    
    var issuccess:Bool?
    var message:String?
    var datacount:Int?
    
    func mapping(map: Map) {
        issuccess <- map["issuccess"]
        message <- map["message"]
        datacount <- map["datacount"]
    }
}
