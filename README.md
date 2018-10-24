# IOSKit 简介
IOSKit 是一个ios开发工具库

## CocoaPods
```
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
pod 'IOSKit'

end
```

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

## JStatusLayout
```
var statusLayout:JStatusLayout!;

override func initView() {
...
statusLayout = JStatusLayout(parent:rootView, success: successView, target: self, errorAction: #selector(retry));
}

@objc func retry() {
statusLayout.showLoading();

TimeUtils.delay(after: 3) {
self.statusLayout.hide();
}
}
```

## NetUtils
``` NetUtils.request(...) ```
``` NetUtils.upload(...) ```

## LayoutUtils
``` 
LayoutUtils.addView(parent:UIView) 
LayoutUtils.addLabel(parent:UIView)
LayoutUtils.addTextField(parent:UIView)
    ... ...
    
LayoutUtils.layout_root(...)    
LayoutUtils.layout_nav(...)
```

## ToastUtils
```
ToastUtils.showProgress()
ToastUtils.hideProgress()
ToastUtils.showMsg(msg:String)
```

## Utils
- ColorUtils
- StringUtils
- TimeUtils
- SmsUtils



