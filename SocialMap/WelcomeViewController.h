//
//  WelcomeViewController.h
//  17sports
//
//  Created by mebusw on 13-6-27.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeVC.h"

@interface WelcomeViewController : UIViewController<SwipeDelegate>


@property (weak, nonatomic) IBOutlet UIView *containerView;


-(IBAction)shortcuts:(id)sender;




@end
