//
//  DCConfirmationViewController.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/20/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCConfirmationViewController.h"
#import "DCAppDelegate.h"

@interface DCConfirmationViewController ()

@end

@implementation DCConfirmationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)confirm:(id)sender {
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    [self.amount setText:[NSString stringWithFormat:@"%@%@", @"AED ", [appDelegate.appData dataForKey:@"amount"]]];
    [self.provider setText:[appDelegate.appData dataForKey:@"provider"]];
    if ([[appDelegate.appData dataForKey:@"mode"] isEqualToString:@"donation"])
    {
        [self.message setText:@""];
        [self.messageLabel setText:@""];
    }
    else
    {
        [self.message setText:[appDelegate.appData dataForKey:@"message"]];
        [self.messageLabel setText:@"Your message:"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
