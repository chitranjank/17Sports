//
//  MainViewController.m
//  SocialMap
//
//  Created by mebusw on 13-6-12.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "MainViewController.h"
#import "SearchResultViewController.h"
#import "DetailViewController.h"
#import "MapViewController.h"


@interface MainViewController () {
    UIViewController *listView;
    UIImageView *v1, *v2;
}

@end

@implementation MainViewController

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
    
    v1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1 复康路游泳馆.jpg"]];
    v2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3 游泳跳水馆.jpg"]];
    
    //MapViewController *v3 = [[MapViewController alloc] init];
    //[self.view addSubview:v1];
    DLog(@"c=%@  ||| %@", self.container, self.container.subviews);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//@property (weak, nonatomic) IBOutlet UIView *container;

-(IBAction) toogleListAndMap {
    DLog(@"toogle");
    static int c =1;
    c++;
    

    
    /*
    SearchResultViewController *listView = [[SearchResultViewController alloc] initWithNibName:@"SearchResultView" bundle:nil];
    */
    
    if (c%2==0) {
        [UIView transitionWithView:self.container
                          duration:0.8
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{ [v1 removeFromSuperview]; [self.container addSubview:v2]; }
                        completion:NULL];
     
    } else {
        [UIView transitionWithView:self.container
                          duration:0.8
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{ [v2 removeFromSuperview]; [self.container addSubview:v1]; }
                        completion:NULL];
        
    }
    
    
}

@end
