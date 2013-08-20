//
//  SwipeVC.h
//  17sports
//
//  Created by mebusw on 13-8-20.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeVC : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageCurrent;
@property (weak, nonatomic) IBOutlet UIImageView *imageOld;

@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *swipeRightRecognizer;
@property (nonatomic, strong) IBOutlet UIPageControl *ImagePageControl;

- (IBAction)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer;
- (IBAction)recommends:(id)sender;
@end
