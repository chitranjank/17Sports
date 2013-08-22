//
//  DistanceTest.m
//  DistanceTest
//
//  Created by mebusw on 13-7-20.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "DistanceTest.h"
#import "Distance.h"
#import <MapKit/MapKit.h>

@implementation DistanceTest

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

- (void)testCalculateDistance
{
    CLLocationCoordinate2D coord1 = CLLocationCoordinate2DMake(70.1, 50.2);
    CLLocationCoordinate2D coord2 = CLLocationCoordinate2DMake(75.3, 48.4);
    
    double result = [Distance calculateDistanceOfCoord1:coord1 Coord2:coord2];
    STAssertEqualsWithAccuracy(581.853, result, 0.001, nil);
    
}

-(void) testCompareMerchantByDistance {
    CLLocationCoordinate2D myCoord = CLLocationCoordinate2DMake(71.3, 50.4);

    NSDictionary *nearest = @{@"id":@"101", @"latitude":@71.1, @"longitude":@50.2};
    NSDictionary *middle = @{@"id":@"103", @"latitude":@72.1, @"longitude":@49.2};
    NSDictionary *farthest = @{@"id":@"102",@"latitude":@75.3, @"longitude":@48.4};
    NSArray *merchants = @[middle, farthest, nearest];
    
    NSArray *result = [Distance sortMerchantsByDistance:merchants myCoord:myCoord];
    STAssertEquals(nearest, result[0], nil);
    STAssertEquals(middle, result[1], nil);
    STAssertEquals(farthest, result[2], nil);
}

@end
