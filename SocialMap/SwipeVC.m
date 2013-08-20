//
//  SwipeVC.m
//  17sports
//
//  Created by mebusw on 13-8-20.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "SwipeVC.h"

@interface SwipeVC () {
    NSArray *images;
}

@end

@implementation SwipeVC

#define imageTop 0
#define imageLeft 0
#define imageWidth 320
#define imageHeight 100
#define screenWidth 320

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
    [self.view addGestureRecognizer:self.swipeLeftRecognizer];
    [self.view addGestureRecognizer:self.swipeRightRecognizer];

    
    images = @[@"recommends.jpg"];
    self.ImagePageControl.numberOfPages = [images count];
    self.ImagePageControl.currentPage = 0;
    self.imageCurrent.image = [UIImage imageNamed:images[0]];
    
    [self.view setFrame:CGRectMake(imageLeft, imageTop, imageWidth, imageHeight)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
	CGPoint location = [recognizer locationInView:self.view];
    DLog(@"%f, %f,   direction=%d", location.x, location.y, recognizer.direction);

    self.imageOld.image = self.imageCurrent.image;
    [self.imageOld setFrame:CGRectMake(imageLeft, imageTop, imageWidth, imageHeight)];
    self.imageOld.hidden = NO;
    int count = [images count];
    int current = self.ImagePageControl.currentPage;
    int next;
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        next = (current + count - 1) % count;
        
        self.imageCurrent.image = [UIImage imageNamed:images[next]];
        [self.imageCurrent setFrame:CGRectMake(screenWidth, imageTop, imageWidth, imageHeight)];
        
        [UIView animateWithDuration:0.55 animations:^{
            [self.imageCurrent setFrame:CGRectMake(imageLeft, imageTop, imageWidth, imageHeight)];
            [self.imageOld setFrame:CGRectMake(-screenWidth, imageTop, imageWidth, imageHeight)];
        }];
    } else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight){
        next = (current + count + 1) % count;
        
        self.imageCurrent.image = [UIImage imageNamed:images[next]];
        [self.imageCurrent setFrame:CGRectMake(-screenWidth, imageTop, imageWidth, imageHeight)];
        
        [UIView animateWithDuration:0.55 animations:^{
            [self.imageCurrent setFrame:CGRectMake(imageLeft, imageTop, imageWidth, imageHeight)];
            [self.imageOld setFrame:CGRectMake(screenWidth, imageTop, imageWidth, imageHeight)];
        }];
    }
    self.ImagePageControl.currentPage = next;
    
}

-(IBAction)recommends:(id)sender {
    DLog(@"tag=%d", ((UIButton*)sender).tag);
    
//    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
//    [self.parentViewController.navigationController pushViewController:detailVC animated:YES];
}

@end
