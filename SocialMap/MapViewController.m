//
//  MapViewController.m
//  SocialMap
//
//  Created by mebusw on 13-4-5.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "MapViewController.h"
#import "Anno.h"
#import "DetailViewController.h"
#import "MainViewController.h"

@interface MapViewController () {
    NSArray *merchants;
}
@end

@implementation MapViewController

-(void) viewDidLoad {
    
    [super viewDidLoad];
    
    [self addAnnos];

    DLog(@"locating is %d, auth status=%d", [CLLocationManager locationServicesEnabled],  [CLLocationManager authorizationStatus]);

    
    [self.map setShowsUserLocation:YES];
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = (id)self;//设置代理
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;//指定需要的精度级别
    locationManager.distanceFilter = 1000.0f;//设置距离筛选器
    [locationManager startUpdatingLocation];//启动位置管理器
    
    [self centerMap];
}

-(void) addAnnos {
    if (!merchants) {
        merchants = ((MainViewController*)(self.parentViewController)).merchants;
    }
    
    for (NSDictionary *merchant in merchants) {
        Anno *anno = [[Anno alloc] init];
        NSNumber *lng = ((NSNumber*)merchant[@"longtitude"]);
        NSNumber *lat = ((NSNumber*)merchant[@"latitude"]);
        
        anno.coordinate = CLLocationCoordinate2DMake([lng floatValue], [lat floatValue]);
        anno.title = merchant[@"name"];
        anno.subtitle = @"距离1.2km";
        
        [self.map addAnnotation:anno];
    }
    /*
     Anno *sh = [[Anno alloc] init];
     sh.coordinate = CLLocationCoordinate2DMake(31.240948, 121.485958);
     sh.title = @"Shanghai";
     sh.subtitle = @"MoDu";
     
     Anno *bj = [[Anno alloc] init];
     bj.coordinate = CLLocationCoordinate2DMake(39.908605, 116.398019);
     bj.title = @"Beijing";
     bj.subtitle = @"DiDu";
    
    [self.map addAnnotations:@[sh, bj]];
     */
}

-(void) centerMap {
    MKCoordinateSpan theSpan;    //地图的范围 越小越精确
    theSpan.latitudeDelta = .2;
    theSpan.longitudeDelta = .2;
    
    MKCoordinateRegion theRegion;
    theRegion.center = [self.map userLocation].coordinate;
    theRegion.span = theSpan;
    [self.map setRegion:theRegion];
    [self.map setCenterCoordinate:theRegion.center animated:YES];
    NSLog(@"here=%f, %f", theRegion.center.latitude, theRegion.center.longitude);
}

-(MKAnnotationView*) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    MKAnnotationView *aView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
    if(!aView){
        aView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation  reuseIdentifier:@"Pin"];
        aView.canShowCallout = YES;
        
        aView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        aView.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"6-12AM.png"]];
    }
    aView.annotation = annotation;
    return aView;
}



-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    DLog(@"%@", mapView);
}

-(void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    DLog(@"calloutAccessoryControlTapped %f %f", self.map.region.span.latitudeDelta, self.map.region.span.longitudeDelta);
    
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    DLog(@"%@", self.parentViewController);
    [self.parentViewController.navigationController pushViewController:detailVC animated:YES];
}


@end
