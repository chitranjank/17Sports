//
//  MainViewController.h
//  SocialMap
//
//  Created by mebusw on 13-6-12.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UIView *container;
@property (strong, nonatomic) NSArray *merchants;

-(IBAction) toogleListAndMap;

@end
