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
}
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (id)initWithCoder:(NSCoder *)decoder {
    NSLog(@"nscode=%@", decoder);
    return [super initWithCoder:(NSCoder *)decoder];
}

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

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    [self.view addGestureRecognizer:self.swipeLeftRecognizer];
    [self.view addGestureRecognizer:self.swipeRightRecognizer];
    

    imagesOfMerchant = @[@"4 三源益康.jpg", @"5 帝景高尔夫.jpg", @"9 汇川马友会.jpg"];
    self.ImagePageControl.numberOfPages = [imagesOfMerchant count];
    self.ImagePageControl.currentPage = 0;
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

#define imageTop 78
#define imageLeft 40
#define imageWidth 240
#define imageHeight 128
#define screenWidth 320


- (IBAction)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
	CGPoint location = [recognizer locationInView:self.view];
    DLog(@"%f, %f,   %d", location.x, location.y, recognizer.direction);

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

/**
 * This only works on real devices.
 */
- (IBAction)callPhone:(id)sender {
    NSString *num = [[NSString alloc] initWithFormat:@"telprompt://%@",@"23556589"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]];
}
@end
