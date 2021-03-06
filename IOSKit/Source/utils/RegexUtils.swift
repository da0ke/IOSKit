//
//  RegexUtils.swift
//  IOSKit
//
//  Created by javar on 2019/8/27.
//  Copyright © 2019 da0ke. All rights reserved.
//

import Foundation


public class RegexUtils {
    
    public static func isUsername(str:String) -> Bool {
        return isMatches(str: str, pattern: "^[a-zA-Z0-9_]{4,20}$")
    }
    
    public static func isPassword(str:String) -> Bool {
        return isMatches(str: str, pattern: "^[^\\u4e00-\\u9fa5]{6,20}$")
    }
    
    public static func isMobile(str:String) -> Bool {
        return isMatches(str: str, pattern: "^1[0-9]{10}$");
    }
    
    public static func isTel(str:String) -> Bool {
        return isMatches(str: str, pattern: "^[0-9-+]{6,}$")
    }
    
    public static func isEmail(str:String) -> Bool {
        return isMatches(str: str, pattern: "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$")
    }
    
    public static func isUnsignedInteger(str: String) -> Bool {
        return isMatches(str: str, pattern: "^(0|([1-9]\\d*))$");
    }
    
    
    public static func isMatches(str:String, pattern:String) -> Bool {
        let range = str.range(of: pattern, options: .regularExpression, range: str.startIndex..<str.endIndex, locale: .current);
        return range != nil;
    }
    
}
