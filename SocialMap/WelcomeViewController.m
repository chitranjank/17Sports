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

    [self.view addGestureRecognizer:self.swipeLeftRecognizer];
    [self.view addGestureRecognizer:self.swipeRightRecognizer];
    imagesOfMerchant = @[@"recommends"];
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

#define imageTop 78
#define imageLeft 40
#define imageWidth 240
#define imageHeight 128
#define screenWidth 320


- (IBAction)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
	CGPoint location = [recognizer locationInView:self.view];
    DLog(@"%f, %f,   direction=%d", location.x, location.y, recognizer.direction);
    
    self.imageOld.image = self.imageCurrent.image;
    [self.imageOld setFrame:CGRectMake(imageLeft, imageTop, imageWidth, imageHeight)];
    self.imageOld.hidden = NO;
    int count = [imagesOfMerchant count];
    int current = self.ImagePageControl.currentPage;
    int next;
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        next = (current + count - 1) % count;
        
        self.imageCurrent.image = [UIImage imageNamed:imagesOfMerchant[next]];
        [self.imageCurrent setFrame:CGRectMake(screenWidth, imageTop, imageWidth, imageHeight)];
        
        [UIView animateWithDuration:0.55 animations:^{
            [self.imageCurrent setFrame:CGRectMake(imageLeft, imageTop, imageWidth, imageHeight)];
            [self.imageOld setFrame:CGRectMake(-screenWidth, imageTop, imageWidth, imageHeight)];
        }];
    } else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight){
        next = (current + count + 1) % count;
        
        self.imageCurrent.image = [UIImage imageNamed:imagesOfMerchant[next]];
        [self.imageCurrent setFrame:CGRectMake(-screenWidth, imageTop, imageWidth, imageHeight)];
        
        [UIView animateWithDuration:0.55 animations:^{
            [self.imageCurrent setFrame:CGRectMake(imageLeft, imageTop, imageWidth, imageHeight)];
            [self.imageOld setFrame:CGRectMake(screenWidth, imageTop, imageWidth, imageHeight)];
        }];
    }
    self.ImagePageControl.currentPage = next;
    
}

@end
