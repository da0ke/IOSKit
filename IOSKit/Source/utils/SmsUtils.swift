//
//  SmsUtils.swift
//  IOSKit
//
//  Created by javar on 2018/10/17.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation
import UIKit

public class SmsUtils {
    
    // button必须是custom类型的，否则会出现闪烁的问题
    public static func countdown(button:UIButton) {
        //倒计时事件
        var timeout = 59;
        let queue:DispatchQueue = DispatchQueue.global(qos: DispatchQoS.default.qosClass);
        let _timer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(rawValue: UInt(0)), queue: queue);
        _timer.schedule(wallDeadline: DispatchWallTime(timespec: timespec(tv_sec: __darwin_time_t.init(), tv_nsec: timeout)), repeating: 1);
        //每秒执行
        _timer.setEventHandler(handler: { () -> Void in
            if(timeout<=0){ //倒计时结束，关闭
                _timer.cancel();
                DispatchQueue.main.async {
                    button.setTitle("获取验证码", for: .normal);
                    button.isEnabled = true;
                    button.setTitleColor(ColorUtils.c42BEFF, for: UIControl.State());
                }
            }else{//正在倒计时
                let seconds = timeout % 60
                let strTime = NSString.localizedStringWithFormat("%.2d", seconds)
                
                UIView.beginAnimations(nil, context: nil);
                UIView.setAnimationDuration(1);
                //设置界面的按钮显示 根据自己需求设置
                DispatchQueue.main.async {
                    button.setTitle(NSString.localizedStringWithFormat("(%@)重新获取", strTime) as String, for: UIControl.State())
                }
                UIView.commitAnimations();
                timeout -= 1;
            }
            
        })
        _timer.resume();
    }
}
