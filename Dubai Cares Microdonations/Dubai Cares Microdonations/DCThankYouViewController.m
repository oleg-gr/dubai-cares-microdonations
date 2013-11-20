//
//  DCThankYouViewController.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/20/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCThankYouViewController.h"
#import <Social/Social.h>
#import "DCAppDelegate.h"

@interface DCThankYouViewController ()

@end

@implementation DCThankYouViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)postFacebook:(id)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *facebookSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
        [facebookSheet setInitialText:[NSString stringWithFormat:@"I just donated AED %@ to Dubai Cares!", [appDelegate.appData dataForKey:@"amount"]]];
        [facebookSheet addURL:[NSURL URLWithString:@"http://www.dubaicares.ae/en/donation"]];
        [self presentViewController:facebookSheet animated:YES completion:Nil];
    }
    else
    {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Not logged in to Facebook." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
    }
}
- (IBAction)postTweeter:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:[NSString stringWithFormat:@"I just donated AED %@ to Dubai Cares!", [appDelegate.appData dataForKey:@"amount"]]];
        [tweetSheet addURL:[NSURL URLWithString:@"http://www.dubaicares.ae/en/donation"]];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else
    {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Not logged in to Tweeter." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
    }
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

@end
