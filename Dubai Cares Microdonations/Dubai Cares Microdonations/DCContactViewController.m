//
//  DCContactViewController.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/18/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCContactViewController.h"

@interface DCContactViewController ()

@end

@implementation DCContactViewController

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
- (IBAction)facebookOpen:(id)sender {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/DubaiCares"]];
}
- (IBAction)twitterOpen:(id)sender {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/DubaiCares"]];
}
- (IBAction)youtubeOpen:(id)sender {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/user/DubaiCaresUAE"]];
}
- (IBAction)instagramOpen:(id)sender {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://instagram.com/dubaicares"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
