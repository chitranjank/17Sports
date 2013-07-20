//
//  DistanceTest.m
//  DistanceTest
//
//  Created by mebusw on 13-7-20.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "DistanceTest.h"
#import "SearchResultViewController.h"
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
    SearchResultViewController *controller = [[SearchResultViewController alloc] init];
    CLLocationCoordinate2D coord1 = CLLocationCoordinate2DMake(70.1, 50.2);
    CLLocationCoordinate2D coord2 = CLLocationCoordinate2DMake(75.3, 48.4);
    
    double distance = [controller calculateDistanceOfCoord1:coord1 Coord2:coord2];
    STAssertEqualsWithAccuracy(581.853, distance, 0.001, nil);
    
}

@end
