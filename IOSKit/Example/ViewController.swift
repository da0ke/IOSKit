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
       
        let _select = createButton(_parent: _content, title: "SelectView", selector: #selector(clickSelectView));
        _select.top(c: 10).leading(c: 20).trailing(c: -20).build();
        
        let _status = createButton(_parent: _content, title: "StatusLayout", selector: #selector(clickStatusLayout));
        _status.top(v: _select, c: 10).leading(c: 20).trailing(c: -20).build();
        
        let _layout = createButton(_parent: _content, title: "LayoutUtils", selector: #selector(clickLayout));
        _layout.top(v: _status, c: 10).leading(c: 20).trailing(c: -20).build();
        
        let _regex = createButton(_parent: _content, title: "RegexUtils", selector: #selector(clickRegex));
        _regex.top(v: _layout, c: 10).leading(c: 20).trailing(c: -20).bottom(c: -10).build();
        
    }
    
    private func createButton(_parent:UIView, title:String, selector:Selector) -> UIButton {
        let btn = LayoutUtils.addButton(parent: _parent);
        btn.setTitle(title, for: .normal);
        btn.backgroundColor = UIColor.orange;
        btn.setTitleColor(UIColor.white, for: .normal);
        btn.addTarget(self, action: selector, for: .touchUpInside);
        
        return btn;
    }
    
    @objc func clickSelectView() {
        navigationController?.pushViewController(SelectViewCtrl(), animated: true);
    }
    
    @objc func clickStatusLayout() {
        navigationController?.pushViewController(StatusLayoutCtrl(), animated: true);
    }
    
    @objc func clickLayout() {
        navigationController?.pushViewController(LayoutUtilsCtrl(), animated: true);
    }

    @objc func clickRegex() {
        navigationController?.pushViewController(RegexCtrl(), animated: true);
    }

}

