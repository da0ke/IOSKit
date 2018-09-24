//
//  StringUtils.swift
//  SwiftyKit
//
//  Created by javar on 2018/9/22.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation

public class StringUtils {
    
    public static func isEmpty(str:String?) -> Bool {
        return str == nil || str!.isEmpty;
    }
    
    public static func isNotEmpty(str:String?) -> Bool {
        return !isEmpty(str: str);
    }
    
    public static func deleteWhitespace(str:String?) -> String {
        if(isEmpty(str: str)) {
            return "";
        } else {
            return str!.replacingOccurrences(of: " ", with: "");
        }
    }
    
}
