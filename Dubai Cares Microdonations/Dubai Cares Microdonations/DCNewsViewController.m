//
//  DCNewsViewController.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/18/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCNewsViewController.h"
#import "Reachability.h"
#import "SVModalWebViewController.h"

@interface DCNewsViewController ()

@end

@implementation DCNewsViewController

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
    isInitialRequest = YES;
    [self checkInternetConnection];
    NSURL *websiteUrl = [NSURL URLWithString:@"http://www.dubaicares.ae/en/section/media-library/news-releases"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:websiteUrl];
    [self.mapWebView loadRequest:requestObj];
    self.loadingIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(self.mapWebView.frame.size.width/2-10, self.mapWebView.frame.size.height/2-10,20,20)];
    self.mapWebView.delegate = self;
    [self.loadingIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.loadingIndicator setHidesWhenStopped:YES];
    [self.mapWebView.scrollView setBounces:NO];
    self.mapWebView.scrollView.contentInset = UIEdgeInsetsMake(-165, 0, -130, -95);
    [self.mapWebView addSubview:self.loadingIndicator];
}

-(void)checkInternetConnection {
    Reachability *r = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    NetworkStatus internetStatus = [r currentReachabilityStatus];
    
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                          message:@"This page requires internet connection"
                                                         delegate:self
                                                cancelButtonTitle:@"Retry"
                                                otherButtonTitles:@"Go back", nil];
        [message show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self checkInternetConnection];
        NSURL *websiteUrl = [NSURL URLWithString:@"http://www.dubaicares.ae/en/section/media-library/news-releases"];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:websiteUrl];
        [self.mapWebView loadRequest:requestObj];
    }
    else
    {
        [self performSegueWithIdentifier:@"backToMain2" sender:self];
    }
}

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (!isInitialRequest)
    {
        NSString *url = [[request URL] absoluteString];
        SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:url];
        [self presentViewController:webViewController animated:YES completion:NULL];
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.loadingIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.loadingIndicator stopAnimating];
    isInitialRequest = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
