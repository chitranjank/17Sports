//
//  DetailViewController.m
//  SocialMap
//
//  Created by mebusw on 13-4-5.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "DetailViewController.h"
#import "MapViewController.h"

@interface DetailViewController () {
    NSArray *imagesOfMerchant;
    NSDictionary *merchant;
}
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    ((UIScrollView*)(self.view)).contentSize = CGSizeMake(320, 460);
}

- (void)configureView
{
    if (self.detailItem) {
        // Update the user interface for the detail item.
    }
    
    merchant = [[NSUserDefaults standardUserDefaults] objectForKey:@"merchant"];
    
    self.labelName.text = merchant[@"name"];
    self.labelPrice.text = STR(@"价格：%@", merchant[@"price"]);
    self.labelDescription.text = merchant[@"description"];
    self.btnPhone.titleLabel.text = STR(@"电话：%@", merchant[@"phone"]);
    self.btnAddress.titleLabel.text = STR(@"地址：%@", merchant[@"address"]);
    
    imagesOfMerchant = merchant[@"images"];
    self.imageCurrent.image = [UIImage imageNamed:imagesOfMerchant[0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}


/**
 * This only works on real devices.
 */
- (IBAction)callPhone:(id)sender {
    NSString *num = [[NSString alloc] initWithFormat:@"telprompt://%@", merchant[@"phone"]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]];
}
@end
