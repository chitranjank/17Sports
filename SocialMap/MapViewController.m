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
    
    [self initTableObjects];
    [self.map setShowsUserLocation:YES];
    locationManager = ((MainViewController*)(self.parentViewController)).locationManager;
}


-(void) initTableObjects {
    if (!merchants) {
        merchants = [MerchantData allMerchants];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [locationManager startUpdatingLocation];
    locationManager.delegate = (id)self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    printCoordinate(@"", ((CLLocation*)locations[0]).coordinate);
    [self centerMap];
    [self addAnnos];
}


-(void) addAnnos {
    for (NSDictionary *merchant in merchants) {
        Anno *anno = [[Anno alloc] init];
        NSNumber *lat = ((NSNumber*)merchant[@"latitude"]);
        NSNumber *lng = ((NSNumber*)merchant[@"longitude"]);


        CLLocationCoordinate2D myCoord = locationManager.location.coordinate;
        printCoordinate(@"", myCoord);
        anno.coordinate = CLLocationCoordinate2DMake([lat doubleValue], [lng doubleValue]);
        
        anno.title = merchant[@"name"];
        anno.subtitle = STR(@"距离%.2f公里", [Distance calculateDistanceOfCoord1:myCoord Coord2:anno.coordinate]);
        
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
    DLog(@"");
    
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
    DLog(@"calloutAccessoryControlTapped %f %f", self.map.region.span.latitudeDelta, self.map.region.span.longitudeDelta);
    
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    DLog(@"%@", self.parentViewController);
    [self.parentViewController.navigationController pushViewController:detailVC animated:YES];
}


@end
