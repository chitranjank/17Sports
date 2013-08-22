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
#import "Distance.h"
#import "MerchantData.h"

@interface MapViewController () {
    NSArray *merchants;
    CLLocationManager* locationManager;
}
@end

@implementation MapViewController


-(void) viewDidLoad {  
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
    locationManager = ((MainViewController*)(self.parentViewController)).locationManager;
    locationManager.delegate = (id)self;
    [locationManager startUpdatingLocation];

    [self.map setShowsUserLocation:YES];
}

/**
 * for iOS 5-
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [self locationManager:manager didUpdateLocations:@[newLocation]];
}

/**
 * for iOS 6+
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    printCoordinate(@"map view", ((CLLocation*)locations[0]).coordinate);
    merchants = ((MainViewController*)(self.parentViewController)).merchants;
    [self removeAllAnnotations];
    [self centerMap];
    [self addAnnotations];

}


- (void)removeAllAnnotations {
    [self.map removeAnnotations:self.map.annotations];
}

-(void) addAnnotations {
    for (NSDictionary *merchant in merchants) {
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
}

-(void) centerMap {
    MKCoordinateSpan theSpan;    //地图的范围 越小越精确
    theSpan.latitudeDelta = .2;
    theSpan.longitudeDelta = .2;
    
    MKCoordinateRegion theRegion;
    theRegion.center = locationManager.location.coordinate;
    
    theRegion.span = theSpan;
    [self.map setRegion:theRegion];
    [self.map setCenterCoordinate:theRegion.center animated:YES];
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

}

-(void) mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {    
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    MKAnnotationView* aView = view;
    Anno *anno = aView.annotation;
    
    [[NSUserDefaults standardUserDefaults] setObject:anno.merchant forKey:@"merchant"];
    [self.parentViewController.navigationController pushViewController:detailVC animated:YES];
}


@end
