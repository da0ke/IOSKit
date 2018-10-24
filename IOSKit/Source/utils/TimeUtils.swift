//
//  TimeUtils.swift
//  SwiftyKit
//
//  Created by javar on 2018/9/22.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation

public class TimeUtils {
    
    // GCD延时操作
    //   - after: 延迟的时间
    //   - handler: 事件
    public static func delay(after: Double, handler:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + after) {
            handler()
        }
    }
    
    public static func millisSeconds() -> Double {
        let t = Date().timeIntervalSince1970;
        return Double(t * 1000);
    }
    
    public static func millis2String(millis:Double, pattern:String) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(millis/1000));
        
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = pattern;
        
        let time = dateFormatter.string(from: date);
        
        return time;
    }
    
}
