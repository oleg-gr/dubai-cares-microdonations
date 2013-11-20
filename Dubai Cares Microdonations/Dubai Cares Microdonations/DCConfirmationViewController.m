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
    if(![MFMessageComposeViewController canSendText])
    {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
    }
    else
    {
        DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
        NSString *providerNumber;
        NSNumber *amount = [appDelegate.appData dataForKey:@"amount"];
        NSString *provider = [appDelegate.appData dataForKey:@"provider"];
        if ([amount isEqualToNumber:[NSNumber numberWithInt:30]])
        {
            providerNumber = @"9030";
        }
        else if ([amount isEqualToNumber:[NSNumber numberWithInt:60]])
        {
            if ([provider isEqualToString:@"etisalat"])
            {
                providerNumber = @"9060";
            }
            else
            {
                providerNumber = @"9460";
            }
        }
        else if ([amount isEqualToNumber:[NSNumber numberWithInt:90]])
        {
            providerNumber = @"9090";
        }
        else if ([amount isEqualToNumber:[NSNumber numberWithInt:300]])
        {
            providerNumber = @"9300";
        }
        else if ([amount isEqualToNumber:[NSNumber numberWithInt:300]])
        {
            providerNumber = @"9600";
        }
        else if ([amount isEqualToNumber:[NSNumber numberWithInt:300]])
        {
            providerNumber = @"9900";
        }
        NSString *recepient = [appDelegate.appData dataForKey:@"phone"];
        NSString *message;
        NSArray *recipents;
        if (![recepient isEqualToString:@"none"])
        {
             recipents = @[[appDelegate.appData dataForKey:@"phone"], providerNumber];
             message = [appDelegate.appData dataForKey:@"message"];
        }
        else
        {
            recipents = @[providerNumber];
            message = @"Dubai cares donation";
        }
        MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
        messageController.messageComposeDelegate = self;
        [messageController setRecipients:recipents];
        [messageController setBody:message];
        
        // Present message view controller on screen
        [self presentViewController:messageController animated:YES completion:nil];
        return;
    }
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

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    [self dismissViewControllerAnimated:YES completion:^{
        switch (result) {
            case MessageComposeResultCancelled:
                break;
                
            case MessageComposeResultFailed:
            {
                UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [warningAlert show];
                break;
            }
                
            case MessageComposeResultSent:
                NSLog(@"asdas");
                [self performSegueWithIdentifier:@"toThankYou" sender:self];
                break;
                
            default:
                break;
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
