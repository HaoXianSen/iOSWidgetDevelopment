### This is iOS widget devepment

官方文档地址：
https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/Today.html

> 添加类似如下图苹果widget小组件开发

![截图](screenshot/shot1.jpeg)

* 其实步骤非常简单，但是觉得这个功能应该记录一下。

1. 创建一个扩展target

![截图](screenshot/buzhou1@2x.png)

2. 选择 Today Extension

![截图](screenshot/buzhou2@2x.png)

3. 目录会变成下图所示，如果选择storyboard 编程，那么就可直接在MainInterface.storyboard 中画图

![截图](screenshot/zhoubu3@2x.png)

4. 如果纯代码编码，则改变直接修所在target的mainInterface就行，或者修改info.plist的NSExtension选项

5. 相关的开发没有什么区别，如果跳转到主应用，需要scheme 跳转。相关操作就不累赘了。

**** 

关于宿主程序和扩展数据互通：
需要在Capablities 打开App group 并且添加 group，宿主程序和扩展程序都需添加，并且选择同一个appGroup。
互通方式通过group的方式，互通

其中有两种存储的方式：
1. 利用NSUserDefaults
```
宿主程序存
NSUserDefaults *df = [[NSUserDefaults alloc] initWithSuiteName:@"group.iOSWidget.group"];
[df setValue:@"不错，不错！" forKey:@"name"];
[df synchronize];
扩展程序取

NSUserDefaults *df = [[NSUserDefaults alloc] initWithSuiteName:@"group.iOSWidget.group"];
_textLabel.text = [df valueForKey:@"name"];
```
2. 利用NSFileManager
```
宿主程序存
NSURL *managerUrl = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.iOSWidget.group"];
NSURL *newUrl = [managerUrl URLByAppendingPathComponent:@"group.data"];
NSString *string = @"惊喜、意外！";
[string writeToURL:newUrl atomically:YES encoding:NSUTF8StringEncoding error:nil];
扩展程序取

NSURL *managerUrl = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.iOSWidget.group"];
NSURL *newUrl = [managerUrl URLByAppendingPathComponent:@"group.data"];
NSString *text = [NSString stringWithContentsOfURL:newUrl encoding:NSUTF8StringEncoding error:nil];
_textLabel.text = text;
```

** 注意点：
  1. Today widget 对于内存有限制，内存过大会导致 Today widget 直接退出；尽量使用 autoLayout 布局 
  2.  Extension target 需要打开app group 功能，如果，采用的是自动管理证书，那么我们只需要在xcode  Capabilities 打开App Group 功能；如果手动管理，我们需要自己在苹果开发者后台弄一套证书， 证书打开App group 即可。
