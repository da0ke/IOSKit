//
//  BaseCtrl.swift
//  SwiftyKit
//
//  Created by javar on 2018/9/22.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation
import UIKit

class BaseCtrl : UIViewController {
    
    var rootView:UIView!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        rootView = LayoutUtils.layout_root(_self: self);
        
        initView();
    }
    
    func initView() {
        
    }
    
    
}
