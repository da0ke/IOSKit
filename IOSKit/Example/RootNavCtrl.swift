//
//  RootNavCtrl.swift
//  SwiftyKit
//
//  Created by javar on 2018/9/22.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation
import UIKit

class RootNavCtrl : UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let dst = ViewController();
        self.pushViewController(dst, animated: true);
    }
    
}
