//
//  ViewController.m
//  iOSWidget
//
//  Created by harry on 2019/9/5.
//  Copyright © 2019 DangDang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *df = [[NSUserDefaults alloc] initWithSuiteName:@"group.iOSWidget.group"];
    [df setValue:@"不错，不错！" forKey:@"name"];
    [df synchronize];
    
    NSURL *managerUrl = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.iOSWidget.group"];
    NSURL *newUrl = [managerUrl URLByAppendingPathComponent:@"group.data"];
    NSString *string = @"惊喜、意外！";
    [string writeToURL:newUrl atomically:YES encoding:NSUTF8StringEncoding error:nil];
}


@end
