//
//  LayoutUtilsCtrl.swift
//  IOSKit
//
//  Created by javar on 2018/10/24.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation
import UIKit

class LayoutUtilsCtrl : BaseCtrl {
    
    override func initView() {
        let rootView = LayoutUtils.layout_root(_self: self);
        
        let _scroll = LayoutUtils.addScrollView(parent: rootView);
        _scroll.top(c: 0).bottom(c: 0).leading(c: 0).trailing(c: 0).build();
        
        let _content = LayoutUtils.addView(parent: _scroll);
        _content.top(c: 0).bottom(c: 0).leading(c: 0).trailing(c: 0).width(v: _scroll, c: 0).build();
        
        let navBar = LayoutUtils.layout_nav(_parent: _content, target: self, leftAction: #selector(goBack), search: "请输入职位或企业名称", searchAction: #selector(clickSearch), right: UIImage(named: "example_share")!, rightColor: ColorUtils.c777, rightAction: #selector(doShare))
        
        navBar.bottom(c: -20).build();
    }
    
    @objc func clickSearch() {
        ToastUtils.showMsg(msg: "click search")
    }
    
    @objc func doShare() {
        ToastUtils.showMsg(msg: "click share")
    }
    
}
