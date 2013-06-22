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

    self.merchants = [NSMutableArray arrayWithArray:@[
                      @{@"id": @"1", @"name": @"复康路游泳馆", @"longtitude": @39.099142, @"latitude": @117.171809},
                      @{@"id": @"4", @"name": @"三源益康", @"longtitude": @39.1273, @"latitude": @117.2503},
                      @{@"id": @"3", @"name": @"游泳跳水馆", @"longtitude": @39.1099, @"latitude": @117.2554}
                      ]];
    
    

    mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    listVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultViewController"];
    
    [self addChildViewController:mapVC];
    [self addChildViewController:listVC];
    
    [self.container addSubview:mapVC.view];
    [self.container addSubview:listVC.view];

    DLog(@"c=%@  ||| %@", self.container, self.container.subviews);


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
    NSLog(@"%@", searchText);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    return cell;
}
@end
