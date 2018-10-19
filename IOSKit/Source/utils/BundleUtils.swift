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
        let bundlePath = Bundle(for: BundleUtils.self).path(forResource: "IOSKit", ofType: "bundle");
        let bundle = Bundle(path: bundlePath!);
        return UIImage(named: name, in: bundle, compatibleWith: nil);
    }
    
}
