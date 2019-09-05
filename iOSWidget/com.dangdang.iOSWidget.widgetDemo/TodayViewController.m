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
