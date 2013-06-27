//
//  MerchantMapViewController.h
//  17sports
//
//  Created by mebusw on 13-6-27.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>



@interface MerchantMapViewController : UIViewController<MKMapViewDelegate>
@property (nonatomic, strong) IBOutlet MKMapView *map;
@end
