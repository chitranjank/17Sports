//
//  TabBarVC.m
//  17sports
//
//  Created by mebusw on 13-8-20.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "TabBarVC.h"

@interface TabBarVC ()

@end

@implementation TabBarVC

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tabbar delegates
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    DLog(@"%d %@ %d", [tabBar.items indexOfObject:item], item.title, item.tag);
    [[NSNotificationCenter defaultCenter] postNotificationName:TAB_BAR_ITEM_CHANGED object:self];
}

@end
