//
//  NetUtils.swift
//  SwiftyKit
//
//  Created by javar on 2018/9/21.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation
import Alamofire

public enum HttpMethod {
    case get
    case post
}

public typealias Parameters = [String: Any]

public class NetUtils {
    
    class func request(_ type : HttpMethod, URLString : String, parameters : [String : Any]? = nil, successed :  @escaping (_ result : Any) -> (),failed:@escaping (_ error:Error) -> ()) {
        
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        // 2.发送网络请求
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            
            // 3.获取结果
            guard let result = response.result.value else {
                failed(response.result.error!);
                return
            }
            
            // 4.将结果回调出去
            successed(result);
        }
    }
    
    class func request(_ type : HttpMethod, URLString : String, parameters : [String : Any]? = nil, successed :  @escaping (_ result : Any) -> ()) {
        
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        // 2.发送网络请求
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            
            // 3.获取结果
            guard let result = response.result.value else {
                return
            }
            
            // 4.将结果回调出去
            successed(result);
        }
    }
    
}
