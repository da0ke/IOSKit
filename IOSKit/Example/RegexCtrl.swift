//
//  RegexCtrl.swift
//  IOSKit
//
//  Created by javar on 2019/8/27.
//  Copyright © 2019 da0ke. All rights reserved.
//

import Foundation
import UIKit

class RegexCtrl : BaseCtrl {
    
    override func initView() {
        let _scroll = LayoutUtils.addScrollView(parent: rootView);
        _scroll.top(c: 0).bottom(c: 0).leading(c: 0).trailing(c: 0).build();
        
        let _content = LayoutUtils.layout_content(_scroll: _scroll);
        
        let username_view = createItem(_parent: _content, title: "用户名");
        username_view.top(c: 20).leading(c: 15).trailing(c: -15).build();
        let username_btn = username_view.viewWithTag(2) as! UIButton;
        username_btn.addTarget(self, action: #selector(checkUsername(btn:)), for: .touchUpInside);
        
        let password_view = createItem(_parent: _content, title: "密码");
        password_view.top(v: username_view, c: 20).leading(c: 15).trailing(c: -15).build();
        let password_btn = password_view.viewWithTag(2) as! UIButton;
        password_btn.addTarget(self, action: #selector(checkPassword(btn:)), for: .touchUpInside);
        
        let mobile_view = createItem(_parent: _content, title: "手机号");
        mobile_view.top(v: password_view, c: 20).leading(c: 15).trailing(c: -15).build();
        let mobile_btn = mobile_view.viewWithTag(2) as! UIButton;
        mobile_btn.addTarget(self, action: #selector(checkMobile(btn:)), for: .touchUpInside);
        
        let tel_view = createItem(_parent: _content, title: "电话");
        tel_view.top(v: mobile_view, c: 20).leading(c: 15).trailing(c: -15).build();
        let tel_btn = tel_view.viewWithTag(2) as! UIButton;
        tel_btn.addTarget(self, action: #selector(checkTel(btn:)), for: .touchUpInside);
        
        let email_view = createItem(_parent: _content, title: "邮箱");
        email_view.top(v:tel_view, c: 20).leading(c: 15).trailing(c: -15).bottom(c: -20).build();
        let email_btn = email_view.viewWithTag(2) as! UIButton;
        email_btn.addTarget(self, action: #selector(checkEmail(btn:)), for: .touchUpInside);
    }
    
    
    private func createItem(_parent:UIView, title:String) -> UIView {
        let view = LayoutUtils.addView(parent: _parent);
        
        let _title = LayoutUtils.addLabel(parent: view, fontSize: 16, color: UIColor.darkGray);
        _title.leading(c: 0).build();
        _title.text = title;
        
        let _input = LayoutUtils.addTextField(parent: view);
        _input.top(c: 0).leading(v: _title, c: 0).trailing(c: 0).centerY(v: _title, c: 0).build();
        _input.tag = 1;
        _input.borderStyle = .roundedRect;
        
        let _btn = LayoutUtils.addButton(parent: view);
        _btn.top(v: _input, c: 10).leading(c: 0).width(c: 80).bottom(c: 0).build();
        _btn.setTitle("验证", for: .normal);
        _btn.backgroundColor = UIColor.blue;
        _btn.setTitleColor(UIColor.white, for: .normal);
        _btn.tag = 2;
        
        let _result = LayoutUtils.addLabel(parent: view, fontSize: 16, color: UIColor.green);
        _result.centerY(v: _btn, c: 0).leading(v: _btn, c: 20).trailing(c: 0).build();
        _result.tag = 3;
        
        return view;
    }
    
    @objc private func checkUsername(btn:UIButton) {
        let view = btn.superview!;
        let _input = view.viewWithTag(1) as! UITextField;
        let _result = view.viewWithTag(3) as! UILabel;
        
        let str = _input.text!.trimmingCharacters(in: .whitespaces);
        _result.text = "\(RegexUtils.isUsername(str: str))";
    }
    
    @objc private func checkPassword(btn:UIButton) {
        let view = btn.superview!;
        let _input = view.viewWithTag(1) as! UITextField;
        let _result = view.viewWithTag(3) as! UILabel;
        
        let str = _input.text!.trimmingCharacters(in: .whitespaces);
        _result.text = "\(RegexUtils.isPassword(str: str))";
    }
    
    @objc private func checkMobile(btn:UIButton) {
        let view = btn.superview!;
        let _input = view.viewWithTag(1) as! UITextField;
        let _result = view.viewWithTag(3) as! UILabel;
        
        let str = _input.text!.trimmingCharacters(in: .whitespaces);
        _result.text = "\(RegexUtils.isMobile(str: str))";
    }
    
    @objc private func checkTel(btn:UIButton) {
        let view = btn.superview!;
        let _input = view.viewWithTag(1) as! UITextField;
        let _result = view.viewWithTag(3) as! UILabel;
        
        let str = _input.text!.trimmingCharacters(in: .whitespaces);
        _result.text = "\(RegexUtils.isTel(str: str))";
    }
    
    @objc private func checkEmail(btn:UIButton) {
        let view = btn.superview!;
        let _input = view.viewWithTag(1) as! UITextField;
        let _result = view.viewWithTag(3) as! UILabel;
        
        let str = _input.text!.trimmingCharacters(in: .whitespaces);
        _result.text = "\(RegexUtils.isEmail(str: str))";
    }
    
}
