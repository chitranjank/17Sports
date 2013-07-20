//
//  SearchResultViewController.h
//  SocialMap
//
//  Created by mebusw on 13-6-12.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SearchResultViewController : UITableViewController


@property (weak, nonatomic) IBOutlet UIView *tView;


-(double) calculateDistanceOfCoord1:(CLLocationCoordinate2D)coord1 Coord2:(CLLocationCoordinate2D)coord2;
@end
