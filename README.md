# IOSKit

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
    ...
    statusLayout = StatusLayout(parent:rootView, success: successView, target: self, errorAction: #selector(retry));
}

@objc func retry() {
    statusLayout.showLoading();

    TimeUtils.delay(after: 3) {
        self.statusLayout.hide();
    }
}
```

## Utils
### ColorUtils
### LayoutUtils
### NetUtils
### StringUtils
### TimeUtils
### ViewUtils

## CocoaPods
```
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
pod 'IOSKit'

end
```

