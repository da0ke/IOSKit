//
//  NetUtils.swift
//  SwiftyKit
//
//  Created by javar on 2018/9/21.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

public enum HttpMethod {
    case get
    case post
}

public typealias Parameters = [String: Any]

public class NetUtils {
    
    public static func request(_ type : HttpMethod, URLString : String, parameters : [String : Any]? = nil, successed :  @escaping (_ result : Any) -> (),failed:@escaping (_ error:Error) -> ()) {
        
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
    
    public static func request(_ type : HttpMethod, URLString : String, parameters : [String : Any]? = nil, successed :  @escaping (_ result : Any) -> ()) {
        
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
    
    public static func get(_ URLString : String, parameters : [String : Any]? = nil, successed :  @escaping (_ result : Any) -> ()) {
        get(URLString, parameters: parameters, successed: successed) { _ in
            
        }
    }
    
    public static func get(_ URLString : String, parameters : [String : Any]? = nil, successed :  @escaping (_ result : Any) -> (),failed:@escaping (_ error:Error) -> ()) {
        Alamofire.request(URLString, method: HTTPMethod.get, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                failed(response.result.error!);
                return
            }
            
            successed(result);
        }
    }
    
    public static func get(_ URLString : String, parameters : [String : Any]? = nil, headers: [String : String]? = nil, successed :  @escaping (_ result : Any) -> (),failed:@escaping (_ error:Error) -> ()) {
        
        Alamofire.request(URLString, method: HTTPMethod.get, parameters: parameters, headers: headers).responseJSON { (response) in
            guard let result = response.result.value else {
                failed(response.result.error!);
                return
            }

            successed(result);
        }
    }
    
    public static func post(_ URLString : String, parameters : [String : Any]? = nil, successed :  @escaping (_ result : Any) -> ()) {
        post(URLString, parameters: parameters, successed: successed) { _ in
            
        }
    }
    
    public static func post(_ URLString : String, parameters : [String : Any]? = nil, successed :  @escaping (_ result : Any) -> (),failed:@escaping (_ error:Error) -> ()) {
        Alamofire.request(URLString, method: HTTPMethod.post, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                failed(response.result.error!);
                return
            }
            
            successed(result);
        }
    }
    
    public static func post(_ URLString : String, parameters : [String : Any]? = nil, headers: [String : String]? = nil, successed :  @escaping (_ result : Any) -> (),failed:@escaping (_ error:Error) -> ()) {
        Alamofire.request(URLString, method: HTTPMethod.post, parameters: parameters, headers: headers).responseJSON { (response) in
            guard let result = response.result.value else {
                failed(response.result.error!);
                return
            }
            
            successed(result);
        }
    }
    
    
    public static func upload(URLString : String, parameters : [String : String], images:[String : Data], successed :  @escaping (_ result : Any) -> (),failed:@escaping (_ error:Error) -> ()) {
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                for (key, value) in images {
                    multipartFormData.append(value, withName: key, fileName: "\(TimeUtils.millisSeconds()).png", mimeType: "image/png")
                }
                
                for (key, value) in parameters {
                    multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key);
                }
        },
            to: URLString,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        
                        guard let result = response.result.value else {
                            failed(response.result.error!);
                            return
                        }
                        
                        successed(result);
                    }
                case .failure(let encodingError):
                    failed(encodingError);
                }
        }
        )
        
    }
    
}
