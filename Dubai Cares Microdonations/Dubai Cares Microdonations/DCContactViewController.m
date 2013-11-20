//
//  DCContactViewController.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/18/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCContactViewController.h"
#import "SVModalWebViewController.h"

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
    SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:@"https://www.facebook.com/DubaiCares"];
    [self presentViewController:webViewController animated:YES completion:NULL];
}
- (IBAction)twitterOpen:(id)sender {
    SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:@"https://twitter.com/DubaiCares"];
    [self presentViewController:webViewController animated:YES completion:NULL];
}
- (IBAction)youtubeOpen:(id)sender {
    SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:@"http://www.youtube.com/user/DubaiCaresUAE"];
    [self presentViewController:webViewController animated:YES completion:NULL];
}
- (IBAction)instagramOpen:(id)sender {
        SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:@"http://instagram.com/dubaicares"];
    [self presentViewController:webViewController animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
