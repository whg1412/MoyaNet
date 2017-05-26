//
//  NetProvider.swift
//  MoyaNetCreate
//
//  Created by hg w on 2017/5/26.
//  Copyright © 2017年 whg. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
import RxSwift

class NetProvider {
    deinit {
        print("provider被释放")
    }
    
    func netProviderRequest(enumType:NetAPI, ifShowActivity:Bool, ifCloseUserInterfaceInView:Bool, showInView:UIView, responseClosure: @escaping  (Any)-> Void, errorClosure:@escaping (Swift.Error)-> Void, complete:@escaping () -> Void) {
        let netProvider: RxMoyaProvider<NetAPI> = RxMoyaProvider<NetAPI>()
        
        //显示小菊花
        if ifShowActivity == true {
            HUDManager.showProgress(image: nil, title: nil, subTitle: nil)
        }
        
        netProvider.request(enumType).subscribe(onNext: { (response) in
            do{
                
                switch enumType {
                //TODO:评选记录
                case .SelectionRecord:
                    if let json = try response.mapJSON() as? Dictionary<String, Any> {
                        let uploadModel = Mapper<SelectionRecordModel>().map(JSON: json)
                        responseClosure(uploadModel!)
                    }
                //TODO:会议记录
                case .MeetingRecord:
                    if let json = try response.mapJSON() as? Dictionary<String, Any> {
                        let uploadModel = Mapper<MeetingJoinedListModel>().map(JSON: json)
                        responseClosure(uploadModel!)
                    }
                    
                }
                
                if ifShowActivity == true {
                    HUDManager.dismissHUD(after: 0, action: { (didTap) in
                        
                    })
                }
            }catch {
                if ifShowActivity == true {
                    HUDManager.dismissHUD(after: 0, action: { (didTap) in
                        
                    })
                }
            }
        }, onError: { (error) in
            errorClosure(error)
            if ifShowActivity == true {
                HUDManager.dismissHUD(after: 0, action: { (didTap) in
                    
                })
            }
        }, onCompleted: complete) {
            
            }.addDisposableTo(DisposeBag())
    }
}

