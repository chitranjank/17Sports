//
//  SearchTest.m
//  17sports
//
//  Created by mebusw on 13-8-22.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "SearchTest.h"

@implementation SearchTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testPredicate1 {
    NSString *prefix = @"prefix";
    NSString *suffix = @"suffix";
    NSPredicate *predicate = [NSPredicate
                              predicateWithFormat:@"SELF like[c] %@",
                              [[prefix stringByAppendingString:@"*"] stringByAppendingString:suffix]];
    BOOL ok = [predicate evaluateWithObject:@"prefixyyyyyysuffix"];
    STAssertTrue(ok, nil);
}

- (void)testPredicate2 {
    NSArray *arr = @[
     @{
     @"id": @67,
     @"name": @"天津峪景山地高尔夫俱乐部",
     @"latitude": @40.094230,
     @"longitude": @117.523355,
     @"address": @"天津市蓟县毛家峪长寿度假村",
     @"phone": @"022-88826203",
     @"price": @"760",
     @"images": @[@"67.jpg"],
     @"description": @"球场内地形险峻，落差超过164码，18个球洞全部建在著名风景区盘山东麓的山体上。"
     },
     @{
     @"id": @68,
     @"name": @"天津杨柳青高尔夫俱乐部",
     @"latitude": @39.1488,
     @"longitude": @117.008188,
     @"address": @"天津市西青区杨柳青镇一经路立交桥北",
     @"phone": @"022-27937878",
     @"price": @"400",
     @"images": @[@"68.jpg"],
     @"description": @"于1999年十月正式对外营业的杨柳青高尔夫俱乐部是一个大型的国际锦标级具有三十六个球洞的高尔夫度假村。"
     }
     ];
    NSString *attributeName = @"name";
    NSString *attributeValue = @"*杨柳青*";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like[c] %@",
                              attributeName, attributeValue];
    NSArray *result = [arr filteredArrayUsingPredicate:predicate];
    DLog(@"%@", result);
    STAssertEquals(1U, [result count], nil);
}
@end
