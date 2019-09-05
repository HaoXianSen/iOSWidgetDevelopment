//
//  TodayViewController.m
//  com.dangdang.iOSWidget.widgetDemo
//
//  Created by harry on 2019/9/5.
//  Copyright © 2019 DangDang. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIButton *enterButton;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.enterButton.layer.cornerRadius = 20.f;
    self.enterButton.backgroundColor = UIColor.redColor;
    
    // 扩展程序 与宿主程序 数据互通的方式
    // 1. group userDefaults
//    NSUserDefaults *df = [[NSUserDefaults alloc] initWithSuiteName:@"group.iOSWidget.group"];
//    _textLabel.text = [df valueForKey:@"name"];
    // 2. NSFileManager
    NSURL *managerUrl = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.iOSWidget.group"];
    NSURL *newUrl = [managerUrl URLByAppendingPathComponent:@"group.data"];
    NSString *text = [NSString stringWithContentsOfURL:newUrl encoding:NSUTF8StringEncoding error:nil];
    _textLabel.text = text;
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}
- (IBAction)enterAction:(id)sender {
    NSString *schemeString = @"iOSWidget://";
    [self.extensionContext openURL:[NSURL URLWithString:schemeString] completionHandler:^(BOOL success) {
        
    }];
}

@end
