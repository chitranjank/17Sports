//
//  MainViewController.m
//  SocialMap
//
//  Created by mebusw on 13-6-12.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "MainViewController.h"
#import "SearchResultViewController.h"
#import "DetailViewController.h"
#import "MapViewController.h"


@interface MainViewController () {
    UIViewController *listView;
    UIImageView *v1, *v2;
    MapViewController *mapVC;
    SearchResultViewController *listVC;
}

@end

@implementation MainViewController

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

    DLog(@"c=%@  ||| %@", self.container, self.container.subviews);
    

    mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    listVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultViewController"];
    
    [self addChildViewController:mapVC];
    [self addChildViewController:listVC];
    
    [self.container addSubview:listVC.view];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//@property (weak, nonatomic) IBOutlet UIView *container;

-(IBAction) toogleListAndMap {
    DLog(@"toogle %@", self);
    static BOOL isShowingListOrMap = YES;
    
    
    if (isShowingListOrMap) {
        [UIView transitionWithView:self.container
                          duration:0.8
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{ [listVC.view removeFromSuperview]; [self.container addSubview:mapVC.view]; }
                        completion:NULL];
     
    } else {
        [UIView transitionWithView:self.container
                          duration:0.8
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{ [mapVC.view removeFromSuperview]; [self.container addSubview:listVC.view]; }
                        completion:NULL];
        
    }
    isShowingListOrMap = !isShowingListOrMap;
    
}

@end
