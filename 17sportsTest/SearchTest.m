//
//  SearchTest.m
//  17sports
//
//  Created by mebusw on 13-8-22.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "SearchTest.h"
#import "MerchantData.h"
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
     @"description": @"球场内地形险峻，落差超过164码，18个球洞全部建在著名风景区盘山东麓的山体上。"
     },
     @{
     @"id": @68,
     @"name": @"天津杨柳青高尔夫俱乐部",
     @"description": @"于1999年十月正式对外营业的杨柳青高尔夫俱乐部是一个大型的国际锦标级具有三十六个球洞的高尔夫度假村。"
     }
     ];
    NSArray *result = [MerchantData filterMerchants:arr byName:@"杨柳青"];
    DLog(@"%@", result);
    
    STAssertEquals(1U, [result count], nil);
}
@end
