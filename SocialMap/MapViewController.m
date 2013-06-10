//
//  MapViewController.m
//  SocialMap
//
//  Created by mebusw on 13-4-5.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "MapViewController.h"
#import "Anno.h"
@implementation MapViewController

- (id)initWithCoder:(NSCoder *)decoder {
    NSLog(@"nscode=%@", decoder);
    return [super initWithCoder:(NSCoder *)decoder];
}

-(void) viewDidLoad {
    [super viewDidLoad];
    NSLog(@"map viewDidLoad %f", self.map.region.span.latitudeDelta);

    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = (id)self;//设置代理
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;//指定需要的精度级别
    locationManager.distanceFilter=1000.0f;//设置距离筛选器
    [locationManager startUpdatingLocation];//启动位置管理器
    
    MKCoordinateSpan theSpan;    //地图的范围 越小越精确
    theSpan.latitudeDelta=5;
    theSpan.longitudeDelta=5;
    MKCoordinateRegion theRegion;
    theRegion.center=[[locationManager location] coordinate];
    theRegion.span=theSpan;
    [self.map setRegion:theRegion];
    
    [self.map setCenterCoordinate:theRegion.center animated:YES];
    NSLog(@"here=%f, %f", theRegion.center.latitude, theRegion.center.longitude);
    
    
    
    Anno *sh = [[Anno alloc] init];
    sh.coordinate = CLLocationCoordinate2DMake(31.240948, 121.485958);
    sh.title = @"Shanghai";
    sh.subtitle = @"MoDu";

    Anno *bj = [[Anno alloc] init];
    bj.coordinate = CLLocationCoordinate2DMake(39.908605, 116.398019);
    bj.title = @"Beijing";
    bj.subtitle = @"DiDu";
    
    [self.map addAnnotations:@[sh, bj]];
    
    [self.map setShowsUserLocation:YES];

    

}

-(MKAnnotationView*) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKAnnotationView *aView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"AAA"];
    if(!aView){
        aView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation  reuseIdentifier:@"AAA"];
        aView.canShowCallout = YES;
        aView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    aView.annotation = annotation;
    return aView;
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    NSLog(@"%@", mapView);
}

-(void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    NSLog(@"calloutAccessoryControlTapped %f", self.map.region.span.latitudeDelta);
    NSLog(@"calloutAccessoryControlTapped %f", self.map.region.span.longitudeDelta);
}


@end
