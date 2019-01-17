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
        
        let _content = LayoutUtils.layout_content(_scroll: _scroll);
        
        let nav1 = LayoutUtils.addView(parent: _content);
        nav1.height(c: 50).top(c: 10).leading(c: 0).trailing(c: 0).build();
        _ = LayoutUtils.layout_nav(_parent: nav1, target: self,
                                   left: "返回", leftColor: UIColor.blue, leftAction: #selector(click),
                                   title: "标题",
                                   right: "分享", rightColor: UIColor.orange, rightAction: #selector(click));
        
        let nav2 = LayoutUtils.addView(parent: _content);
        nav2.height(c: 50).top(v: nav1, c: 10).leading(c: 0).trailing(c: 0).build();
        _ = LayoutUtils.layout_nav(_parent: nav2, target: self,
                                   left: "返回", leftColor: UIColor.blue, leftAction: #selector(click),
                                   title: "标题",
                                   right: UIImage(named: "example_share")!, rightColor: UIColor.orange, rightAction: #selector(click));
        
        let nav3 = LayoutUtils.addView(parent: _content);
        nav3.height(c: 50).top(v: nav2, c: 10).leading(c: 0).trailing(c: 0).build();
        _ = LayoutUtils.layout_nav(_parent: nav3, target: self,
                                   left: UIImage(named: "example_back")!, leftColor: UIColor.blue, leftAction: #selector(click),
                                   title: "标题",
                                   right: UIImage(named: "example_share")!, rightColor: UIColor.orange, rightAction: #selector(click));
        
        
        let nav4 = LayoutUtils.addView(parent: _content);
        nav4.height(c: 50).top(v: nav3, c: 10).leading(c: 0).trailing(c: 0).build();
        _ = LayoutUtils.layout_nav(_parent: nav4, target: self,
                                   left: UIImage(named: "example_back")!, leftColor:UIColor.blue, leftAction: #selector(click),
                                   search: "请输入关键字", searchAction: #selector(click),
                                   right: UIImage(named: "example_share")!, rightColor: UIColor.orange, rightAction: #selector(click))

        
        
        _content.subviews.last?.bottom(c: -20).build();
    }
    
    @objc private func click() {
        ToastUtils.showMsg(msg: "click!")
    }

    
}
