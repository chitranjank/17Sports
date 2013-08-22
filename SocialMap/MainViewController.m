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

@interface MainViewController () {
    UIViewController *listView;
    UIImageView *v1, *v2;
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
    
    [self startLocating];
    
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
    self.searchDisplayController.searchBar.hidden = NO;
    [self.searchDisplayController setActive:YES];
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
    [self.locationManager startUpdatingLocation];
}

-(void) startLocating {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = (id)self;//设置代理
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;//指定需要的精度级别
    self.locationManager.distanceFilter = 1000.0f;//设置距离筛选器
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    printCoordinate(@"list view", ((CLLocation*)locations[0]).coordinate);
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

#pragma mark - search bar and data source delegates
//TODO should move to a dedicate class for searching

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    DLog(@"%@ %@", searchBar, searchText);
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    DLog(@"%@", searchBar);
    NSString *searchText = searchBar.text;
    [self.searchDisplayController setActive:NO];
    self.merchants = [MerchantData filterMerchants:[MerchantData allMerchants] byName:searchText];
    DLog(@"%d =%@=", self.merchants.count, searchText);
    if (isShowingWelcome) {
        [self switchToList];
    }  
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    DLog(@"%@", searchBar);
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    DLog(@"%@: %d", searchBar, selectedScope);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // TODO here's the search text hint
    return 3;
//    return searchedMerchants.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    // TODO here's the search text hint
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.textLabel.text = @"曾经搜索的词";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO here's the search text hint
    
//    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
//    
//    [[NSUserDefaults standardUserDefaults] setObject:searchedMerchants[indexPath.row] forKey:MERCHANT];
//    [self.parentViewController.navigationController pushViewController:detailVC animated:YES];
}
@end
