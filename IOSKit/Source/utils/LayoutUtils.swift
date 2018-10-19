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
    
    public static func addButton(parent:UIView,type:UIButton.ButtonType) -> UIButton {
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
    
    /* ------------------  nav start  ------------------  */
    
    private static let backColor_default = ColorUtils.c343434;
    
    public static func layout_nav(_parent:UIView, target:Any?, leftAction:Selector?, title:String) -> UINavigationBar {
        let navBar = createNavBar(_parent:_parent);
        
        let navItem = UINavigationItem();
        navItem.title = title;
        navItem.leftBarButtonItem = createBack(color: backColor_default, target: target, action: leftAction);
        
        navBar.pushItem(navItem, animated: true);
        
        return navBar;
    }
    
    public static func layout_nav(_parent:UIView, target:Any?, leftAction:Selector?, title:String, right:String, rightAction:Selector?) -> UINavigationBar {
        let navBar = createNavBar(_parent:_parent);
        
        let navItem = UINavigationItem();
        navItem.title = title;
        navItem.leftBarButtonItem = createBack(color: backColor_default, target: target, action: leftAction);
        navItem.rightBarButtonItem = createBarButtonItem(text: right, color: UIColor.darkGray, target: target, action: rightAction);
        
        navBar.pushItem(navItem, animated: true);
        
        return navBar;
    }
    
    public static func layout_nav(_parent:UIView, target:Any?, leftAction:Selector?, title:String, right:UIImage, rightColor:UIColor, rightAction:Selector?) -> UINavigationBar {
        let navBar = createNavBar(_parent:_parent);
        
        let navItem = UINavigationItem();
        navItem.title = title;
        navItem.leftBarButtonItem = createBack(color: backColor_default, target: target, action: leftAction);
        navItem.rightBarButtonItem = createBarButtonItem(image: right, color: rightColor, target: target, action: rightAction);
        
        navBar.pushItem(navItem, animated: true);
        
        return navBar;
    }
    
    public static func layout_nav(_parent:UIView, bgColor:UIColor, target:Any?, leftAction:Selector?, title:String) -> UINavigationBar {
        let navBar = createNavBar(_parent:_parent);
        navBar.barTintColor = bgColor;
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white];
        
        let navItem = UINavigationItem();
        navItem.title = title;
        navItem.leftBarButtonItem = createBack(color: UIColor.white, target: target, action: leftAction);
        
        navBar.pushItem(navItem, animated: true);
        
        return navBar;
    }
    
    
    private static func createBack(color:UIColor, target:Any?, action:Selector?) -> UIBarButtonItem  {
        return createBarButtonItem(image: BundleUtils.getImage(name: "nav_back")!, color: color, target: target, action: action);
    }
    
    private static func createNavBar(_parent:UIView) -> UINavigationBar {
        let navBar = addNavBar(parent: _parent);
        navBar.top(c: 0).leading(c: 0).trailing(c: 0).height(c: 44).build();
        navBar.barTintColor = UIColor.white;
        
        return navBar;
    }
    
    private static func createBarButtonItem(image:UIImage, color:UIColor, target:Any?, action:Selector?) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(image: image.withRenderingMode(.alwaysTemplate), style: .plain, target: target, action: action);
        barButtonItem.tintColor = color;
        return barButtonItem;
    }
    
    private static func createBarButtonItem(text:String, color:UIColor, target:Any?, action:Selector?) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(title: text, style: .plain, target: target, action: action);
        barButtonItem.tintColor = color;
        return barButtonItem;
    }
    
    /* ------------------  nav end  ------------------  */

}
