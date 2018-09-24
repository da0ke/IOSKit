//
//  AutoLayout.swift
//  SwiftyKit
//
//  Created by javar on 2018/9/21.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation
import UIKit

public class LayoutUtils {

    public static func addView(parent:UIView) -> UIView {
        let view = UIView();
        parent.addSubview(view);
        view.translatesAutoresizingMaskIntoConstraints = false;
        
        return view;
    }
    
    public static func addLabel(parent:UIView) -> UILabel {
        let view = UILabel();
        parent.addSubview(view);
        view.translatesAutoresizingMaskIntoConstraints = false;
        
        return view;
    }
    
    public static func addTextField(parent:UIView) -> UITextField {
        let view = UITextField();
        parent.addSubview(view);
        view.translatesAutoresizingMaskIntoConstraints = false;
        
        return view;
    }
    
    public static func addTextView(parent:UIView) -> UITextView {
        let view = UITextView();
        parent.addSubview(view);
        view.translatesAutoresizingMaskIntoConstraints = false;
        
        return view;
    }
    
    public static func addImageView(parent:UIView) -> UIImageView {
        let view = UIImageView();
        parent.addSubview(view);
        view.translatesAutoresizingMaskIntoConstraints = false;
        
        return view;
    }
    
    public static func addButton(parent:UIView) -> UIButton {
        return addButton(parent: parent, type: .system);
    }
    
    public static func addButton(parent:UIView,type:UIButtonType) -> UIButton {
        let view = UIButton(type: type);
        parent.addSubview(view);
        view.translatesAutoresizingMaskIntoConstraints = false;
        
        return view;
    }
    
    public static func addNavBar(parent:UIView) -> UINavigationBar {
        let view = UINavigationBar();
        parent.addSubview(view);
        view.translatesAutoresizingMaskIntoConstraints = false;
        
        return view;
    }
    
    public static func addScrollView(parent:UIView) -> UIScrollView {
        let view = UIScrollView();
        parent.addSubview(view);
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.showsVerticalScrollIndicator = false;
        
        return view;
    }
    
    public static func addActivityIndicatorView(parent:UIView) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView();
        parent.addSubview(view);
        view.translatesAutoresizingMaskIntoConstraints = false;
        
        return view;
    }
    
    public static func addPickerView(parent:UIView) -> UIPickerView {
        let view = UIPickerView();
        parent.addSubview(view);
        view.translatesAutoresizingMaskIntoConstraints = false;
        
        return view;
    }


    public static func layout_root(_self:UIViewController) -> UIView {
        _self.view.backgroundColor = UIColor.white;
        
        let rootView = addView(parent: _self.view);
        if #available(iOS 11.0, *) {
            rootView.top(v: _self.view.safeAreaLayoutGuide, c: 0)
                .bottom(v: _self.view.safeAreaLayoutGuide, c:0)
                .leading(v: _self.view.safeAreaLayoutGuide, c: 0)
                .trailing(v: _self.view.safeAreaLayoutGuide, c: 0)
                .build();
        } else {
            rootView.top(v: _self.topLayoutGuide, c: 0)
                .bottom(v: _self.bottomLayoutGuide, c: 0)
                .leading(c: 0)
                .trailing(c: 0)
                .build();
        }
        
        return rootView;
    }
    
    

}
