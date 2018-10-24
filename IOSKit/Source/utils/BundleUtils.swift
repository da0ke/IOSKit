//
//  BundleUtils.swift
//  IOSKit
//
//  Created by javar on 2018/10/19.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation
import UIKit

class BundleUtils {
    
    public static func getImage(name:String) -> UIImage? {
        return getImage(name: name, bundle: true);
    }
    
    public static func getImage(name:String, bundle:Bool) -> UIImage? {
        if(bundle) {
            let bundlePath = Bundle(for: BundleUtils.self).path(forResource: "IOSKit", ofType: "bundle");
            let bundle = Bundle(path: bundlePath!);
            return UIImage(named: name, in: bundle, compatibleWith: nil);
        } else {
            return UIImage(named: name);
        }
    }
    
    
}
