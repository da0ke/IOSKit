//
//  EncryptUtils.swift
//  IOSKit
//
//  Created by javar on 2019/7/2.
//  Copyright © 2019 da0ke. All rights reserved.
//

import Foundation
import CryptoSwift

public class EncryptUtils {
    
    public static func md5(str:String) -> String {
        return str.md5().lowercased();
    }
    
}
