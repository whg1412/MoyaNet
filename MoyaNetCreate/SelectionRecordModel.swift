//
//  SelectionRecordModel.swift
//  WisdomParty
//
//  Created by hg w on 2017/5/25.
//  Copyright © 2017年 tton. All rights reserved.
//

import Foundation
import ObjectMapper

class SelectionRecordDataModel: Mappable {
    required init?(map: Map) {
        
    }
    
    var userfroum:Int? //判断当前登陆人是否投票 0没投，1投票
    var voteresult:Int? //投票结果 0任何人，1投票后可见
    var selectionId:String?
    var status:Int? //0已完成，1进行中
    var title:String?
    var starttime:String?
    
    func mapping(map: Map) {
        userfroum <- map["userfroum"]
        voteresult <- map["voteresult"]
        selectionId <- map["selectionId"]
        status <- map["status"]
        title <- map["title"]
        starttime <- map["starttime"]
    }
    
}

class SelectionRecordModel: BaseModel {
    required init?(map: Map) {
        super.init(map: map)
    }
    
    var data:[SelectionRecordDataModel]?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        data <- map["data"]
    }
}
