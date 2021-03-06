//
//  SearchResultViewController.m
//  SocialMap
//
//  Created by mebusw on 13-6-12.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "SearchResultViewController.h"
#import "DetailViewController.h"
#import "MainViewController.h"
#include "Distance.h"
#include "MerchantData.h"
#include "AppDelegate.h"

@interface SearchResultViewController () {
    NSArray *merchants;
    CLLocationManager* locationManager;
}
@end

@implementation SearchResultViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    locationManager = app.locationManager;
}


- (void)viewWillAppear:(BOOL)animated {
    self.view.frame = self.parentViewController.view.bounds;
    
    [locationManager startUpdatingLocation];
    locationManager.delegate = (id)self;
    [self refreshTableObjects];
}


/**
 * for iOS 5-
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [self locationManager:manager didUpdateLocations:@[newLocation]];
}

/**
 * for iOS 6+
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocationCoordinate2D myCoord = ((CLLocation*)locations[0]).coordinate;
    printCoordinate(@"list view", myCoord);
    [self refreshTableObjects];
}

-(void) refreshTableObjects {
    merchants = ((MainViewController*)(self.parentViewController)).merchants;
    CLLocationCoordinate2D myCoord = locationManager.location.coordinate;
    
    merchants = [Distance sortMerchantsByDistance:merchants myCoord:myCoord];
    
    [(UITableView*)self.view reloadData];
    
    //NSIndexPath *indexPath01 = [NSIndexPath indexPathForRow:0 inSection:1];
    //[self.tableView insertRowsAtIndexPaths:@[indexPath01] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (SEARCH_LIST_TABLE_VIEW_TAG == tableView.tag) {
        return [merchants count];
    } else {
        //TODO how the search hints behave?
        return 3;
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (SEARCH_LIST_TABLE_VIEW_TAG == tableView.tag) {
        return STR(@"搜索到%d条结果", merchants.count);
    } else {
        return nil;        
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (SEARCH_LIST_TABLE_VIEW_TAG == tableView.tag) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        
        NSDictionary *dict = merchants[indexPath.row];
        cell.textLabel.text = dict[@"name"];
        
        CLLocationCoordinate2D myCoord = locationManager.location.coordinate;
        CLLocationCoordinate2D merchantCoord = CLLocationCoordinate2DMake([dict[@"latitude"] doubleValue], [dict[@"longitude"] doubleValue]);
        
        cell.detailTextLabel.text = STR(@"距离%.2f公里", [Distance calculateDistanceOfCoord1:myCoord Coord2:merchantCoord]);
        // TODO should not caculate distance every time
        //        cell.detailTextLabel.text = STR(@"距离%.2f公里", [dict[@"caculatedDistance"] doubleValue]);
        cell.imageView.image = [UIImage imageNamed:dict[@"images"][0]];
        
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
        cell.textLabel.text = STR(@"曾经搜索的词 %d", [indexPath row]);
    }

    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (SEARCH_LIST_TABLE_VIEW_TAG == tableView.tag) {
        DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        
        [[NSUserDefaults standardUserDefaults] setObject:merchants[indexPath.row] forKey:@"merchant"];
        [self.parentViewController.navigationController pushViewController:detailVC animated:YES];
    }
}

#pragma mark - search bar and data source delegates

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    DLog(@"%@ %@", searchBar, searchText);
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    DLog(@"%@", searchBar);
    NSString *searchText = searchBar.text;
    [searchBar resignFirstResponder];
    
    ((MainViewController*)(self.parentViewController)).merchants = [MerchantData filterMerchants:[MerchantData allMerchants] byName:searchText];
    [self refreshTableObjects];
    
    self.searchDisplayController.active = NO;
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
//    searchBar.showsCancelButton = NO;
}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    DLog(@"%@: %d", searchBar, selectedScope);
}


#pragma mark - others

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



#define ROW_HEIGHT 60

#define NAME_TAG 1
#define TIME_TAG 2
#define IMAGE_TAG 3

#define LEFT_COLUMN_OFFSET 10.0
#define LEFT_COLUMN_WIDTH 160.0

#define MIDDLE_COLUMN_OFFSET 170.0
#define MIDDLE_COLUMN_WIDTH 90.0

#define RIGHT_COLUMN_OFFSET 280.0

#define MAIN_FONT_SIZE 18.0
#define LABEL_HEIGHT 26.0

#define IMAGE_SIDE 30.0

- (UITableViewCell *)tableViewCellWithReuseIdentifier:(NSString *)identifier {
	
	/*
	 Create an instance of UITableViewCell and add tagged subviews for the name, local time, and quarter image of the time zone.
	 */
    
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
	/*
	 Create labels for the text fields; set the highlight color so that when the cell is selected it changes appropriately.
     */
	UILabel *label;
	CGRect rect;
	
	// Create a label for the time zone name.
	rect = CGRectMake(LEFT_COLUMN_OFFSET, (ROW_HEIGHT - LABEL_HEIGHT) / 2.0, LEFT_COLUMN_WIDTH, LABEL_HEIGHT);
	label = [[UILabel alloc] initWithFrame:rect];
	label.tag = NAME_TAG;
	label.font = [UIFont boldSystemFontOfSize:MAIN_FONT_SIZE];
	label.adjustsFontSizeToFitWidth = YES;
	[cell.contentView addSubview:label];
	label.highlightedTextColor = [UIColor whiteColor];
	
	// Create a label for the time.
	rect = CGRectMake(MIDDLE_COLUMN_OFFSET, (ROW_HEIGHT - LABEL_HEIGHT) / 2.0, MIDDLE_COLUMN_WIDTH, LABEL_HEIGHT);
	label = [[UILabel alloc] initWithFrame:rect];
	label.tag = TIME_TAG;
	label.font = [UIFont systemFontOfSize:MAIN_FONT_SIZE];
	label.textAlignment = UITextAlignmentRight;    // NSTextAlignmentRight
	[cell.contentView addSubview:label];
	label.highlightedTextColor = [UIColor yellowColor];
    
	// Create an image view for the quarter image.
	rect = CGRectMake(RIGHT_COLUMN_OFFSET, (ROW_HEIGHT - IMAGE_SIDE) / 2.0, IMAGE_SIDE, IMAGE_SIDE);
    
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
	imageView.tag = IMAGE_TAG;
	[cell.contentView addSubview:imageView];
    
	
	return cell;
}


@end
