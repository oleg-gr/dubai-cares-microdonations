//
//  DCEditMessageViewController.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/20/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCEditMessageViewController.h"
#import "DCAppDelegate.h"
#define IS_IPHONE_4 ([[UIScreen mainScreen] bounds].size.height == 480.0f)

@interface DCEditMessageViewController ()

@end

@implementation DCEditMessageViewController

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
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, IS_IPHONE_4 ? 35 : 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleDone target:self action:@selector(clearText)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyboard)],
                           nil];
    self.message.delegate = self;
    self.message.inputAccessoryView = numberToolbar;
    
    UITapGestureRecognizer *tapOutOfText = [[UITapGestureRecognizer alloc]
                                            initWithTarget:self
                                            action:@selector(dismissKeyboard)];
    [tapOutOfText setCancelsTouchesInView:YES];
    [self.view addGestureRecognizer:tapOutOfText];
    
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString *occasion = [appDelegate.appData dataForKey:@"occasion"];
    NSString *name = [appDelegate.appData dataForKey:@"name"];
    if ([name isEqualToString:@"none"])
    {
        name = @"";
    }
    else
    {
        name = [NSString stringWithFormat:@" %@", name];
    }
    NSNumber *amount = [appDelegate.appData dataForKey:@"amount"];
    NSString *myString;
    if ([occasion isEqualToString:@"birthday"])
    {
        myString = [NSString stringWithFormat:@"%@%@%s%@%s", @"Hi", name, "! Happy Birthday! I just donated AED ", amount, " to Dubai Cares in celebration of this wonderful day."];
    }
    else if ([occasion isEqualToString:@"anniversary"])
    {
        myString = [NSString stringWithFormat:@"%@%@%s%@%s", @"Hi", name, "! Congratulations on your wedding anniversary. I just donated AED ", amount, " to Dubai Cares to celebrate the occasion."];
    }
    else if ([occasion isEqualToString:@"feel"])
    {
        myString = [NSString stringWithFormat:@"%@%@%s%@%s", @"Hi", name, ". Wishing you a quick recovery and good health, I just donated AED ", amount, " to Dubai Cares in your name. Get well soon!"];
    }
    else if ([occasion isEqualToString:@"eid"])
    {
        myString = [NSString stringWithFormat:@"%@%@%s%@%s", @"Hi", name, "! Eid Mubarak! Wishing you a blessed Eid. I just donated AED ", amount, " to Dubai Cares in in your name."];
    }
    else if ([occasion isEqualToString:@"ramadan"])
    {
        myString = [NSString stringWithFormat:@"%@%@%s%@%s", @"Hi", name, "! Ramadan Mubarak! I just donated AED ", amount, " to Dubai Cares in your name."];
    }
    else if ([occasion isEqualToString:@"graduation"])
    {
        myString = [NSString stringWithFormat:@"%@%@%s%@%s", @"Hi", name, "! Congratulations with you graduation!  I just donated AED ", amount, " to Dubai Cares in celebration of this glorious day."];
    }
    else if ([occasion isEqualToString:@"baby"])
    {
        myString = [NSString stringWithFormat:@"%@%@%s%@%s", @"Hi", name, "! Congratulations on your new role as proud parents of a happy baby! I just donated AED ", amount, " to Dubai Cares in celebration of this joyous occasion."];
    }
    else if ([occasion isEqualToString:@"wedding"])
    {
        myString = [NSString stringWithFormat:@"%@%@%s%@%s", @"Hi", name, "! Congratulations on your wedding! I just donated AED ", amount, " to Dubai Cares in celebration of this joyous occasion."];
    }
    else if ([occasion isEqualToString:@"memory"])
    {
        myString = [NSString stringWithFormat:@"%@%@%s%@%s", @"Hi", name, ". I just donated AED ", amount, " to Dubai Cares in memory of [name]. Always in our thoughts, forever in our hearts."];
    }
    else if ([occasion isEqualToString:@"xmas"])
    {
        myString = [NSString stringWithFormat:@"%@%@%s%@%s", @"Hi", name, "! Merry Christmas! I just donated AED ", amount, " to Dubai Cares in your name."];
    }
    else if ([occasion isEqualToString:@"season"])
    {
        myString = [NSString stringWithFormat:@"%@%@%s%@%s", @"Hi", name, "! Happy Holidays! I just donated AED ", amount, " to Dubai Cares in your name."];
    }
    else if ([occasion isEqualToString:@"other"])
    {
        myString = [NSString stringWithFormat:@"%@%@%s%@%s", @"Hi", name, "! I just donated AED ", amount, " to Dubai Cares in your name."];
    }
    else
    {
        myString = @"";
    }
    
    [self.message setText:myString];
	// Do any additional setup after loading the view.
}

- (void) viewDidLayoutSubviews
{
    [super viewWillLayoutSubviews];
    if (IS_IPHONE_4)
    {
        self.backButton.center = CGPointMake(160, 430);
    }
}

- (IBAction)backToContact:(id)sender {
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.appData setData:@"none" forKey:@"name"];
    [self performSegueWithIdentifier:@"backToContact" sender:self];
}

- (IBAction)clear:(id)sender {
    [self.message setText:@""];
}
- (IBAction)goNext:(id)sender {
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.appData setData:[self.message text] forKey:@"message"];
    [self performSegueWithIdentifier:@"toSelectProvider" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self.view setFrame:CGRectMake(0, IS_IPHONE_4 ? -102 : -50, self.view.frame.size.width, self.view.frame.size.height)];
                         [self.okButton setCenter:CGPointMake(self.okButton.center.x, self.okButton.center.y-18)];
                     }
                     completion:nil];
}

- (void)textViewDidEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                          [self.okButton setCenter:CGPointMake(self.okButton.center.x, self.okButton.center.y+18)];
                     }
                     completion:nil];
}

- (void)clearText
{
    [self.message setText:@""];
}

- (void)dismissKeyboard
{
    [self.message resignFirstResponder];
}
@end
