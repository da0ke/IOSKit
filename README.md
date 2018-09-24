#  IOSKit

## AutoLayout
```
let rootView = LayoutUtils.layout_root(_self: self);

let _scroll = LayoutUtils.addScrollView(parent: rootView);
_scroll.top(c: 0).bottom(c: 0).leading(c: 0).trailing(c: 0).build();

let _content = LayoutUtils.addView(parent: _scroll);
_content.top(c: 0).bottom(c: 0).leading(c: 0).trailing(c: 0).width(v: _scroll, c: 0).build();

let _status = LayoutUtils.addButton(parent: _content);
_status.top(c: 20).leading(c: 20).trailing(c: -20).bottom(c: -20).build();
```

## StatusLayout
```
var statusLayout:StatusLayout!;


override func initView() {
let _success = LayoutUtils.addButton(parent: rootView);
_success.top(c: 10).leading(c: 20).build();
_success.setTitle("加载成功", for: .normal);
_success.backgroundColor = UIColor.orange;
_success.setTitleColor(UIColor.white, for: .normal);
_success.addTap(target: self, action: #selector(clickSuccess))

let _error = LayoutUtils.addButton(parent: rootView);
_error.leading(v: _success, c: 20).centerY(v: _success, c: 0).width(v: _success, c: 0).build();
_error.setTitle("加载失败", for: .normal);
_error.backgroundColor = UIColor.orange;
_error.setTitleColor(UIColor.white, for: .normal);
_error.addTap(target: self, action: #selector(clickError))

let _empty = LayoutUtils.addButton(parent: rootView);
_empty.leading(v: _error, c: 20).centerY(v: _success, c: 0).width(v: _success, c: 0).trailing(c: -20).build();
_empty.setTitle("无数据", for: .normal);
_empty.backgroundColor = UIColor.orange;
_empty.setTitleColor(UIColor.white, for: .normal);
_empty.addTap(target: self, action: #selector(clickEmpty))

let successView = LayoutUtils.addView(parent: rootView);
successView.top(v: _success, c: 20).leading(c: 0).trailing(c: 0).bottom(c: 0).build();
successView.backgroundColor = UIColor.blue;


let successMsg = LayoutUtils.addLabel(parent: successView);
successMsg.centerX(c: 0).centerY(c: 0).build();
successMsg.text = "Hello World!";
successMsg.textColor = UIColor.white;
successMsg.font = UIFont.systemFont(ofSize: 20);


statusLayout = StatusLayout(parent:rootView, success: successView, target: self, errorAction: #selector(retry));


}


@objc func clickSuccess() {
statusLayout.showLoading();

TimeUtils.delay(after: 3) {
self.statusLayout.hide();
}
}


@objc func clickEmpty() {
statusLayout.showLoading();

TimeUtils.delay(after: 3) {
self.statusLayout.showEmpty();
}
}

@objc func clickError() {
statusLayout.showLoading();

TimeUtils.delay(after: 3) {
self.statusLayout.showError();
}
}

@objc func retry() {
statusLayout.showLoading();

TimeUtils.delay(after: 3) {
self.statusLayout.hide();
}
}
```

## CocoaPods
```
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
pod 'IOSKit'

end
```
