//
//  SelectView.swift
//  SwiftyKit
//
//  Created by javar on 2018/9/22.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation
import UIKit

public class SelectView : UIView {
    
    private var isFirstLayout = true;
    
    private var _title:UILabel!;
    private var _image:UIImageView!;
    private var _hint:UILabel!;
    
    override public init(frame: CGRect) {
        super.init(frame: frame);
        commonInit();
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        commonInit();
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews();
        
        if isFirstLayout { //保证只初始化布局一次
            firstLayout();
            self.isFirstLayout = false;
        }
    }
    
    public var title:String = "" {
        didSet {
            _title.text = title;
            
            if(StringUtils.isEmpty(str: title) && StringUtils.isNotEmpty(str: placeholder)) {
                _hint.isHidden = false;
            } else {
                _hint.isHidden = true;
            }
        }
    }
    
    public var placeholder:String = "" {
        didSet {
            _hint.text = placeholder;
        }
    }
    
    
    
    private func commonInit() {
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.layer.borderWidth = 0.6;
        self.layer.borderColor = ColorUtils.cCCC.cgColor;
        self.layer.cornerRadius = 2;
        
        _title = LayoutUtils.addLabel(parent: self);
        _title.font = UIFont.systemFont(ofSize: 14);
        _title.textColor = ColorUtils.c333;
        
        _image = LayoutUtils.addImageView(parent: self);
        
        
        let path1 = Bundle.init(for: SelectView.self).bundlePath;
        print("path1 = \(path1)");
        
        let path2 = Bundle(for: SelectView.self).path(forResource: "IOSKit", ofType: "bundle");
        print("path2 = \(path2 ?? "")");
        
        let path3 = Bundle(for: SelectView.self).path(forResource: "../IOSKit", ofType: "bundle");
        print("path3 = \(path3 ?? "")");
        
        let bundlePath = Bundle.main.path(forResource: "Frameworks/IOSKit.framework/IOSKit", ofType: "bundle");
        print("bundlePath = \(bundlePath ?? "")");
        let bundle = Bundle(path: bundlePath!);
        _image.image = UIImage(named: "select_down", in: bundle, compatibleWith: nil);
        
        _hint = LayoutUtils.addLabel(parent: self);
        _hint.font = UIFont.systemFont(ofSize: 14);
        _hint.textColor = UIColor.lightGray.withAlphaComponent(0.7);
        
    }
    
    private func firstLayout() {
        _title.leading(c: 10).centerY(c: 0).build();
        _image.leading(v: _title, c: 0).trailing(c: -10).centerY(c: 0).width(c: 14).height(c: 14).build();
        _hint.leading(c: 10).centerY(c: 0).build();
    }
    
}
