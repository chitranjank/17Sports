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


@interface MainViewController () {
    UIViewController *listView;
    UIImageView *v1, *v2;
    MapViewController *mapVC;
    SearchResultViewController *listVC;
    WelcomeViewController *welcomeVC;
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

    self.merchants = [NSMutableArray arrayWithArray:@[
                      @{@"id": @"1", @"name": @"复康路游泳馆", @"longtitude": @39.099142, @"latitude": @117.171809},
                      @{@"id": @"4", @"name": @"三源益康", @"longtitude": @39.1273, @"latitude": @117.2503},
                      @{@"id": @"3", @"name": @"游泳跳水馆", @"longtitude": @39.1099, @"latitude": @117.2554}
                      ]];
    
    

    mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    listVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultViewController"];
    welcomeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"WelcomeViewController"];

    
    [self addChildViewController:mapVC];
    [self addChildViewController:listVC];
    [self addChildViewController:welcomeVC];
    

    [self.container addSubview:welcomeVC.view];
    
    DLog(@"c=%@  ||| %@", self.container, self.container.subviews);
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;

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
}

-(IBAction) toogleListAndMap {
    DLog(@"toogle %@", self);
    static BOOL isShowingListOrMap = YES;
    
    
    if (isShowingListOrMap) {
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
    isShowingListOrMap = !isShowingListOrMap;
    DLog(@"c=%@  ||| %@", self.container, self.container.subviews);

}

#pragma mark - search bar and data source delegates
//TODO should move to a dedicate class for searching

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    DLog(@"%@ %@", searchBar, searchText);
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    DLog(@"%@", searchBar);
    [self.searchDisplayController setActive:NO];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    DLog(@"%@", searchBar);
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.textLabel.text = @"天津";
    return cell;
}
@end
