//
//  Distance.h
//  17sports
//
//  Created by mebusw on 13-8-19.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface Distance : NSObject

+(double) calculateDistanceOfCoord1:(CLLocationCoordinate2D)coord1 Coord2:(CLLocationCoordinate2D)coord2;


@end
