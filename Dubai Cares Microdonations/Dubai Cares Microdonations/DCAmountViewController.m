//
//  DCAmountViewController.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/19/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCAmountViewController.h"
#import "DCAppDelegate.h"

@interface DCAmountViewController ()

@end

@implementation DCAmountViewController

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
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSLog(@"%@,%@", [appDelegate.appData dataForKey:@"mode"], [appDelegate.appData dataForKey:@"occasion"]);
	// Do any additional setup after loading the view.
}
- (IBAction)back:(id)sender {
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([[appDelegate.appData dataForKey:@"mode"] isEqualToString:@"donation"])
        {
            [self performSegueWithIdentifier:@"backToMain" sender:self];
        }
        else
        {
            [self performSegueWithIdentifier:@"backToGift" sender:self];
        }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
