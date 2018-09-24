//
//  SelectView.swift
//  SwiftyKit
//
//  Created by javar on 2018/9/22.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation
import UIKit

class SelectView : UIView {
    
    private var isFirstLayout = true;
    
    private var _title:UILabel!;
    private var _image:UIImageView!;
    private var _hint:UILabel!;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        commonInit();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        commonInit();
    }
    
    override func layoutSubviews() {
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
        _image.image = UIImage(named: "select_down");
        
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
