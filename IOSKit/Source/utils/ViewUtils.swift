//
//  ViewUtils.swift
//  SwiftyKit
//
//  Created by javar on 2018/9/21.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public func build() {}
    
    public func top(c:CGFloat) -> Self {
        var con:NSLayoutConstraint!;
        if #available(iOS 11.0, *) {
            con = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview?.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: c)
        } else {
            con = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1, constant: c);
        };
        superview?.addConstraint(con);
        
        return self;
    }
    
    public func top(v:UILayoutSupport, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: v, attribute: .bottom, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    @available(iOS 9.0, *)
    public func top(v:UILayoutGuide, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: v, attribute: .top, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func top(v:UIView, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: v, attribute: .bottom, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func top(relatedBy:NSLayoutConstraint.Relation,c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .top, relatedBy: relatedBy, toItem: superview, attribute: .top, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func top(relatedBy:NSLayoutConstraint.Relation,v:UIView,c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .top, relatedBy: relatedBy, toItem: v, attribute: .bottom, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func bottom(c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func bottom(v:UILayoutSupport, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: v, attribute: .top, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    @available(iOS 9.0, *)
    public func bottom(v:UILayoutGuide, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: v, attribute: .bottom, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func bottom(v:UIView, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: v, attribute: .top, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func bottom(relatedBy:NSLayoutConstraint.Relation,c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: relatedBy, toItem: superview, attribute: .bottom, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func leading(c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        
        return self;
    }

    @available(iOS 9.0, *)
    public func leading(v:UILayoutGuide, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: v, attribute: .leading, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func leading(v:UIView, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: v, attribute: .trailing, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func leading(relatedBy:NSLayoutConstraint.Relation, v:UIView, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: relatedBy, toItem: v, attribute: .trailing, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }

    public func trailing(c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func trailing(v:UIView, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: v, attribute: .leading, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    @available(iOS 9.0, *)
    public func trailing(v:UILayoutGuide, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: v, attribute: .trailing, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func trailing(relatedBy:NSLayoutConstraint.Relation,c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: relatedBy, toItem: superview, attribute: .trailing, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func trailing(relatedBy:NSLayoutConstraint.Relation, v:UIView, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: relatedBy, toItem: v, attribute: .leading, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func centerX(c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: superview, attribute: .centerX, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func centerX(v:UIView, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: v, attribute: .centerX, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func centerY(c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: superview, attribute: .centerY, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func centerY(v:UIView, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: v, attribute: .centerY, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func width(c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: .none, attribute: .width, multiplier: 1, constant: c);
        self.addConstraint(con);
        return self;
    }
    
    public func width(v:UIView, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: v, attribute: .width, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func width(mult:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: mult, constant: 0);
        superview?.addConstraint(con);
        return self;
    }
    
    public func width(mult:CGFloat, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: superview, attribute: .width, multiplier: mult, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func width(v:UIView,mult:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: v, attribute: .width, multiplier: mult, constant: 0);
        superview?.addConstraint(con);
        return self;
    }
    
    public func width(relatedBy:NSLayoutConstraint.Relation, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .width, relatedBy: relatedBy, toItem: .none, attribute: .width, multiplier: 1, constant: c);
        self.addConstraint(con);
        return self;
    }
    
    public func height(c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: .none, attribute: .height, multiplier: 1, constant: c);
        self.addConstraint(con);
        return self;
    }
    
    public func height(v:UIView, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: v, attribute: .height, multiplier: 1, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func height(mult:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: mult, constant: 0);
        superview?.addConstraint(con);
        return self;
    }
    
    public func height(mult:CGFloat, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: superview, attribute: .height, multiplier: mult, constant: c);
        superview?.addConstraint(con);
        return self;
    }
    
    public func height(v:UIView, attr:NSLayoutConstraint.Attribute) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: v, attribute: attr, multiplier: 1, constant: 0);
        superview?.addConstraint(con);
        return self;
    }
    
    public func height(relatedBy:NSLayoutConstraint.Relation, c:CGFloat) -> Self {
        let con = NSLayoutConstraint(item: self, attribute: .height, relatedBy: relatedBy, toItem: .none, attribute: .height, multiplier: 1, constant: c);
        self.addConstraint(con);
        return self;
    }
    
    public func addTap(target: Any?, action: Selector?) {
        let tap = UITapGestureRecognizer(target: target, action: action);
        self.isUserInteractionEnabled = true;
        self.addGestureRecognizer(tap);
        
    }
    
}
