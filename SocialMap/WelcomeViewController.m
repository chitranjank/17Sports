//
//  WelcomeViewController.m
//  17sports
//
//  Created by mebusw on 13-6-27.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "WelcomeViewController.h"
#import "MainViewController.h"
#import "DetailViewController.h"
#import <MapKit/MapKit.h>

@interface WelcomeViewController () {
    CLLocationManager *locationManager;
}
@end

@implementation WelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)shortcuts:(id)sender {
    [(MainViewController*)self.parentViewController switchToList];
}

-(IBAction)recommends:(id)sender {
    DLog(@"%d", ((UIButton*)sender).tag);

    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    DLog(@"%@", self.parentViewController);
    [self.parentViewController.navigationController pushViewController:detailVC animated:YES];
}
@end
