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

@interface SearchResultViewController () {
    NSArray *merchants;
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
    
    [self initTableObjects];
    
}

-(void) initTableObjects {
    if (!merchants) {
        merchants = ((MainViewController*)(self.parentViewController)).merchants;
    }
    
  
    
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [merchants count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    DLog(@"Sec no=%d %@", section, tableView);
    if(section == 1) {
        return @"map section";
    }
    return @"搜索到12条结果";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DLog(@"%@ %@", tableView, indexPath);
    /* tag 100 is defined in stroy board*/
    /*if (tableView.tag != 100) {
        return [self tableViewCellWithReuseIdentifier:@"Found"];
    }*/
    
#ifdef ios6
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
#else
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
#endif
    
    
    //UITableViewCell *cell = [self tableViewCellWithReuseIdentifier:@"Cell"];
    
    //((UILabel *)[cell.contentView viewWithTag:NAME_TAG]).text = @"CUSTOM";
    if (indexPath.section == 0) {
        NSDictionary *dict = merchants[indexPath.row];
        cell.textLabel.text = dict[@"name"];
        cell.imageView.image = [UIImage imageNamed:STR(@"%@ %@.jpg", dict[@"id"], dict[@"name"])];        
    } else {
        //cell.textLabel.text = @"Map here";
    }
    return cell;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    DLog(@"%@", self.parentViewController);
    [self.parentViewController.navigationController pushViewController:detailVC animated:YES];
}



@end
