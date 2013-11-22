//
//  DCOccasionViewController.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/19/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCOccasionViewController.h"
#import "DCAppDelegate.h"

@interface DCOccasionViewController ()

@end

@implementation DCOccasionViewController

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
    self.scrollContainer.userInteractionEnabled = YES;
    self.scrollContainer.exclusiveTouch = YES;
    self.scrollContainer.canCancelContentTouches = YES;
    self.scrollContainer.delaysContentTouches = YES;
}
- (IBAction)birthday:(id)sender {
    [self goNext:@"birthday"];
}
- (IBAction)birthdayL:(id)sender {
    [self goNext:@"birthday"];
}
- (IBAction)anniversary:(id)sender {
    [self goNext:@"anniversary"];
}
- (IBAction)anniversaryL:(id)sender {
    [self goNext:@"anniversary"];
}
- (IBAction)feelBetter:(id)sender {
    [self goNext:@"feel"];
}
- (IBAction)feelBetterL:(id)sender {
    [self goNext:@"feel"];
}
- (IBAction)eid:(id)sender {
    [self goNext:@"eid"];
}
- (IBAction)eidL:(id)sender {
    [self goNext:@"eid"];
}
- (IBAction)ramadan:(id)sender {
    [self goNext:@"ramadan"];
}
- (IBAction)ramadanL:(id)sender {
    [self goNext:@"ramadan"];
}
- (IBAction)graduation:(id)sender {
    [self goNext:@"graduation"];
}
- (IBAction)graduationL:(id)sender {
    [self goNext:@"graduation"];
}
- (IBAction)baby:(id)sender {
    [self goNext:@"baby"];
}
- (IBAction)babyL:(id)sender {
    [self goNext:@"baby"];
}
- (IBAction)wedding:(id)sender {
    [self goNext:@"wedding"];
}
- (IBAction)weddingL:(id)sender {
    [self goNext:@"wedding"];
}
- (IBAction)memory:(id)sender {
    [self goNext:@"memory"];
}
- (IBAction)memoryL:(id)sender {
    [self goNext:@"memory"];
}
- (IBAction)xmas:(id)sender {
    [self goNext:@"xmas"];
}
- (IBAction)xmasL:(id)sender {
    [self goNext:@"xmas"];
}
- (IBAction)season:(id)sender {
    [self goNext:@"season"];
}
- (IBAction)seasonL:(id)sender {
    [self goNext:@"season"];
}
- (IBAction)other:(id)sender {
    [self goNext:@"other"];
}
- (IBAction)otherL:(id)sender {
    [self goNext:@"other"];
}

-(void)goNext:(NSString*)occasion
{
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.appData setData:occasion forKey:@"occasion"];
    [self performSegueWithIdentifier:@"donateWithAGift" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
