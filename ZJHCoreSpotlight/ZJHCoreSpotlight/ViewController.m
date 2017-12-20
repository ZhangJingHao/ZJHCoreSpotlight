//
//  ViewController.m
//  ZJHCoreSpotlight
//
//  Created by ZhangJingHao2345 on 2017/12/20.
//  Copyright © 2017年 ZhangJingHao2345. All rights reserved.
//

#import "ViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)setSearchContent {
    // iOS9之前不处理
    if ([UIDevice currentDevice].systemVersion.floatValue < 9.0) {
        return;
    }
    
    // 基本展示
    CSSearchableItemAttributeSet *set1 =
    [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"base"];
    set1.title = @"基本展示";
    set1.contentDescription = @"我是基本展示详情，包含标题和详情描述。这里没设置图片，默认展示 App icon";
    // 搜索关键词务必要设置，不然会搜索不到
    set1.contactKeywords = @[@"我是", @"基本", @"展示"];
    CSSearchableItem *item1 =
    [[CSSearchableItem alloc] initWithUniqueIdentifier:@"baseId"
                                      domainIdentifier:@"baseDomainId"
                                          attributeSet:set1];
    
    // 图片与星评
    CSSearchableItemAttributeSet *set2 =
    [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"icon"];
    set2.title = @"图片与星评";
    set2.contentDescription = @"我是图片与星评展示，设置的图片展示的效果系统并不会给你处理，设置什么样的图片就会展示什么样的图片。还可以设置星评";
    set2.contactKeywords = @[@"我是", @"图片", @"星评"];
    set2.rating = @(3.5);
    set2.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:@"share_qq"]);
    CSSearchableItem *item2 =
    [[CSSearchableItem alloc] initWithUniqueIdentifier:@"iconId"
                                      domainIdentifier:@"iconDomainId"
                                          attributeSet:set2];
    
    // 导航设置
    CSSearchableItemAttributeSet *set3 =
    [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"navigation"];
    set3.title = @"导航设置";
    set3.contentDescription = @"我是导航设置，点击导航会跳转到地图，然后系统自动导航";
    set3.latitude = @(31.239);
    set3.longitude = @(121.499);
    set3.supportsNavigation = @(YES);
    set3.contactKeywords = @[@"我是", @"导航", @"设置"];
    set3.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:@"icon_invitation_weibo"]);
    CSSearchableItem *item3 =
    [[CSSearchableItem alloc] initWithUniqueIdentifier:@"navigationId"
                                      domainIdentifier:@"navigationDomainId"
                                          attributeSet:set3];
    
    // 拨打电话
    CSSearchableItemAttributeSet *set4 =
    [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"phone"];
    set4.title = @"拨打电话";
    set4.contentDescription = @"我是拨打电话样式，只在真机上有效，模拟器无效";
    set4.phoneNumbers = @[@"10086"];
    set4.supportsPhoneCall = @(YES);
    set4.contactKeywords = @[@"我是", @"拨打", @"电话"];
    set4.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:@"share_message"]);
    CSSearchableItem *item4 =
    [[CSSearchableItem alloc] initWithUniqueIdentifier:@"phoneId"
                                      domainIdentifier:@"phoneDomainId"
                                          attributeSet:set4];

    // 把上面的设置item都添加进入
    NSArray *items = @[item1, item2, item3, item4];
    CSSearchableIndex *searchIndex = [CSSearchableIndex defaultSearchableIndex];
    [searchIndex indexSearchableItems:items
                    completionHandler:^(NSError * _Nullable error) {
                        if (!error) {
                            NSLog(@"添加成功");
                        } else {
                            NSLog(@"添加失败%@",error);
                        }
                    }];
}

- (IBAction)deleteSearchItem {
    // 根据 UniqueIdentifier 删除索引
    NSArray *identifiers = @[@"navigationId", @"phoneId"];
    CSSearchableIndex *searchIndex = [CSSearchableIndex defaultSearchableIndex];
    [searchIndex deleteSearchableItemsWithIdentifiers:identifiers
                                    completionHandler:^(NSError * _Nullable error) {
                                        if (!error) {
                                            NSLog(@"删除成功");
                                        } else {
                                            NSLog(@"删除失败%@",error);
                                        }
    }];
}

@end
