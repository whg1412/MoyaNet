//
//  NetAPI.swift
//  MoyaNetCreate
//
//  Created by hg w on 2017/5/26.
//  Copyright © 2017年 whg. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public enum NetAPI {
    //MARK:----个人中心
    //TODO:视频记录
    case SelectionRecord(userid:Int, rows:Int, page:Int)
    //TOOD:会议记录
    case MeetingRecord(userid:Int, rows:Int, page:Int)
    
}

extension NetAPI:TargetType {
    //域名
    public var baseURL: URL {
        return URL.init(string: "http://api.dj.ttonservice.com/")!
    }
    
    //路径
    public var path: String {
        switch self {
        case .SelectionRecord:
            return "v1/view/select/list"
        case .MeetingRecord:
            return "v1/meeting/management/list"
        default:
            break
        }
        
    }
    
    //请求方法
    public var method:Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    //参数
    public var parameters: [String: Any]? {
        switch self {
        case let .SelectionRecord(userid, rows, page):
            return ["userid":userid, "rows":rows, "page":page]
        case let .MeetingRecord(userid, rows, page):
            return ["userid":userid, "rows":rows, "page":page]
        default:
            break
        }
    }
    
    //请求类型
    public var task: Task {
        return .request
    }
    
    
    //是否有效
    public var validate: Bool {
        return true
    }
    
    //参数编码
    public var parameterEncoding: ParameterEncoding {
        switch self {
        default:
            return URLEncoding.default
        }
        
    }
    
    public var sampleData: Data {
        return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
        
    }
}

