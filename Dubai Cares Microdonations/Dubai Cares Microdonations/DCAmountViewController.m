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
	// Do any additional setup after loading the view.
}

- (IBAction)aed30:(id)sender {
    [self goNext:[NSNumber numberWithInt:30]];
}
- (IBAction)aed60:(id)sender {
    [self goNext:[NSNumber numberWithInt:60]];
}
- (IBAction)aed90:(id)sender {
    [self goNext:[NSNumber numberWithInt:90]];
}
- (IBAction)aed300:(id)sender {
    [self goNext:[NSNumber numberWithInt:300]];
}
- (IBAction)aed600:(id)sender {
    [self goNext:[NSNumber numberWithInt:600]];
}
- (IBAction)aed900:(id)sender {
    [self goNext:[NSNumber numberWithInt:900]];
}

-(void)goNext:(NSNumber*)amount
{
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.appData setData:amount forKey:@"amount"];
    if ([[appDelegate.appData dataForKey:@"mode"] isEqualToString:@"donation"])
    {
        [self performSegueWithIdentifier:@"toSelectProvider1" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"toContact" sender:self];
    }
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
