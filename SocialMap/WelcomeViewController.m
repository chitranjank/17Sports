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
#import "SwipeVC.h"

@interface WelcomeViewController () {
    CLLocationManager *locationManager;
    NSArray *imagesOfMerchant;
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

    SwipeVC *swipeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SwipeVC"];

    [self addChildViewController:swipeVC];
    [self.containerView addSubview:swipeVC.view];
    
    DLog(@"%@", swipeVC);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)shortcuts:(id)sender {
    DLog(@"tag=%d", ((UIButton*)sender).tag);
    [(MainViewController*)self.parentViewController switchToList];
}

-(IBAction)recommends:(id)sender {
    DLog(@"tag=%d", ((UIButton*)sender).tag);

    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [self.parentViewController.navigationController pushViewController:detailVC animated:YES];
}


@end
