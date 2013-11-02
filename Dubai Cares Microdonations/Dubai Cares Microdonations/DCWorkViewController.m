//
//  DCWorkViewController.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/2/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCWorkViewController.h"

@interface DCWorkViewController ()

@end

@implementation DCWorkViewController

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
    NSURL *websiteUrl = [NSURL URLWithString:@"http://www.dubaicares.ae/en/section/where-we-work"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:websiteUrl];
    [self.mapWebView loadRequest:requestObj];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
