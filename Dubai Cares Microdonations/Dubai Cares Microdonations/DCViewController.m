//
//  DCViewController.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/2/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCViewController.h"
#import "DCAppDelegate.h"

@interface DCViewController ()

@end

@implementation DCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.appData clear];
}

- (IBAction)becomeSupporter:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.dubaicares.ae/en/section/get-involved/become-a-supporter"]];
}

- (IBAction)sendGift:(id)sender {
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.appData setData:@"gift" forKey:@"mode"];
    [self performSegueWithIdentifier:@"sendGift" sender:self];
}

- (IBAction)donate:(id)sender {
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.appData setData:@"donation" forKey:@"mode"];
    [self performSegueWithIdentifier:@"donate" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
