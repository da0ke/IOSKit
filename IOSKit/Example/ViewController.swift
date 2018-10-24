//
//  ViewController.swift
//  SwiftyKit
//
//  Created by javar on 2018/9/21.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import UIKit

class ViewController: BaseCtrl {
    
    override func initView() {
        
        let _scroll = LayoutUtils.addScrollView(parent: rootView);
        _scroll.top(c: 0).bottom(c: 0).leading(c: 0).trailing(c: 0).build();
        
        let _content = LayoutUtils.addView(parent: _scroll);
        _content.top(c: 0).bottom(c: 0).leading(c: 0).trailing(c: 0).width(v: _scroll, c: 0).build();
        
        let _select = LayoutUtils.addButton(parent: _content);
        _select.top(c: 10).leading(c: 20).trailing(c: -20).build();
        _select.setTitle("SelectView", for: .normal);
        _select.backgroundColor = UIColor.orange;
        _select.setTitleColor(UIColor.white, for: .normal);
        _select.addTarget(self, action: #selector(clickSelectView), for: .touchUpInside);
        
        let _status = LayoutUtils.addButton(parent: _content);
        _status.top(v: _select, c: 10).leading(c: 20).trailing(c: -20).build();
        _status.setTitle("StatusLayout", for: .normal);
        _status.backgroundColor = UIColor.orange;
        _status.setTitleColor(UIColor.white, for: .normal);
        _status.addTarget(self, action: #selector(clickStatusLayout), for: .touchUpInside);
        
        let _layout = LayoutUtils.addButton(parent: _content);
        _layout.top(v: _status, c: 10).leading(c: 20).trailing(c: -20).bottom(c: -10).build();
        _layout.setTitle("LayoutUtils", for: .normal);
        _layout.backgroundColor = UIColor.orange;
        _layout.setTitleColor(UIColor.white, for: .normal);
        _layout.addTarget(self, action: #selector(clickLayout), for: .touchUpInside);
    }
    
    @objc func clickSelectView() {
        let dst = SelectViewCtrl();
        navigationController?.pushViewController(dst, animated: true);
    }
    
    @objc func clickStatusLayout() {
        let dst = StatusLayoutCtrl();
        navigationController?.pushViewController(dst, animated: true);
    }
    
    @objc func clickLayout() {
        let dst = LayoutUtilsCtrl();
        navigationController?.pushViewController(dst, animated: true);
    }


}

