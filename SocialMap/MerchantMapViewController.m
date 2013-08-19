//
//  MerchantMapViewController.m
//  17sports
//
//  Created by mebusw on 13-6-27.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "MerchantMapViewController.h"
#import "Anno.h"
#import "Distance.h"

@interface MerchantMapViewController () {
    CLLocationManager* locationManager;
}

@end

@implementation MerchantMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self startLocating];
    
    [self.map setShowsUserLocation:YES];
    
    DLog(@"locating is %d, auth status=%d", [CLLocationManager locationServicesEnabled],  [CLLocationManager authorizationStatus]);
}


-(void) startLocating {
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = (id)self;//设置代理
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;//指定需要的精度级别
    locationManager.distanceFilter = 1000.0f;//设置距离筛选器
}

- (void)viewWillAppear:(BOOL)animated {
    [locationManager startUpdatingLocation];
    locationManager.delegate = (id)self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    printCoordinate(@"", ((CLLocation*)locations[0]).coordinate);
    [self addAnnos];
    [self centerMap];

}

-(void) addAnnos {
    NSDictionary *merchant = [[NSUserDefaults standardUserDefaults] objectForKey:MERCHANT];
    
    Anno *anno = [[Anno alloc] init];
    NSNumber *lat = ((NSNumber*)merchant[@"latitude"]);
    NSNumber *lng = ((NSNumber*)merchant[@"longitude"]);
    
    
    CLLocationCoordinate2D myCoord = locationManager.location.coordinate;
    anno.coordinate = CLLocationCoordinate2DMake([lat doubleValue], [lng doubleValue]);
    
    anno.title = merchant[@"name"];
    anno.subtitle = STR(@"距离%.2f公里", [Distance calculateDistanceOfCoord1:myCoord Coord2:anno.coordinate]);
    anno.merchant = merchant;
    
    [self.map addAnnotation:anno];
    
}

-(void) centerMap {
    MKCoordinateSpan theSpan;    //地图的范围 越小越精确
    theSpan.latitudeDelta = 1.0;
    theSpan.longitudeDelta = 1.0;
    
    MKCoordinateRegion theRegion;
    theRegion.center = locationManager.location.coordinate;
    
    theRegion.span = theSpan;
    [self.map setRegion:theRegion];
    [self.map setCenterCoordinate:theRegion.center animated:YES];
}

@end
