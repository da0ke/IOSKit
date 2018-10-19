//
//  ToastUtils.swift
//  IOSKit
//
//  Created by javar on 2018/10/17.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation
import UIKit

public class ToastUtils {
    
    private static let progressView = UIView();
    
    public static func showProgress() {
        let window = UIApplication.shared.keyWindow;
        
        let screenWidth = UIScreen.main.bounds.size.width;
        let screenHeight = UIScreen.main.bounds.size.height;
        
        progressView.backgroundColor = UIColor.clear;
        progressView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight);
        progressView.alpha = 1;
        progressView.layer.masksToBounds = true;
        window?.addSubview(progressView);
        
        let contentView = UIView();
        contentView.backgroundColor = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1);
        contentView.frame = CGRect(x: (screenWidth-70)/2, y: (screenHeight-70)/2, width: 70, height: 70);
        contentView.alpha = 1;
        contentView.layer.cornerRadius = 5;
        contentView.layer.masksToBounds = true;
        progressView.addSubview(contentView);
        
        let loading = UIActivityIndicatorView();
        loading.center = CGPoint(x: contentView.frame.width/2, y: contentView.frame.height/2);
        loading.style = UIActivityIndicatorView.Style.whiteLarge;
        loading.color = UIColor.white;
        loading.startAnimating();
        contentView.addSubview(loading);
    }
    
    public static func hideProgress() {
        progressView.alpha = 0;
        progressView.removeFromSuperview();
    }
    
    public static func showMsg(msg:String) {
        let window = UIApplication.shared.keyWindow;
        
        // 关闭键盘
        window?.endEditing(true);
        
        let showView = UIView();
        showView.backgroundColor = UIColor.black;
        showView.frame = CGRect(x: 1, y: 1, width: 1, height: 1);
        showView.alpha = 1;
        showView.layer.cornerRadius = 5;
        showView.layer.masksToBounds = true;
        window?.addSubview(showView);
        
        let label = UILabel();
        let attribute = [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 17)];
        let LabelSize = msg.boundingRect(with: CGSize(), options: NSStringDrawingOptions.truncatesLastVisibleLine, attributes: attribute, context: nil).size;
        label.frame = CGRect(x: 10, y: 5, width: LabelSize.width, height: LabelSize.height);
        label.text = msg as String;
        label.textColor = UIColor.white;
        label.textAlignment = NSTextAlignment.center;
        label.backgroundColor = UIColor.clear;
        label.font = UIFont.boldSystemFont(ofSize: 17);
        showView.addSubview(label);
        
        let screenWidth = UIScreen.main.bounds.size.width;
        let screenHeight = UIScreen.main.bounds.size.height;
        showView.frame = CGRect(x: (screenWidth-label.frame.width-20)/2, y: screenHeight-100, width: label.frame.width+20, height: label.frame.height+10);
        
        UIView.animate(withDuration: 3, animations: { () -> Void in
            showView.alpha = 0;
        }, completion: { (Bool) -> Void in
            showView.removeFromSuperview();
        })
        
    }
    
}
