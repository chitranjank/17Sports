//
//  SwipeVC.h
//  17sports
//
//  Created by mebusw on 13-8-20.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwipeDelegate <NSObject>

-(void)onClick:(int)currentPage;

@end

@interface SwipeVC : UIViewController {
    NSArray *_images;
}

@property (nonatomic, strong) IBOutlet UIImageView *imageCurrent;
@property (nonatomic, strong) IBOutlet UIImageView *imageOld;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *swipeRightRecognizer;
@property (nonatomic, strong) IBOutlet UIPageControl *ImagePageControl;

@property (weak, nonatomic) id<SwipeDelegate> delegate;
@property (nonatomic, strong) NSArray *images;


- (IBAction)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer;
- (IBAction)onClick:(id)sender;
@end
