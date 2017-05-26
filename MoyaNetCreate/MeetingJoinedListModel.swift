//
//  MeetingJoinedListModel.swift
//  WisdomParty
//
//  Created by hg w on 2017/5/12.
//  Copyright © 2017年 tton. All rights reserved.
//

import Foundation
import ObjectMapper

class MeetingJoinedListDataModel: Mappable {
    required init?(map: Map) {
        
    }
    
    var meeetingId:String?
    var title:String?
    var starttime:String?
    var peoplecount:Int?
    var usercount:Int?
    var astatus:Int?
    var status:Int?
    
    func mapping(map: Map) {
        meeetingId <- map["id"]
        title <- map["title"]
        starttime <- map["starttime"]
        peoplecount <- map["peoplecount"]
        usercount <- map["usercount"]
        astatus <- map["astatus"]
        status <- map["status"]
    }
}

class MeetingJoinedListModel: BaseModel {
    required init?(map: Map) {
        super.init(map: map)
    }
    
    var data:[MeetingJoinedListDataModel]?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        data <- map["data"]
    }
}
