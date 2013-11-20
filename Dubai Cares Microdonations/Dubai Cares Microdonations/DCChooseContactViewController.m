//
//  DCChooseContactViewController.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/19/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCChooseContactViewController.h"
#import "DCAppDelegate.h"
#import <AddressBookUI/AddressBookUI.h>

@interface DCChooseContactViewController ()

@end

@implementation DCChooseContactViewController

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
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    self.phoneNumber.inputAccessoryView = numberToolbar;
    
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.appData setData:@"none" forKey:@"name"];
    NSString *phone = [appDelegate.appData dataForKey:@"phone"];
    if (![phone isEqualToString:@"none"])
    {
        [self.phoneNumber setText:phone];
    }
    UITapGestureRecognizer *tapOutOfText = [[UITapGestureRecognizer alloc]
                                            initWithTarget:self
                                            action:@selector(dismissKeyboard)];
    [tapOutOfText setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tapOutOfText];
	// Do any additional setup after loading the view.
}

-(void)doneWithNumberPad{
//    NSString *numberFromTheKeyboard = numberTextField.text;
    [self.phoneNumber resignFirstResponder];
}

-(void)dismissKeyboard
{
    [self.phoneNumber resignFirstResponder];
}

- (IBAction)chooseContact:(id)sender {
    ABPeoplePickerNavigationController *picker =
    [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    ABMultiValueRef phones = (ABMultiValueRef) ABRecordCopyValue(person, kABPersonPhoneProperty);
    NSString *firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    NSString *phoneNumber = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phones, 0);
    NSMutableString *tmp = [NSMutableString stringWithFormat:@"%@", phoneNumber];
    NSString *strippedPhoneNumber = [tmp stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"()-"];
    strippedPhoneNumber = [[strippedPhoneNumber componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];
    [self.phoneNumber setText:strippedPhoneNumber];
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.appData setData:firstName forKey:@"name"];
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
    return NO;
}

- (IBAction)goNext:(id)sender {
    [self goNextLogic];
}

- (void) goNextLogic
{
    DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"()-+"];
    NSString *number = [[self.phoneNumber.text componentsSeparatedByCharactersInSet: doNotWant]componentsJoinedByString: @""];
    NSString *phoneRegex = @"[0-9]{8,14}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    BOOL phoneValidates = [phoneTest evaluateWithObject:number];
    if (phoneValidates)
    {
        [appDelegate.appData setData:self.phoneNumber.text forKey:@"phone"];
        [self performSegueWithIdentifier:@"toMessageEdit" sender:self];
    }
    else
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                          message:@"Invalid phone number"
                                                         delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
