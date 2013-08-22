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
}


- (void)viewWillAppear:(BOOL)animated {
    locationManager = ((MainViewController*)(self.parentViewController)).locationManager;
    locationManager.delegate = (id)self;
    [locationManager startUpdatingLocation];
}

-(void) refreshTableObjects {
    merchants = ((MainViewController*)(self.parentViewController)).merchants;
    CLLocationCoordinate2D myCoord = locationManager.location.coordinate;
    
    merchants = [Distance sortMerchantsByDistance:merchants myCoord:myCoord];
    
    [(UITableView*)self.view reloadData];
    
    //NSIndexPath *indexPath01 = [NSIndexPath indexPathForRow:0 inSection:1];
    //[self.tableView insertRowsAtIndexPaths:@[indexPath01] withRowAnimation:UITableViewRowAnimationAutomatic];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [merchants count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 1) {
        return @"map section";
    }
    return STR(@"搜索到%d条结果", merchants.count);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
#ifdef ios6
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
#else
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
#endif
    

    if (indexPath.section == 0) {
        NSDictionary *dict = merchants[indexPath.row];
        cell.textLabel.text = dict[@"name"];
        
        CLLocationCoordinate2D myCoord = locationManager.location.coordinate;
        CLLocationCoordinate2D merchantCoord = CLLocationCoordinate2DMake([dict[@"latitude"] doubleValue], [dict[@"longitude"] doubleValue]);
        
        cell.detailTextLabel.text = STR(@"距离%.2f公里", [Distance calculateDistanceOfCoord1:myCoord Coord2:merchantCoord]);
        // TODO should not caculate distance every time
//        cell.detailTextLabel.text = STR(@"距离%.2f公里", [dict[@"caculatedDistance"] doubleValue]);
        cell.imageView.image = [UIImage imageNamed:dict[@"images"][0]];
    } else {
        //cell.textLabel.text = @"Map here";
    }
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    [[NSUserDefaults standardUserDefaults] setObject:merchants[indexPath.row] forKey:@"merchant"];
    [self.parentViewController.navigationController pushViewController:detailVC animated:YES];
}

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
