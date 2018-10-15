//
//  StatusView.swift
//  SwiftyKit
//
//  Created by javar on 2018/9/22.
//  Copyright © 2018年 da0ke. All rights reserved.
//

import Foundation
import UIKit

public enum StatusLayoutEnum : Int {
    
    case hide = 0
    case loading = 1
    case empty = 2
    case error = 3
    
}

public class StatusLayout {
    
    private var statusView:UIView!;
    
    private var loadingView:UIView!;
    private var emptyView:UIView!;
    private var errorView:UIView!;
    
    private var _emptyMsg:UILabel!;
    private var _errorMsg:UILabel!;
    
    private var currentStatus:StatusLayoutEnum!;
    
    public required init(parent:UIView, success:UIView, target:Any?, errorAction:Selector?) {
        statusView = LayoutUtils.addView(parent: parent);
        statusView.width(v: success, c: 0).height(v: success, c: 0).centerX(v: success, c: 0).centerY(v: success, c: 0).build();
        statusView.backgroundColor = UIColor.white;
        
        
        initLoadingView();
        initEmptyView();
        initErrorView(target: target, errorAction: errorAction);

        self.currentStatus = StatusLayoutEnum.hide;
        showAndHide(statusCode: currentStatus);
    }
    
    
    private func initLoadingView() {
        loadingView = LayoutUtils.addView(parent: statusView);
        loadingView.top(c: 0).leading(c: 0).trailing(c: 0).bottom(c: 0).build();
        
        let loading_progress = LayoutUtils.addActivityIndicatorView(parent: loadingView);
        loading_progress.centerX(c: 0).centerY(c: 0).build();
        
        loading_progress.style = .whiteLarge;
        loading_progress.color = UIColor.black;
        loading_progress.startAnimating();
    }
    
    private func initErrorView(target:Any?, errorAction:Selector?) {
        errorView = LayoutUtils.addView(parent: statusView);
        errorView.top(c: 0).leading(c: 0).trailing(c: 0).bottom(c: 0).build();
        
        let error_content = LayoutUtils.addView(parent: errorView);
        error_content.leading(c: 0).trailing(c: 0).centerY(c: 0).build();
        
        _errorMsg = LayoutUtils.addLabel(parent: error_content);
        _errorMsg.leading(c: 10).trailing(c: -10).top(c: 0).build();
        _errorMsg.text = "网络好像不太给力，请检查你的网络设置";
        _errorMsg.font = UIFont.systemFont(ofSize: 18);
        _errorMsg.textColor = ColorUtils.c666;
        _errorMsg.numberOfLines = 0;
        _errorMsg.textAlignment = .center;
        
        let error_button = LayoutUtils.addButton(parent: error_content);
        error_button.top(v: _errorMsg, c: 20).centerX(c: 0).bottom(c: 0).width(c: 100).build();
        error_button.setTitle("点击重试", for: .normal);
        error_button.setTitleColor(ColorUtils.c668ABC, for: .normal);
        error_button.titleLabel?.font = UIFont.systemFont(ofSize: 20);
        error_button.backgroundColor = UIColor.white;
        error_button.layer.cornerRadius = 4;
        error_button.layer.borderWidth = 0.6;
        error_button.layer.borderColor = ColorUtils.c668ABC.cgColor;
        if(errorAction != nil) {
            error_button.addTarget(target, action: errorAction!, for: .touchUpInside);
        }
    }
    
    private func initEmptyView() {
        emptyView = LayoutUtils.addView(parent: statusView);
        emptyView.top(c: 0).leading(c: 0).trailing(c: 0).bottom(c: 0).build();
        
        _emptyMsg = LayoutUtils.addLabel(parent: emptyView);
        _emptyMsg.centerX(c: 0).centerY(c: 0).build();
        
        _emptyMsg.text = "暂无数据";
        _emptyMsg.font = UIFont.systemFont(ofSize: 18);
        _emptyMsg.textColor = ColorUtils.c666;
    }
    
    public func showLoading() {
        currentStatus = StatusLayoutEnum.loading;
        showAndHide(statusCode: currentStatus);
    }
    
    public func showEmpty() {
        currentStatus = StatusLayoutEnum.empty;
        showAndHide(statusCode: currentStatus);
    }
    
    public func showEmpty(msg:String) {
        _emptyMsg.text = msg;
        showEmpty();
    }
    
    public func showError() {
        currentStatus = StatusLayoutEnum.error;
        showAndHide(statusCode: currentStatus);
    }
    
    public func showError(msg:String) {
        _errorMsg.text = msg;
        showError();
    }
    
    public func hide() {
        currentStatus = StatusLayoutEnum.hide;
        showAndHide(statusCode: currentStatus);
    }
    
    private func showAndHide(statusCode:StatusLayoutEnum) {
        loadingView.isHidden = (statusCode != StatusLayoutEnum.loading);
        emptyView.isHidden = (statusCode != StatusLayoutEnum.empty);
        errorView.isHidden = (statusCode != StatusLayoutEnum.error);
        statusView.isHidden = (statusCode == StatusLayoutEnum.hide);
    }
    
    public func isLoading() -> Bool {
        if(currentStatus == StatusLayoutEnum.loading) {
            return true;
        } else {
            return false;
        }
    }
    
}
