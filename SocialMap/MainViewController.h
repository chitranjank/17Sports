//
//  MainViewController.h
//  SocialMap
//
//  Created by mebusw on 13-6-12.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MainViewController : UIViewController<UISearchBarDelegate, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *container;
@property (strong, nonatomic) NSArray *merchants;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnWelcomePage;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnToogleListAndMap;

@property (strong, nonatomic) CLLocationManager* locationManager;

-(IBAction) toogleListAndMap;
-(void) switchToList;
-(IBAction)switchToWelcomePage:(id)sender;

@end
