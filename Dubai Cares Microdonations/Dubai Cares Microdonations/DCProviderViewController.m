//
//  DCProviderViewController.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/20/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCProviderViewController.h"
#import "DCAppDelegate.h"

@interface DCProviderViewController ()

@end

@implementation DCProviderViewController

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
- (IBAction)etisalat:(id)sender {
    [self goNext:@"etisalat"];
}
- (IBAction)du:(id)sender {
    [self goNext:@"du"];
}
- (IBAction)goBack:(id)sender {
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([[appDelegate.appData dataForKey:@"mode"] isEqualToString:@"donation"])
    {
        [self performSegueWithIdentifier:@"backToAmount1" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"backToEditMessage" sender:self];
    }
}

- (void) goNext:provider {
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.appData setData:provider forKey:@"provider"];
    [self performSegueWithIdentifier:@"toConfirm" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
