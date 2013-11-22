//
//  DCChooseContactViewController.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/19/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCChooseContactViewController.h"
#import "DCAppDelegate.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#define IS_IPHONE_4 ([[UIScreen mainScreen] bounds].size.height == 480.0f)

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
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleDone target:self action:@selector(clearText)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyboard)],
                           nil];
    [numberToolbar sizeToFit];
    self.phoneNumber.delegate = self;
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
    [tapOutOfText setCancelsTouchesInView:YES];
    [self.view addGestureRecognizer:tapOutOfText];
	// Do any additional setup after loading the view.
}

-(void)clearText
{
    [self.phoneNumber setText:@""];
}

-(void)dismissKeyboard
{
    [self.phoneNumber resignFirstResponder];
}

- (IBAction)chooseContact:(id)sender {
    ABPeoplePickerNavigationController *picker =
    [[ABPeoplePickerNavigationController alloc] init];
    NSArray *propertiesToShow = [NSArray arrayWithObjects:
                                 [NSNumber numberWithInt:kABPersonPhoneProperty], nil];
    [picker setDisplayedProperties:propertiesToShow];
    picker.peoplePickerDelegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    return YES;
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
    if (property == kABPersonPhoneProperty)
    {
        ABMultiValueRef phones = ABRecordCopyValue(person, property);
        NSString *firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        CFStringRef phoneNumber = ABMultiValueCopyValueAtIndex(phones, identifier);
        NSMutableString *tmp = [NSMutableString stringWithFormat:@"%@", (__bridge NSString *)phoneNumber];
        NSString *strippedPhoneNumber = [tmp stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"()-"];
        strippedPhoneNumber = [[strippedPhoneNumber componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];
        [self.phoneNumber setText:strippedPhoneNumber];
        DCAppDelegate *appDelegate = (DCAppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.appData setData:firstName forKey:@"name"];
        [peoplePicker dismissViewControllerAnimated:YES completion:nil];
        return NO;
    }
    else
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                          message:@"Selected field is not a phone number"
                                                         delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
        return YES;
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self.view setFrame:CGRectMake(0, IS_IPHONE_4 ? -110 : -50, self.view.frame.size.width, self.view.frame.size.height)];
                     }
                     completion:nil];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                     }
                     completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
