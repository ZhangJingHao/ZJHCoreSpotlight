//
//  AppDelegate.m
//  ZJHCoreSpotlight
//
//  Created by ZhangJingHao2345 on 2017/12/20.
//  Copyright © 2017年 ZhangJingHao2345. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreSpotlight/CoreSpotlight.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

-(BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler
{
    NSString *idetifier = userActivity.userInfo[CSSearchableItemActivityIdentifier];
    NSLog(@"idetifier : %@",idetifier);
    NSString *activityType = userActivity.activityType;
    NSLog(@"activityType : %@",activityType);

    UINavigationController *nav = (UINavigationController *)self.window.rootViewController;
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    // 根据 activityType、idetifier 识别索引
    if ([idetifier isEqualToString:@"baseId"]) {
        vc.title = @"基本展示";
    } else if ([idetifier isEqualToString:@"iconId"]){
        vc.title = @"图片与星评";
    } else if ([idetifier isEqualToString:@"navigationId"]) {
        vc.title = @"导航设置";
    } else if ([idetifier isEqualToString:@"phoneId"]) {
        vc.title = @"拨打电话";
    }
    
    if (vc.title) {
        [nav pushViewController:vc animated:YES];
    }
    
    return YES;
}


@end
