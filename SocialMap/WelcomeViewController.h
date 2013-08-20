//
//  WelcomeViewController.h
//  17sports
//
//  Created by mebusw on 13-6-27.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeViewController : UIViewController

@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *swipeRightRecognizer;
@property (nonatomic, strong) IBOutlet UIPageControl *ImagePageControl;
@property (weak, nonatomic) IBOutlet UIImageView *imageCurrent;
@property (weak, nonatomic) IBOutlet UIImageView *imageOld;

- (IBAction)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer;

-(IBAction)shortcuts:(id)sender;
-(IBAction)recommends:(id)sender;

@end
