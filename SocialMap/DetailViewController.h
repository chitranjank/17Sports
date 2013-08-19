//
//  DetailViewController.h
//  SocialMap
//
//  Created by mebusw on 13-4-5.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;


@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UIButton *btnPhone;
@property (weak, nonatomic) IBOutlet UIButton *btnAddress;

@property (weak, nonatomic) IBOutlet UIImageView *imageCurrent;
@property (weak, nonatomic) IBOutlet UIImageView *imageOld;

@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *swipeRightRecognizer;
@property (nonatomic, strong) IBOutlet UIPageControl *ImagePageControl;

- (IBAction)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer;

@end
