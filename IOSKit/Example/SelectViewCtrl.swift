//
//  SelectViewCtrl.swift
//  SwiftyKit
//
//  Created by javar on 2018/9/22.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation
import UIKit

class SelectViewCtrl : BaseCtrl {
    
    override func initView() {
        let selectView = SelectView();
        rootView.addSubview(selectView);
        selectView.centerX(c: 0).centerY(c: 0).width(c: 100).height(c: 40).build();
        selectView.title = "请选择";
        
        
    }
    
}
