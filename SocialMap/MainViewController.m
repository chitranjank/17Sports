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
#import "WelcomeViewController.h"
#import "MerchantData.h"
#import "AppDelegate.h"

@interface MainViewController () {
    MapViewController *mapVC;
    SearchResultViewController *listVC;
    WelcomeViewController *welcomeVC;
    
    BOOL isShowingWelcome;
    BOOL isShowingListNotMap;
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

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        self.clearsSelectionOnViewWillAppear = NO;
//        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self createSubViews];
    [self customizeTitleView];
    
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    self.searchDisplayController.searchBar.hidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarItemChanged:) name:TAB_BAR_ITEM_CHANGED object:nil];
}

-(void) customizeTitleView {
    UIImage *logo = [UIImage imageNamed:@"logo.png"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:logo];
}

-(void) tabBarItemChanged:(id)obj {
    DLog(@"%@", obj);
//    self.searchDisplayController.searchBar.hidden = NO;
//    [self.searchDisplayController setActive:YES];
}

-(void) createSubViews {
    mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    listVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultViewController"];
    welcomeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"WelcomeViewController"];
    
    [self addChildViewController:mapVC];
    [self addChildViewController:listVC];
    [self addChildViewController:welcomeVC];
    
    welcomeVC.view.frame = self.container.bounds;
    mapVC.view.frame = self.container.bounds;
    listVC.view.frame = self.container.bounds;

    [self.container addSubview:welcomeVC.view];
    
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    
    isShowingWelcome = YES;
    
}


-(void) viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) switchToList {
    [UIView transitionWithView:self.container
                    duration:0.8
                    options:UIViewAnimationOptionTransitionCurlUp
                    animations:^{
                        [welcomeVC.view removeFromSuperview];
                        [self.container addSubview:listVC.view];
                        self.navigationItem.leftBarButtonItem = self.btnWelcomePage;
                        self.navigationItem.rightBarButtonItem = self.btnToogleListAndMap;
                    }
                    completion:NULL];
    isShowingListNotMap = YES;
    isShowingWelcome = NO;
}

-(IBAction)switchToWelcomePage:(id)sender {
    [UIView transitionWithView:self.container
                    duration:0.8
                    options:UIViewAnimationOptionTransitionCurlDown
                    animations:^{
                        [mapVC.view removeFromSuperview];
                        [listVC.view removeFromSuperview];
                        [self.container addSubview:welcomeVC.view];
                        self.navigationItem.leftBarButtonItem = nil;
                        self.navigationItem.rightBarButtonItem = nil;
                    }
                    completion:NULL];
    isShowingWelcome = YES;
}

-(IBAction) toogleListAndMap {
    if (isShowingListNotMap) {
        [UIView transitionWithView:self.container
                        duration:0.8
                        options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{ [listVC.view removeFromSuperview]; [self.container addSubview:mapVC.view]; }
                        completion:NULL];
        [mapVC centerMap];
     
    } else {
        [UIView transitionWithView:self.container
                        duration:0.8
                        options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{ [mapVC.view removeFromSuperview]; [self.container addSubview:listVC.view]; }
                        completion:NULL];
        
    }
    isShowingListNotMap = !isShowingListNotMap;
}

@end
