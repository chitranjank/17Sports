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

-(void) viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad %f", self.map.region.span.latitudeDelta);
    
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

    
    [self.map setCenterCoordinate:sh.coordinate animated:YES];
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
